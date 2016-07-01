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

cd build${SUFFIX}/qio
../../src/qio/configure --prefix=${LOCALDIR}/install${SUFFIX}/qio --with-qmp=${LOCALDIR}/install${SUFFIX}/qmp --enable-largefile --enable-dml-output-buffering CFLAGS="-Wall -O3 -std=gnu99 -march=native -g "
make -j8
make install
make check
cd ../..


