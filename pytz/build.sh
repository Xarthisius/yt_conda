$PYTHON setup.py build \
   --build-base "${SRC_DIR}"/build \
   --build-platlib "${SRC_DIR}"/build/lib \
   --build-purelib "${SRC_DIR}"/build/lib \
   --build-scripts "${SRC_DIR}"/build/scripts \
   egg_info --egg-base "${SRC_DIR}"/build

$PYTHON setup.py build \
   --build-base "${SRC_DIR}"/build \
   --build-platlib "${SRC_DIR}"/build/lib \
   --build-purelib "${SRC_DIR}"/build/lib \
   --build-scripts "${SRC_DIR}"/build/scripts \
   egg_info --egg-base "${SRC_DIR}"/build \
   install --compile -O2 --root=/
