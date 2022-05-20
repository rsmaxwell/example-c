#!/bin/bash


NAME=example-c

ZIPFILE=${NAME}_amd64-linux.zip

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
PROJECT_DIR=$(dirname ${SCRIPT_DIR})
BUILD_DIR=${PROJECT_DIR}/build
PACKAGE_DIR=${PROJECT_DIR}/package

rm -rf ${PACKAGE_DIR}
mkdir -p ${PACKAGE_DIR}

cd ${PACKAGE_DIR}
cp ${BUILD_DIR}/${NAME} .

zip ${PROJECT_DIR}/${ZIPFILE} ${NAME}

