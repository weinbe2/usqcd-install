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

SOURCE=$2;

SUFFIX="";

if [ "$#" -eq "3" ]
then
    SUFFIX=${3}
fi

./setup.sh $LOCALDIR $SOURCE $SUFFIX
./qmp.sh $LOCALDIR $SOURCE $SUFFIX
./qio.sh $LOCALDIR $SOURCE $SUFFIX
./qla.sh $LOCALDIR $SOURCE $SUFFIX
./qdp.sh $LOCALDIR $SOURCE $SUFFIX
./qopqdp.sh $LOCALDIR $SOURCE $SUFFIX
./qhmc.sh $LOCALDIR $SOURCE $SUFFIX

