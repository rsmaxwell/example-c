#!/bin/bash

PROJECT_DIR=$(pwd)
BUILD_DIR=${PROJECT_DIR}/build
DIST_DIR=${PROJECT_DIR}/dist

. ${BUILD_DIR}/info

PROJECT=example-c
GROUPID=com.rsmaxwell.example
ARTIFACTID=${PROJECT}_${FAMILY}_${ARCHITECTURE}
VERSION=${BUILD_ID:-SNAPSHOT}
PACKAGING=zip

REPOSITORY=releases
REPOSITORYID=releases
URL=https://pluto.rsmaxwell.co.uk/archiva/repository/${REPOSITORY}

ZIPFILE=${ARTIFACTID}_${VERSION}.${PACKAGING}

cd ${DIST_DIR}

mvn --batch-mode \
	--errors \
	deploy:deploy-file \
	-DgroupId=${GROUPID} \
	-DartifactId=${ARTIFACTID} \
	-Dversion=${VERSION} \
	-Dpackaging=${PACKAGING} \
	-Dfile=${ZIPFILE} \
	-DrepositoryId=${REPOSITORYID} \
	-Durl=${URL}
