#!/bin/sh

BASEDIR=$(dirname "$0")
SCRIPT_DIR=$(cd $(dirname $BASEDIR) && pwd)
PROJECT_DIR=$(dirname $SCRIPT_DIR)
BUILD_DIR=${PROJECT_DIR}/build
DIST_DIR=${PROJECT_DIR}/dist

. ${BUILD_DIR}/buildinfo

PROJECT=example-c
GROUPID=com.rsmaxwell.example
ARTIFACTID=${PROJECT}_${FAMILY}_${ARCHITECTURE}
VERSION=LATEST
PACKAGING=zip

REPOSITORY=releases
REPOSITORYID=releases
URL=https://pluto.rsmaxwell.co.uk/archiva/repository/${REPOSITORY}

ZIPFILE=${ARTIFACTID}_${VERSION}.${PACKAGING}

cd ${DIST_DIR}

mvn --batch-mode \
	--errors \
	dependency:get \
	-DgroupId=${GROUPID} \
	-DartifactId=${ARTIFACTID} \
	-Dversion=${VERSION} \
	-Dpackaging=${PACKAGING} \
	-Dfile=${ZIPFILE} \
	-DrepositoryId=${REPOSITORYID} \
	-DremoteRepositories=${URL} \
	-Ddest=${ZIPFILE}

result=$?
if [ ! ${result} -eq 0 ]; then
    echo "deployment failed"
    echo "Error: $0[${LINENO}] result: ${result}"
    exit 1
fi

echo "Success"

