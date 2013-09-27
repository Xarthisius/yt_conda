export CFLAGS="-I$PREFIX/include -I$PREFIX/include/freetype2"
export LDFLAGS="-L$PREFIX/lib"
$PYTHON setup.py build
$PYTHON setup.py install
