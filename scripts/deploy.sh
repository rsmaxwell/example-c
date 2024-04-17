#!/bin/sh

set -x 

BASEDIR=$(dirname "$0")
SCRIPT_DIR=$(cd $BASEDIR && pwd)
PROJECT_DIR=$(dirname $SCRIPT_DIR)
BUILD_DIR=${PROJECT_DIR}/build
DIST_DIR=${PROJECT_DIR}/dist

. ${BUILD_DIR}/versioninfo
. ${BUILD_DIR}/machineinfo

GROUPID=com.rsmaxwell.example
ARTIFACTID=${PROJECT}_${FAMILY}_${ARCHITECTURE}
PACKAGING=zip
URL=https://pluto.rsmaxwell.co.uk/archiva/repository/${REPOSITORY}
ZIPFILE=${ARTIFACTID}_${VERSION}.${PACKAGING}

cd ${DIST_DIR}

id -a 
ls -al ~
ls -al ~/.m2
cat ~/.m2/settings.xml


mvn --batch-mode --errors deploy:deploy-file \
	-DgroupId=${GROUPID} \
	-DartifactId=${ARTIFACTID} \
	-Dversion=${VERSION} \
	-Dpackaging=${PACKAGING} \
	-Dfile=${ZIPFILE} \
	-DrepositoryId=${REPOSITORYID} \
	-Durl=${URL}

