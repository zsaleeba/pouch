TEMPLATE = app
CONFIG += console
CONFIG -= app_bundle
CONFIG -= qt

INCLUDEPATH += .. ../include
DEPENDPATH += .. ../include

SOURCES += main.c \
    blkscan.c \
    blkstats.c \
    brd.c \
    rawtx.c \
    wallet.c

HEADERS += \
    brd.h \
    picocoin.h \
    wallet.h
