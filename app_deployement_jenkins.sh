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
appname=${GIT_URL//"https://github.com/srinub/"/""}
echo "${appname}"
deploymentname="${appname}-deployment"
echo "${deploymentname}"
servicename="${appname}-service"

# Building and pushing image to DockerHub
IMAGE_NAME="srinub66/${appname}:${BUILD_NUMBER}"
docker build . -t $IMAGE_NAME
docker login -u srinub66 -p "Srinu_66"
docker push $IMAGE_NAME


#Verifying if deployment already exists
VAR=$(kubectl get deployment ${deploymentname} --namespace=${namespace} | tail -n +2 | awk '{print $1}')
echo ${VAR}
if [[ "$VAR" = "${deploymentname}" ]]; then 
echo "Deployment ${deploymentname} exists, performing a rolling update"
sed -i "s|\$appname|${appname}|g" ${WORKSPACE}/deployment.yaml
sed -i "s|\$deploymentname|${deploymentname}|g" ${WORKSPACE}/deployment.yaml
sed -i "s|\$IMAGE_NAME|${IMAGE_NAME}|g" ${WORKSPACE}/deployment.yaml
kubectl apply -f ${WORKSPACE}/deployment.yaml --namespace=${namespace}
else
echo "Deployment ${deploymentname} doesnt exist, Creating now"
sed -i "s|\$appname|${appname}|g" ${WORKSPACE}/deployment.yaml
sed -i "s|\$deploymentname|${deploymentname}|g" ${WORKSPACE}/deployment.yaml
sed -i "s|\$IMAGE_NAME|${IMAGE_NAME}|g" ${WORKSPACE}/deployment.yaml
sed -i "s|\$appname|${appname}|g" ${WORKSPACE}/service.yaml
sed -i "s|\$servicename|${servicename}|g" ${WORKSPACE}/service.yaml
sed -i "s|\$deploymentname|${deploymentname}|g" ${WORKSPACE}/service.yaml
kubectl get ns ${namespace} || kubectl create ns ${namespace}
kubectl create -f ${WORKSPACE}/deployment.yaml --namespace=${namespace}
kubectl create -f ${WORKSPACE}/service.yaml --namespace=${namespace}
fi