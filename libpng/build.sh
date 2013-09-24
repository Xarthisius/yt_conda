./configure --prefix=$PREFIX LDFLAGS=-L$PREFIX/lib CPPFLAGS=-I$PREFIX/include
make -j9
make install
