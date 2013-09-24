#!/bin/bash

./config --test-sanity
./config \
    enable-camellia \
    enable-idea \
    enable-mdc2 \
    enable-tlsext \
    --prefix="${PREFIX}" \
    --openssldir="${PREFIX}"/etc/ssl \
    shared

make -j1 depend
make
make rehash
make install
find "${PREFIX}" -name "*.a" -delete
