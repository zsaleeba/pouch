/* Copyright 2012 exMULTI, Inc.
 * Distributed under the MIT/X11 software license, see the accompanying
 * file COPYING or http://www.opensource.org/licenses/mit-license.php.
 */
#include "picocoin-config.h"

#include <ccoin/core.h>
#include <ccoin/script.h>
#include <ccoin/key.h>
#include <ccoin/clist.h>
#include <ccoin/addr_match.h>
#include <ccoin/compat.h>		/* for parr_new */

bool bp_txout_match(const struct bp_txout *txout,
		    const struct bp_keyset *ks)
{
	if (!txout || !txout->scriptPubKey || !ks)
		return false;

	bool rc = false;

	struct bscript_addr addrs;
	if (!bsp_addr_parse(&addrs, txout->scriptPubKey->str,
			    txout->scriptPubKey->len))
		return false;

	struct const_buffer *buf;
	clist *tmp = addrs.pub;
	while (tmp) {
		buf = tmp->data;
		tmp = tmp->next;

		if (bpks_lookup(ks, buf->p, buf->len, false)) {
			rc = true;
			goto out;
		}
	}

	tmp = addrs.pubhash;
	while (tmp) {
		buf = tmp->data;
		tmp = tmp->next;

		if (bpks_lookup(ks, buf->p, buf->len, true)) {
			rc = true;
			goto out;
		}
	}

out:
	clist_free_ext(addrs.pub, buffer_freep);
	clist_free_ext(addrs.pubhash, buffer_freep);

	return rc;
}

bool bp_tx_match(const struct bp_tx *tx, const struct bp_keyset *ks)
{
	if (!tx || !tx->vout || !ks)
		return false;

	unsigned int i;
	for (i = 0; i < tx->vout->len; i++) {
		struct bp_txout *txout;

		txout = parr_idx(tx->vout, i);
		if (bp_txout_match(txout, ks))
			return true;
	}

	return false;
}

bool bp_tx_match_mask(mpz_t mask, const struct bp_tx *tx,
		      const struct bp_keyset *ks)
{
	if (!tx || !tx->vout || !ks || !mask)
		return false;

	mpz_set_ui(mask, 0);

	unsigned int i;
	for (i = 0; i < tx->vout->len; i++) {
		struct bp_txout *txout;

		txout = parr_idx(tx->vout, i);
		if (bp_txout_match(txout, ks))
			mpz_setbit(mask, i);
	}

	return true;
}

void bbm_init(struct bp_block_match *match)
{
	memset(match, 0, sizeof(*match));

	mpz_init(match->mask);
}

struct bp_block_match *bbm_new(void)
{
	struct bp_block_match *match = malloc(sizeof(struct bp_block_match));
	if (!match)
		return NULL;

	bbm_init(match);
	match->self_alloc = true;

	return match;
}

void bbm_free(void *match_)
{
	struct bp_block_match *match = match_;
	if (!match)
		return;

	mpz_clear(match->mask);

	if (match->self_alloc)
		free(match);
}

parr *bp_block_match(const struct bp_block *block,
			  const struct bp_keyset *ks)
{
	if (!block || !block->vtx || !ks)
		return NULL;

	parr *arr = parr_new(block->vtx->len, bbm_free);
	if (!arr)
		return NULL;

	mpz_t tmp_mask;
	mpz_init(tmp_mask);

	unsigned int n;
	for (n = 0; n < block->vtx->len; n++) {
		struct bp_tx *tx;

		tx = parr_idx(block->vtx, n);
		if (!bp_tx_match_mask(tmp_mask, tx, ks))
			goto err_out;

		if (mpz_sgn(tmp_mask) != 0) {
			struct bp_block_match *match;

			match = bbm_new();
			match->n = n;
			mpz_set(match->mask, tmp_mask);

			parr_add(arr, match);
		}
	}

	mpz_clear(tmp_mask);
	return arr;

err_out:
	mpz_clear(tmp_mask);
	parr_free(arr, true);
	return NULL;
}

