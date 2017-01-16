#! /usr/bin/bash

LOCALDIR=$1;

cd build/qmp
../../src/qmp/configure --prefix=${LOCALDIR}/install/qmp --with-qmp-comms-type=SINGLE CC=gcc CFLAGS="-Wall -O3 -std=gnu99 -march=native -msse2 -mfpmath=sse -ffast-math -funroll-loops -fprefetch-loop-arrays -fomit-frame-pointer -fopenmp"
make -j8
make install
make check
cd ../..


