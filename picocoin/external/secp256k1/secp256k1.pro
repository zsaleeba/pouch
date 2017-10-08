#-------------------------------------------------
#
# Project created by QtCreator 2017-10-08T18:08:22
#
#-------------------------------------------------

QT       -= core gui

TARGET = secp256k1
TEMPLATE = lib
CONFIG += staticlib

QMAKE_CFLAGS += -DHAVE_CONFIG_H -I. -DSECP256K1_BUILD -std=c89

INCLUDEPATH += src
DEPENDPATH += src

SOURCES += \
    src/secp256k1.c

HEADERS += \
    src/basic-config.h \
    src/ecdsa.h \
    src/ecdsa_impl.h \
    src/eckey.h \
    src/eckey_impl.h \
    src/ecmult.h \
    src/ecmult_const.h \
    src/ecmult_const_impl.h \
    src/ecmult_gen.h \
    src/ecmult_gen_impl.h \
    src/ecmult_impl.h \
    src/ecmult_static_context.h \
    src/field.h \
    src/field_5x52.h \
    src/field_5x52_asm_impl.h \
    src/field_5x52_impl.h \
    src/field_5x52_int128_impl.h \
    src/field_10x26.h \
    src/field_10x26_impl.h \
    src/field_impl.h \
    src/group.h \
    src/group_impl.h \
    src/hash.h \
    src/hash_impl.h \
    src/libsecp256k1-config.h \
    src/num.h \
    src/num_gmp.h \
    src/num_gmp_impl.h \
    src/num_impl.h \
    src/scalar.h \
    src/scalar_4x64.h \
    src/scalar_4x64_impl.h \
    src/scalar_8x32.h \
    src/scalar_8x32_impl.h \
    src/scalar_impl.h \
    src/scalar_low.h \
    src/scalar_low_impl.h \
    src/util.h
unix {
    target.path = /usr/lib
    INSTALLS += target
}
