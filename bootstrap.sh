CONDABIN=Miniconda-1.9.1-Linux-x86_64.sh

rm -rf yt-conda
[[ ! -e ${CONDABIN} ]] && wget -nc http://repo.continuum.io/miniconda/${CONDABIN}
bash ${CONDABIN} -b -p $PWD/yt-conda
export PATH="$PWD/yt-conda/bin:$PATH"

export CBLD="conda build --no-binstar-upload"

${CBLD} zlib
${CBLD} bzip2
${CBLD} cmake
${CBLD} ncurses
${CBLD} openssl
${CBLD} readline
${CBLD} sqlite
${CBLD} tcl
${CBLD} tk
${CBLD} libpng
${CBLD} blas
${CBLD} lapack
${CBLD} hdf5
${CBLD} freetype
${CBLD} zeromq
${CBLD} python

conda create -n py_yt python -c http://tinyurl.com/yt-conda --override-channels
source activate py_yt
for pkg in setuptools cython numpy mercurial h5py coverage nose six; do
   ${CBLD} ${pkg}
   conda install yt-conda/conda-bld/linux-64/${pkg}-*.tar.bz2
done
for pkg in decorator pexpect simplegeneric pygments pyzmq jinja2 matplotlib ipython yt; do
   ${CBLD} ${pkg}
   conda install yt-conda/conda-bld/linux-64/${pkg}-*.tar.bz2
done

conda list
