CONDABIN=Miniconda-1.9.1-Linux-x86_64.sh

rm -rf yt-conda
[[ ! -e ${CONDABIN} ]] && wget -nc http://repo.continuum.io/miniconda/${CONDABIN}
bash ${CONDABIN} -b -p $PWD/yt-conda
export PATH="$PWD/yt-conda/bin:$PATH"

for pkg in zlib bzip2 ncurses openssl readline sqlite tcl tk libpng hdf5 python; do
   conda build --no-binstar-upload ${pkg}
   conda install yt-conda/conda-bld/linux-64/${pkg}-*.tar.bz2
done

conda list
