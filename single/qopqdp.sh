#! /bin/bash

LOCALDIR=$1;

cd build/qopqdp
../../src/qopqdp/configure --prefix=${LOCALDIR}/install/qopqdp --enable-sse2 CC=gcc  --with-qmp=${LOCALDIR}/install/qmp --with-qio=${LOCALDIR}/install/qio --with-qla=${LOCALDIR}/install/qla --with-qdp=${LOCALDIR}/install/qdp CFLAGS="-Wall -O3 -std=gnu99 -march=native -msse2 -mfpmath=sse -ffast-math -funroll-loops -fprefetch-loop-arrays -fomit-frame-pointer -fopenmp"
make -j8
make install
make check
cd ../..


