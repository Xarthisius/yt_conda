#!/bin/bash

MY_P=tk8.6.1
SPARENT=${PWD}

cd unix
find \
	"${SPARENT}"/compat/* \
	-delete
autoconf
./configure --prefix="${PREFIX}" \
   --enable-threads \
   --disable-xft \
   --disable-xss \
   --enable-shared \
   CFLAGS="-I${PREFIX}/include" \
   LDFLAGS="-L${PREFIX}/lib"


make -j4
make install
# fix the tclConfig.sh to eliminate refs to the build directory
# and drop unnecessary -L inclusion to default system libdir
v1=8.6
sed \
   -e "/^TK_BUILD_LIB_SPEC=/s:-L${SPARENT}.*unix *::g" \
   -e "/^TK_LIB_SPEC=/s:-L${PREFIX}/lib *::g" \
   -e "/^TK_SRC_DIR=/s:${SPARENT}:${PREFIX}/lib/tcl${v1}/include:g" \
   -e "/^TK_BUILD_STUB_LIB_SPEC=/s:-L${SPARENT}.*unix *::g" \
   -e "/^TK_STUB_LIB_SPEC=/s:-L${PREFIX}/lib *::g" \
   -e "/^TK_BUILD_STUB_LIB_PATH=/s:${SPARENT}.*unix:${PREFIX}/lib:g" \
   -e "/^TK_LIB_FILE=/s:'libtcl${v1}..TCL_DBGX..so':\"libtcl${v1}\$\{TCL_DBGX\}.so\":g" \
   -i "${PREFIX}"/lib/tkConfig.sh

# install private headers
mkdir -p "$PREFIX"/lib/tk${v1}/include/unix
cp *.h "$PREFIX"/lib/tk${v1}/include/unix
mkdir -p "$PREFIX"/lib/tk${v1}/include/generic
cp "${SPARENT}"/generic/*.h "$PREFIX"/lib/tk${v1}/include/generic
rm -f "${PREFIX}"/lib/tcl${v1}/include/generic/{tk,tkDecls,tkPlatDecls}.h

# install symlink for libraries
ln -s libtk${v1}.so "${PREFIX}"/lib/libtk.so
ln -s libtkstub${v1}.a "${PREFIX}"/lib/libtkstub.a

ln -s wish${v1} "${PREFIX}"/bin/wish
