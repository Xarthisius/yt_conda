make -f Makefile-libbz2_so all
make all
make install PREFIX="${PREFIX}"
find "${PREFIX}" -name "lib*.a" -delete
