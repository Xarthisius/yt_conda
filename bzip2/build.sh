make -f Makefile-libbz2_so all
make all
make install PREFIX="${PREFIX}"
find "${PREFIX}" -name "lib*.a" -delete

mkdir -p "$PREFIX"/lib
mv libbz2.so.1.0.6 "$PREFIX"/lib
ln -s libbz2.so.1.0.6 "$PREFIX"/lib/libbz2.so.1
ln -s libbz2.so.1.0.6 "$PREFIX"/lib/libbz2.so
mv bzip2-shared "${PREFIX}"/bin/bzip2
