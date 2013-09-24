#!/bin/bash

MY_P=tcl8.6.1
SPARENT=${PWD}/${MY_P}

cd ${SPARENT}/unix
find \
	"${SPARENT}"/compat/* \
	"${SPARENT}"/doc/try.n \
	-delete
autoconf
./configure 

make -j4

local v1=8.6
local mylibdir=lib

make install DESTDIR="${PREFIX}"
# fix the tclConfig.sh to eliminate refs to the build directory
# and drop unnecessary -L inclusion to default system libdir

sed \
   -e "/^TCL_BUILD_LIB_SPEC=/s:-L${SPARENT}.*unix *::g" \
   -e "/^TCL_LIB_SPEC=/s:-L${EPREFIX}/usr/${mylibdir} *::g" \
   -e "/^TCL_SRC_DIR=/s:${SPARENT}:${PREFIX}/${mylibdir}/tcl${v1}/include:g" \
   -e "/^TCL_BUILD_STUB_LIB_SPEC=/s:-L${SPARENT}.*unix *::g" \
   -e "/^TCL_STUB_LIB_SPEC=/s:-L${EPREFIX}/usr/${mylibdir} *::g" \
   -e "/^TCL_BUILD_STUB_LIB_PATH=/s:${SPARENT}.*unix:${PREFIX}/${mylibdir}:g" \
   -e "/^TCL_LIB_FILE=/s:'libtcl${v1}..TCL_DBGX..so':\"libtcl${v1}\$\{TCL_DBGX\}.so\":g" \
   -i "${PREFIX}"/${mylibdir}/tclConfig.sh

# install private headers
mkdir -p "$PREFIX"/${mylibdir}/tcl${v1}/include/unix
cp *.h "$PREFIX"/${mylibdir}/tcl${v1}/include/unix
mkdir -p "$PREFIX"/${mylibdir}/tcl${v1}/include/generic
cp "${SPARENT}"/generic/*.h
rm -f "${PREFIX}"/${mylibdir}/tcl${v1}/include/generic/{tcl,tclDecls,tclPlatDecls}.h

# install symlink for libraries
#dosym libtcl${v1}$(get_libname) /usr/${mylibdir}/libtcl$(get_libname)
#dosym libtclstub${v1}.a /usr/${mylibdir}/libtclstub.a
#
#dosym tclsh${v1} /usr/bin/tclsh
