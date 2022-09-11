#!/bin/bash

NAME=example-c

ZIPFILE=${NAME}_amd64-linux.zip

PROJECT_DIR=$(pwd)
BUILD_DIR=${PROJECT_DIR}/build
PACKAGE_DIR=${PROJECT_DIR}/package
DIST_DIR=${PROJECT_DIR}/dist

echo "-----[ debug info ]----------------"
set -x
tree ${PROJECT_DIR}

rm -rf ${PACKAGE_DIR}
mkdir -p ${PACKAGE_DIR}

cd ${PACKAGE_DIR}
cp ${BUILD_DIR}/${NAME} .

zip ${DIST_DIR}/${ZIPFILE} ${NAME}


tree ${PROJECT_DIR}