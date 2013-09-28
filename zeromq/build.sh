#!/bin/bash

./configure --prefix="${PREFIX}" --disable-static
make -j9
make install

find "${PREFIX}" -name "*.la" -delete
