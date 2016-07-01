#! /bin/bash

# Argument 1: Root directory. It's assumed the src, build, and install directories are all here.
# Argument 2: What file to source. Could be different for different machines. 
# Argument 3: Suffix for this install (allows multiple concurrent build, install). 

if [ "$#" -ne "3" ] && [ "$#" -ne "2" ]
then
    echo "Not enough arguments supplied."
    exit
fi

LOCALDIR=$1;

if [ -f $2 ]
then
    source $2; 
fi

SUFFIX="";

if [ "$#" -eq "3" ]
then
    SUFFIX="_"${3}
fi

cd build${SUFFIX}/qhmc
../../src/qhmc/configure --prefix=${LOCALDIR}/install${SUFFIX}/qhmc --with-qmp=${LOCALDIR}/install${SUFFIX}/qmp --with-qio=${LOCALDIR}/install${SUFFIX}/qio --with-qla=${LOCALDIR}/install${SUFFIX}/qla --with-qdp=${LOCALDIR}/install${SUFFIX}/qdp --with-qopqdp=${LOCALDIR}/install${SUFFIX}/qopqdp --enable-nc=all --enable-colors=3  CFLAGS="-Wall -std=gnu99 -O3 -g -DQDP_PROFILE -march=native -lrt"
make -j8
make install
# make check # Has issues, apparently.
cd ../..


