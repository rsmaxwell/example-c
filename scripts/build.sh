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






PROJECT_DIR=$(pwd)
BUILD_DIR=${PROJECT_DIR}/build

mkdir -p ${BUILD_DIR}
cd ${BUILD_DIR}





cat > buildinfo <<EOL
FAMILY="${FAMILY}"
ARCHITECTURE="${ARCHITECTURE}"
EOL




export SOURCE=${PROJECT_DIR}/src/main/c

make --file ${PROJECT_DIR}/src/main/make/linux.makefile $*
result=$?
if [ ! ${result} -eq 0 ]; then
    echo "build failed"
    echo "Error: $0[${LINENO}] result: ${result}"
    exit 1
fi

pwd
ls -al 
cat buildinfo

echo "Success"
