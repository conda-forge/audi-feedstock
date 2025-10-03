if "%CPU_COUNT%"=="" set CPU_COUNT=%NUMBER_OF_PROCESSORS%
echo Using %CPU_COUNT% cores

mkdir build
cd build

REM Remove warnings for next version (they're added to codebase)
cmake ^
    -G "Visual Studio 17 2022" ^
    -A x64 ^
    -DCMAKE_BUILD_TYPE=Release ^
    -DCMAKE_CXX_FLAGS="/EHsc /wd4244 /wd4018 /wd4456 /wd4530" ^
    -DCMAKE_PREFIX_PATH=%LIBRARY_PREFIX% ^
    -DCMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX% ^
    -DAUDI_BUILD_AUDI=yes ^
    -DAUDI_BUILD_MAIN=no ^
    -DAUDI_BUILD_TESTS=yes ^
    -DAUDI_BUILD_PYAUDI=no ^
    ..

cmake --build .  --config Release -- /m

ctest --output-on-failure -C Release -j%CPU_COUNT%

cmake --build . --config Release --target install
