#!/bin/bash

./configure --prefix="${PREFIX}" --with-bzip2 --enable-shared --disable-static
make -j9
make install

find "${PREFIX}" -name "*.la" -delete
