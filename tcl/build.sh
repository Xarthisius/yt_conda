#!/bin/bash

MY_P=tcl8.6.1
SPARENT=${PWD}

cd unix
find \
	"${SPARENT}"/compat/* \
	"${SPARENT}"/doc/try.n \
	-delete
autoconf
./configure --prefix="${PREFIX}"

make -j4
make install
# fix the tclConfig.sh to eliminate refs to the build directory
# and drop unnecessary -L inclusion to default system libdir
v1=8.6
sed \
   -e "/^TCL_BUILD_LIB_SPEC=/s:-L${SPARENT}.*unix *::g" \
   -e "/^TCL_LIB_SPEC=/s:-L${PREFIX}/lib *::g" \
   -e "/^TCL_SRC_DIR=/s:${SPARENT}:${PREFIX}/lib/tcl${v1}/include:g" \
   -e "/^TCL_BUILD_STUB_LIB_SPEC=/s:-L${SPARENT}.*unix *::g" \
   -e "/^TCL_STUB_LIB_SPEC=/s:-L${PREFIX}/lib *::g" \
   -e "/^TCL_BUILD_STUB_LIB_PATH=/s:${SPARENT}.*unix:${PREFIX}/lib:g" \
   -e "/^TCL_LIB_FILE=/s:'libtcl${v1}..TCL_DBGX..so':\"libtcl${v1}\$\{TCL_DBGX\}.so\":g" \
   -i "${PREFIX}"/lib/tclConfig.sh

# install private headers
mkdir -p "$PREFIX"/lib/tcl${v1}/include/unix
cp *.h "$PREFIX"/lib/tcl${v1}/include/unix
mkdir -p "$PREFIX"/lib/tcl${v1}/include/generic
cp "${SPARENT}"/generic/*.h "$PREFIX"/lib/tcl${v1}/include/generic
rm -f "${PREFIX}"/lib/tcl${v1}/include/generic/{tcl,tclDecls,tclPlatDecls}.h

# install symlink for libraries
ln -s libtcl${v1}$(get_libname) "${PREFIX}"/lib/libtcl$(get_libname)
ln -s libtclstub${v1}.a "${PREFIX}"/lib/libtclstub.a

ln -s tclsh${v1} "${PREFIX}"/bin/tclsh
