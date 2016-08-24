#! /bin/bash

# Creates directory structure, downloads packages from git.

mkdir src
cd src
git clone https://github.com/usqcd-software/qmp.git
cd qmp
autoreconf
cd ..

git clone https://github.com/usqcd-software/c-lime.git
cd c-lime
autoreconf
cd ..
git clone https://github.com/usqcd-software/qio.git
cd qio
autoreconf
cd other_libs
rmdir c-lime
ln -s ../../c-lime c-lime
cd ../..

git clone https://github.com/usqcd-software/qla.git
cd qla
autoreconf
cd ..

git clone https://github.com/usqcd-software/qdp.git
cd qdp
autoreconf
cd ..

git clone https://github.com/usqcd-software/qopqdp.git
cd qopqdp
autoreconf
cd ..

git clone https://github.com/jcosborn/qhmc.git
cd qhmc
autoreconf
cd ..

cd ..

mkdir build
mkdir build/qmp
mkdir build/qio
mkdir build/qla
mkdir build/qdp
mkdir build/qopqdp
mkdir build/qhmc

mkdir install
mkdir install/qmp
mkdir install/qio
mkdir install/qla
mkdir install/qdp
mkdir install/qopqdp
mkdir install/qhmc

