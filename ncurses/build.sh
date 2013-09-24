sed -i misc/Makefile.in \
   -e "s:\$(DESTDIR)\$(PKG_CONFIG_LIBDIR):${PREFIX}/lib/pkgconfig:g"
./configure \
	--with-chtype=long \
	--with-mmask-t=long \
	--disable-ext-colors \
	--disable-ext-mouse \
	--without-pthread \
	--without-reentrant \
	--with-shared \
	--without-hashed-db \
	--disable-termcap \
	--enable-symlinks \
	--with-rcs-ids \
	--with-manpage-format=normal \
	--enable-echo \
   --enable-pc-files \
   --disable-static \
	--prefix="$PREFIX"
make -j4
make install
