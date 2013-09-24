#!/bin/bash

./configure --prefix=$PREFIX --disable-static \
    --enable-linux-lfs --with-zlib=$PREFIX --enable-shared \
    --enable-production --disable-silent-rules \
    --disable-parallel
make
make install

rm -rf $PREFIX/share/hdf5_examples
