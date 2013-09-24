sed -i -e 's:^SHLIB_LIBS=:SHLIB_LIBS=-lncurses:' support/shobj-conf


CPPFLAGS="-D_GNU_SOURCE -Dxrealloc=_rl_realloc -Dxmalloc=_rl_malloc -Dxfree=_rl_free"

./configure \
	--disable-static \
	--cache-file="${S}"/config.cache \
	--with-curses \
	--prefix="$PREFIX"
make -j4
make install
