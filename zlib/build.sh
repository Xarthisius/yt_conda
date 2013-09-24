./configure --prefix=$PREFIX --shared
make -j9
make install

sed -i -r 's:\<(O[FN])\>:_Z_\1:g' "${PREFIX}"/include/*.h
find "${PREFIX}" -name "libz.*a" -delete
