#!/bin/bash

REPOSITORY=releases
REPOSITORYID=releases

GROUPID=com.rsmaxwell.example
ARTIFACTID=example-c_amd64-linux
VERSION=${BUILD_ID:-SNAPSHOT}
PACKAGING=zip

URL=https://server.rsmaxwell.co.uk/archiva/repository/${REPOSITORY}

ZIPFILE=${ARTIFACTID}_${VERSION}.${PACKAGING}
NAME=example-c




SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
PROJECT_DIR=$(dirname ${SCRIPT_DIR})
BUILD_DIR=${PROJECT_DIR}/build
DEPLOY_DIR=${PROJECT_DIR}/deploy

rm -rf 
mkdir -p ${DEPLOY_DIR}

cd ${BUILD_DIR}
zip ${DEPLOY_DIR}/${ZIPFILE} ${NAME}

cd ${DEPLOY_DIR}
mvn --batch-mode deploy:deploy-file -DgroupId=${GROUPID} -DartifactId=${ARTIFACTID} -Dversion=${VERSION} -Dpackaging=${PACKAGING} -Dfile=${FILENAME} -DrepositoryId=${REPOSITORYID} -Durl=${URL} -DrepositoryId=${REPOSITORYID}

