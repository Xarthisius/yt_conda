CONDABIN=Miniconda-1.9.1-Linux-x86_64.sh

rm -rf yt-conda
[[ ! -e ${CONDABIN} ]] && wget -nc http://repo.continuum.io/miniconda/${CONDABIN}
bash ${CONDABIN} -b -p $PWD/yt-conda
export PATH="$PWD/yt-conda/bin:$PATH"

for pkg in zlib bzip2 ncurses openssl readline sqlite tcl tk libpng hdf5 blas lapack python cmake freetype; do
   conda build --no-binstar-upload ${pkg}
   conda install yt-conda/conda-bld/linux-64/${pkg}-*.tar.bz2
done

conda create -n py_yt python -c http://tinyurl.com/yt-conda --override-channels
source activate py_yt
for pkg in setuptools numpy cython mercurial h5py coverage nose six matplotlib yt; do
   conda build --no-binstar-upload ${pkg}
   conda install yt-conda/conda-bld/linux-64/${pkg}-*.tar.bz2
done

conda list
