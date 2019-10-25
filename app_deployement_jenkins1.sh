#!/bin/bash
set -e
set -o pipefail

#Building variables
echo "${GIT_BRANCH}"
branchname=$(echo $GIT_BRANCH | cut -f2 -d"/")
if [[ "$branchname" = "master" ]]; then
namespace="default"
else
namespace=${branchname}
fi
echo "${namespace}"
echo "${GIT_URL}"
appname=${GIT_URL//"https://github.com/vijikrish22/"/""}
echo "${appname}"
deploymentname="${appname}-deployment"
echo "${deploymentname}"
servicename="${appname}-service"

# Building and pushing image to DockerHub
IMAGE_NAME="vijikrish22/${appname}:${BUILD_NUMBER}"
docker build . -t $IMAGE_NAME

