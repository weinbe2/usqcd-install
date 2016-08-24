#! /bin/bash

LOCALDIR=$1;

cd build/qla
../../src/qla/configure --prefix=$(LOCALDIR)/install/qla --enable-sse2 CC=gcc  CFLAGS="-Wall -O3 -std=gnu99 -march=native -msse2 -mfpmath=sse -ffast-math -funroll-loops -fprefetch-loop-arrays -fomit-frame-pointer -fopenmp"
make -j8
make install
make check
cd ../..


