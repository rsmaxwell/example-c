#!/bin/bash

NAME=example-c
PROJECT_DIR=$(pwd)
BUILD_DIR=${PROJECT_DIR}/build

echo "---[ test run ]----------------"
set -x
${BUILD_DIR}/${NAME}
