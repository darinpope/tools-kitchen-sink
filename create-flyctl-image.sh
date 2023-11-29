#!/bin/bash
FLYCTL_VERSION=0.1.129

rm -rf flyctl
rm -f flyctl.tar.gz

mkdir flyctl

# Download flyctl
curl -L -o flyctl.tar.gz https://github.com/superfly/flyctl/releases/download/v${FLYCTL_VERSION}/flyctl_$(echo $FLYCTL_VERSION)_Linux_x86_64.tar.gz
tar zxvf flyctl.tar.gz -C flyctl

# Build images
docker build -f Dockerfile-flyctl -t darinpope/flyctl:${FLYCTL_VERSION} .

# Push image
echo $DOCKERHUB_API_TOKEN | docker login -u $DOCKERHUB_USER --password-stdin
docker image push darinpope/flyctl:${FLYCTL_VERSION}
