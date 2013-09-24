#!/bin/bash

#rm -r Modules/expat
rm -r Modules/_ctypes/libffi*
rm -r Modules/zlib

./configure \
   --prefix="${PREFIX}"

make -j4
make install
