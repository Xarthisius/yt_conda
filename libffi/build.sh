./configure --prefix="$PREFIX"
make -j4
make install DESTDIR="$PREFIX"
