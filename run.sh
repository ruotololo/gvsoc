#!/bin/bash

#####################################################################
# This script is used to run the gvsoc simulator with a test binary #
#####################################################################

GVSOC_DIR=/home/lelez/git/pulp-sdk/tools/gvsoc/
APP_DIR="/home/lelez/git/cheshire/sw/tests/"
#APP_DIR="/home/lelez/git/carfield/sw/tests/bare-metal/hostd/"
VENV_DIR="./venv/"

APP_NAME="dma_2d.spm.elf"
#APP_NAME="helloworld.car.spm.elf"
TARGET=cheshire
GVSOC_FLAGS="--trace=insn:traces.log --trace-level=DEBUG --debug-mode"

# Activate the GVSoC venv
cd $GVSOC_DIR && \
source "${VENV_DIR}bin/activate" && \

# Build the GVSoC target
echo "Building GVSoC target..." && \
source ./sourceme.sh && \
#make clean
make TARGETS=$TARGET build && \

# Run GVSoC
echo "Running GVSoC..." && \
gvsoc --target=$TARGET $GVSOC_FLAGS --binary $APP_DIR/$APP_NAME run
