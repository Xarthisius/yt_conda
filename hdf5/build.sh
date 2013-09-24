#!/bin/bash

./configure --prefix="${PREFIX}" --disable-static \
    --enable-linux-lfs --with-zlib="${PREFIX}" --enable-shared \
    --enable-production --disable-silent-rules \
    --disable-parallel \
    --disable-fortran --disable-fortran2003
make -j9
make install

rm -rf "${PREFIX}"/share/hdf5_examples
find "${PREFIX}" -name "*.la" -delete
