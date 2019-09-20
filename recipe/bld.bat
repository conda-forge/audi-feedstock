mkdir build
cd build

cmake ^
    -G "NMake Makefiles" ^
    -DBoost_NO_BOOST_CMAKE=ON ^
    -DCMAKE_PREFIX_PATH=%LIBRARY_PREFIX% ^
    -DCMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX% ^
    -DAUDI_BUILD_AUDI=yes \
    -DAUDI_BUILD_MAIN=no \
    -DAUDI_BUILD_TESTS=yes \
    -DAUDI_BUILD_PYAUDI=no \
    ..

cmake --build . --config Release

ctest

cmake --build . --config Release --target install