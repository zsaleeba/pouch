#-------------------------------------------------
#
# Project created by QtCreator 2017-10-06T18:19:23
#
#-------------------------------------------------

QT       -= core gui

TARGET = lib
TEMPLATE = lib
CONFIG += staticlib

INCLUDEPATH += .. ../include $$PWD/../external/secp256k1/contrib
DEPENDPATH += .. ../include $$PWD/../external/secp256k1/contrib

SOURCES += \
    address.c \
    addr_match.c \
    base58.c \
    bignum.c \
    blkdb.c \
    block.c \
    blockfile.c \
    bloom.c \
    buffer.c \
    buint.c \
    checkpoints.c \
    clist.c \
    core.c \
    coredefs.c \
    cstr.c \
    file_seq.c \
    hashtab.c \
    hdkeys.c \
    hexcode.c \
    key.c \
    keyset.c \
    keystore.c \
    log.c \
    mbr.c \
    memmem.c \
    message.c \
    parr.c \
    script.c \
    script_eval.c \
    script_names.c \
    script_sign.c \
    serialize.c \
    util.c \
    utxo.c \
    wallet.c \
    crypto/aes_util.c \
    crypto/ctaes.c \
    crypto/fortuna.c \
    crypto/hmac.c \
    crypto/prng.c \
    crypto/random.c \
    crypto/rijndael.c \
    crypto/ripemd160.c \
    crypto/sha1.c \
    crypto/sha2.c \
    net/dns.c \
    net/net.c \
    net/netbase.c \
    net/peerman.c

HEADERS +=
unix {
    target.path = /usr/lib
    INSTALLS += target
}
