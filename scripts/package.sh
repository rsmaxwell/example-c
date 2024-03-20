#!/bin/bash

PROJECT=example-c




FAMILY=""
ARCHITECTURE=""

case "$(uname -s)" in
    CYGWIN*) FAMILY="cygwin" ;;
    Linux*) 
        . /etc/os-release
        case ${ID} in
            ubuntu) FAMILY="linux" ;;
            alpine) FAMILY="alpine" ;;
            *) FAMILY="linux" ;;
        esac
        ;;
    *) FAMILY="unknown" ;;
esac

case "$(uname -m)" in 
  amd64|x86_64)   ARCHITECTURE="amd64" ;; 
  *) ARCHITECTURE="x86" ;; 
esac 







ARTIFACTID=${PROJECT}_${FAMILY}_${ARCHITECTURE}
VERSION=${BUILD_ID:-SNAPSHOT}
PACKAGING=zip
ZIPFILE=${ARTIFACTID}_${VERSION}.${PACKAGING}

PROJECT_DIR=$(pwd)
BUILD_DIR=${PROJECT_DIR}/build
PACKAGE_DIR=${PROJECT_DIR}/package
DIST_DIR=${PROJECT_DIR}/dist

rm -rf ${PACKAGE_DIR}
mkdir -p ${PACKAGE_DIR} ${DIST_DIR}

cd ${PACKAGE_DIR}
cp ${BUILD_DIR}/${PROJECT} .

zip ${DIST_DIR}/${ZIPFILE} ${PROJECT}

