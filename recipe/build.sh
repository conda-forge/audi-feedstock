#!/usr/bin/env bash

if [[ "$(uname)" == "Darwin" ]]; then
    export ENABLE_MPPP=no
else
    export ENABLE_MPPP=yes
fi

mkdir build
cd build

cmake \
    -DBoost_NO_BOOST_CMAKE=ON \
    -DCMAKE_INSTALL_PREFIX=$PREFIX \
    -DCMAKE_PREFIX_PATH=$PREFIX \
    -DAUDI_BUILD_AUDI=yes \
    -DAUDI_BUILD_MAIN=no \
    -DAUDI_BUILD_TESTS=yes \
    -DAUDI_BUILD_PYAUDI=no \
    -DAUDI_WITH_MPPP=$ENABLE_MPPP \
    ..

make

ctest

make install