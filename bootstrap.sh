CONDABIN=Miniconda-1.9.1-Linux-x86_64.sh

rm -rf yt-conda
[[ ! -e ${CONDABIN} ]] && wget -nc http://repo.continuum.io/miniconda/${CONDABIN}
bash ${CONDABIN} -b -p $PWD/yt-conda
export PATH="$PWD/yt-conda/bin:$PATH"

conda build --no-binstar-upload zlib
conda install yt-conda/conda-bld/linux-64/zlib-*.tar.bz2
conda build --no-binstar-upload bzip2
conda install yt-conda/conda-bld/linux-64/bzip2-*.tar.bz2
conda build --no-binstar-upload ncurses
conda install yt-conda/conda-bld/linux-64/ncurses-*.tar.bz2

conda list
