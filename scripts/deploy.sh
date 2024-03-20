#!/bin/bash

PROJECT=example-c




FAMILY=""
ARCHITECTURE=""

case "$(uname -s)" in
    CYGWIN*) FAMILY="cygwin" ;;
    Linux*) 
        . /etc/os-release
        case ${ID} in
            ubuntu) FAMILY="ubuntu" ;;
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








GROUPID=com.rsmaxwell.example
ARTIFACTID=${PROJECT}_${FAMILY}_${ARCHITECTURE}
VERSION=${BUILD_ID:-SNAPSHOT}
PACKAGING=zip

REPOSITORY=releases
REPOSITORYID=releases
URL=https://pluto.rsmaxwell.co.uk/archiva/repository/${REPOSITORY}

ZIPFILE=${ARTIFACTID}.${PACKAGING}

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
PROJECT_DIR=$(dirname ${SCRIPT_DIR})
DIST_DIR=${PROJECT_DIR}/dist

cd ${DIST_DIR}

mvn --batch-mode \
	--errors \
	--debug \
	deploy:deploy-file \
	-DgroupId=${GROUPID} \
	-DartifactId=${ARTIFACTID} \
	-Dversion=${VERSION} \
	-Dpackaging=${PACKAGING} \
	-Dfile=${ZIPFILE} \
	-DrepositoryId=${REPOSITORYID} \
	-Durl=${URL}

