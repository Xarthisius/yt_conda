CONDABIN=Miniconda-1.9.1-Linux-x86_64.sh

rm -rf yt-conda
[[ ! -e ${CONDABIN} ]] && wget -nc http://repo.continuum.io/miniconda/${CONDABIN}
bash ${CONDABIN} -b -p $PWD/yt-conda
export PATH="$PWD/yt-conda/bin:$PATH"

export CBLD="conda build --no-binstar-upload"

if [[ -n $STAGE1 ]] ; then
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
fi

conda create -n py_yt python -c http://tinyurl.com/yt-conda --override-channels
source activate py_yt
${CBLD} setuptools
${CBLD} cython
${CBLD} numpy
${CBLD} mercurial
${CBLD} coverage
${CBLD} six
${CBLD} nose
${CBLD} decorator
${CBLD} pexpect
${CBLD} simplegeneric
${CBLD} h5py
${CBLD} coverage
${CBLD} nose
${CBLD} pygments
${CBLD} pyzmq
${CBLD} markupsafe
${CBLD} pyparsing
${CBLD} jinja2
${CBLD} python-dateutil
${CBLD} pytz
${CBLD} tornado
${CBLD} matplotlib
${CBLD} ipython
${CBLD} forthon
${CBLD} yt
