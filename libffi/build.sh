sed -i 's:@toolexeclibdir@:$(libdir):g' Makefile.in
./configure --prefix="$PREFIX" --disable-static --libdir="$PREFIX"/lib
make -j4
make install
find "$PREFIX" -name "*.la" -delete
