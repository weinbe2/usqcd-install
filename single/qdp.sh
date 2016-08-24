#! /bin/bash

LOCALDIR=$1;

cd build/qdp
../../src/qdp/configure --prefix=$(LOCALDIR)/install/qdp --enable-sse2 CC=gcc  --with-qmp=$(LOCALDIR)/install/qmp --with-qio=$(LOCALDIR)/install/qio --with-qla=$(LOCALDIR)/install/qla CFLAGS="-Wall -O3 -std=gnu99 -march=native -msse2 -mfpmath=sse -ffast-math -funroll-loops -fprefetch-loop-arrays -fomit-frame-pointer -fopenmp"
make -j8
make install
make check
cd ../..


