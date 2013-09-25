#!/bin/bash

mkdir build
cd build
#export LDFLAGS="-static-libgfortran"  # this is gonna be huge pain...
cmake --no-warn-unused-cli \
   -DCMAKE_INSTALL_PREFIX="${PREFIX}" \
   -DUSE_OPTIMIZED_BLAS=ON \
   -DBLAS_LIBRARIES="-L${PREFIX}/lib -lblas" \
   -DUSE_XBLAS=OFF \
   -DBUILD_TESTING=OFF \
   -DBUILD_SHARED_LIBS=ON \
   -DBUILD_STATIC_LIBS=OFF \
   -DCMAKE_BUILD_TYPE=Production \
   -DCMAKE_INSTALL_DO_STRIP=ON \
   ../

make -j4 V=1 VERBOSE=1
make install
