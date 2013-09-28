./configure --prefix=$PREFIX --shared
make -j9
make install

if [[ -z ${OSX_ARCH} ]] ; then
   sed -i -r 's:\<(O[FN])\>:_Z_\1:g' "${PREFIX}"/include/*.h
   find "${PREFIX}" -name "libz.*a" -delete
fi
