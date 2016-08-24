#! /bin/bash

LOCALDIR=$1;

cd build/qio
../../src/qio/configure --prefix=$(LOCALDIR)/install/qio --with-qmp=$(LOCALDIR)/install/qmp --enable-largefile --enable-dml-output-buffering  CC=gcc CFLAGS="-Wall -O3 -std=gnu99 -march=native -msse2 -mfpmath=sse -ffast-math -funroll-loops -fprefetch-loop-arrays -fomit-frame-pointer"
make -j8
make install
make check
cd ../..


