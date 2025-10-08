#!/bin/bash

#####################################################################
# This script is used to run the gvsoc simulator with a test binary #
#####################################################################

GVSOC_DIR=/home/lelez/git/pulp-sdk/tools/gvsoc/
#APP_DIR="/home/lelez/git/pulp-sdk/tools/gvsoc/examples/pulp-open/"
#APP_DIR="/home/lelez/git/cheshire/sw/tests/"
APP_DIR="/home/lelez/git/carfield/sw/tests/bare-metal/hostd/"
VENV_DIR="./.venv/"

TRACE_FILE="traces.log"

#APP_NAME="hello"
#APP_NAME="helloworld.spm.elf"
APP_NAME="helloworld.car.spm.elf"
TARGET="carfield"
GVSOC_FLAGS="--trace=:${TRACE_FILE} --trace-level=DEBUG --debug-mode" #--gdbserver

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

# Resize log file to first 100000 lines
head -n 100000 $TRACE_FILE > ${TRACE_FILE}.tmp && \
mv ${TRACE_FILE}.tmp $TRACE_FILE
