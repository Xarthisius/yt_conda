#!/bin/bash

echo "[global]" > setup.cfg
echo "zmq_prefix = $PREFIX" >> setup.cfg

$PYTHON setup.py install
