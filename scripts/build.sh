#!/bin/bash

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

cat > info <<EOL
FAMILY="${FAMILY}"
ARCHITECTURE="${ARCHITECTURE}"
EOL






PROJECT_DIR=$(pwd)
BUILD_DIR=${PROJECT_DIR}/build

mkdir -p ${BUILD_DIR}
cd ${BUILD_DIR}

export SOURCE=${PROJECT_DIR}/src/main/c

make --file ${PROJECT_DIR}/src/main/make/${FAMILY}_${ARCHITECTURE}.makefile $*
