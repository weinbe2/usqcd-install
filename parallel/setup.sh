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

# Creates directory structure, downloads packages from git.

if [ ! -d "src" ]
then

    mkdir src
    cd src
    
    git clone https://github.com/usqcd-software/qmp.git
    git clone https://github.com/usqcd-software/c-lime.git
    git clone https://github.com/usqcd-software/qio.git
    git clone https://github.com/usqcd-software/qla.git
    git clone https://github.com/usqcd-software/qdp.git
    git clone https://github.com/usqcd-software/qopqdp.git
    git clone https://github.com/jcosborn/qhmc.git
    
    cd ..
fi

# Reconfigure.

cd src

cd qmp
autoreconf
cd ..

cd c-lime
autoreconf
cd ..

cd qio
autoreconf
cd other_libs
rmdir c-lime
ln -s ../../c-lime c-lime
cd ../..

cd qla
autoreconf
cd ..

cd qdp
autoreconf
cd ..

cd qopqdp
autoreconf
cd ..

cd qhmc
autoreconf
cd ..

cd ..

# Create build directories. 

if [ ! -d "build${SUFFIX}" ] && [ ! -d "install${SUFFIX}" ]
then
    mkdir build${SUFFIX}
    mkdir build${SUFFIX}/qmp
    mkdir build${SUFFIX}/qio
    mkdir build${SUFFIX}/qla
    mkdir build${SUFFIX}/qdp
    mkdir build${SUFFIX}/qopqdp
    mkdir build${SUFFIX}/qhmc

    mkdir install${SUFFIX}
    mkdir install${SUFFIX}/qmp
    mkdir install${SUFFIX}/qio
    mkdir install${SUFFIX}/qla
    mkdir install${SUFFIX}/qdp
    mkdir install${SUFFIX}/qopqdp
    mkdir install${SUFFIX}/qhmc
fi

