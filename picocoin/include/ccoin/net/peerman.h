#ifndef __LIBCCOIN_NET_PEERMAN_H__
#define __LIBCCOIN_NET_PEERMAN_H__
/* Copyright 2012 exMULTI, Inc.
 * Distributed under the MIT/X11 software license, see the accompanying
 * file COPYING or http://www.opensource.org/licenses/mit-license.php.
 */

#include <ccoin/clist.h>                // for clist
#include <ccoin/core.h>                 // for bp_addr_free, bp_addr_init, etc
#include <ccoin/cstr.h>                 // for cstring

#include <stdbool.h>                    // for bool
#include <stdint.h>                     // for int64_t, uint32_t
#include <string.h>                     // for memcpy, memset

struct peer {
	/* serialized */
	struct bp_address	addr;

	int64_t			last_ok;
	uint32_t		n_ok;

	int64_t			last_fail;
	uint32_t		n_fail;

	/* calculated at runtime */
	unsigned char		group[20];
	unsigned int		group_len;
};

static inline void peer_init(struct peer *peer)
{
	memset(peer, 0, sizeof(*peer));
	bp_addr_init(&peer->addr);
}

static inline void peer_free(struct peer *peer)
{
	bp_addr_free(&peer->addr);
}

static inline void peer_copy(struct peer *dest, const struct peer *src)
{
	memcpy(dest, src, sizeof(*dest));
}

extern bool deser_peer(unsigned int protover,
		       struct peer *peer, struct const_buffer *buf);
extern void ser_peer(cstring *s, unsigned int protover, const struct peer *peer);

struct peer_manager {
	struct bp_hashtab *map_addr;	/* binary IP addr -> struct peer */
	clist		*addrlist;	/* of struct bp_address */
};

extern void peerman_free(struct peer_manager *peers);
extern struct peer_manager *peerman_read(void *peer_file);
extern struct peer_manager *peerman_seed(bool use_dns);
extern bool peerman_write(struct peer_manager *peers, void *peer_file, const struct chain_info *chain);
extern struct peer *peerman_pop(struct peer_manager *peers);
extern void peerman_sort(struct peer_manager *peers);
extern void peerman_add(struct peer_manager *peers,
		 const struct peer *peer_in, bool known_working);
extern void peerman_add_addr(struct peer_manager *peers,
		 const struct bp_address *addr_in, bool known_working);
extern void peerman_addstr(struct peer_manager *peers, const char *addr_str);

#endif /* __LIBCCOIN_NET_PEERMAN_H__ */
