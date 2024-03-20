#!/bin/bash

PROJECT_DIR=$(pwd)
BUILD_DIR=${PROJECT_DIR}/build





OS_NAME=""
ARCH_NAME=""

case "$(uname -s)" in
    CYGWIN*) OS_NAME="cygwin" ;;
    Linux*) 
        . /etc/os-release
        case ${ID} in
            ubuntu) OS_NAME="ubuntu" ;;
            alpine) OS_NAME="alpine" ;;
            *) OS_NAME="linux" ;;
        esac
        ;;
    *) OS_NAME="unknown" ;;
esac

case "$(uname -m)" in 
  amd64|x86_64)   ARCH_NAME="amd64" ;; 
  *) ARCH_NAME="x86" ;; 
esac 





mkdir -p ${BUILD_DIR}
cd ${BUILD_DIR}

export SOURCE=${PROJECT_DIR}/src/main/c

make --file ${PROJECT_DIR}/src/main/make/${OS_NAME}_${ARCH_NAME}.makefile $*
