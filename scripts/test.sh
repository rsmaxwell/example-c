#!/bin/bash

NAME=example-c
PROJECT_DIR=$(pwd)
BUILD_DIR=${PROJECT_DIR}/build
TEST_DIR=${PROJECT_DIR}/test



rm -rf ${TEST_DIR}
mkdir -p ${TEST_DIR}
cd ${TEST_DIR}



${BUILD_DIR}/${NAME}
result=$?
if [ ${result} -eq 0 ]; then
    echo "Success" > status.txt
else
    echo "The test failed: exit code: ${result}"
    echo "Error: $0[${LINENO}] result: ${result}"
    echo "Failed" > status.txt
    exit 1
fi


echo "Success"
