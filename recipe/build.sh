#!/usr/bin/env bash

mkdir build
cd build

if [[ "$target_platform" == linux-64 ]]; then
    LDFLAGS="-lrt ${LDFLAGS}"
fi

cmake \
    -DBoost_NO_BOOST_CMAKE=ON \
    -DCMAKE_INSTALL_PREFIX=$PREFIX \
    -DCMAKE_PREFIX_PATH=$PREFIX \
    -DAUDI_BUILD_AUDI=yes \
    -DAUDI_BUILD_MAIN=no \
    -DAUDI_BUILD_TESTS=yes \
    -DAUDI_BUILD_PYAUDI=no \
    ..

make -j${CPU_COUNT} VERBOSE=1

ctest --output-on-failure -j${CPU_COUNT}

make install
