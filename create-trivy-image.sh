#!/bin/bash
TRIVY_VERSION=0.47.0

rm -rf trivy
rm -f trivy.tar.gz

mkdir trivy

# Download Trivy
curl -L -o trivy.tar.gz https://github.com/aquasecurity/trivy/releases/download/v$TRIVY_VERSION/trivy_$(echo $TRIVY_VERSION)_Linux-64bit.tar.gz
tar zxvf trivy.tar.gz -C trivy

# Build images
docker build -f Dockerfile-trivy -t darinpope/trivy:${TRIVY_VERSION} .

# Push image
echo $DOCKERHUB_API_TOKEN | docker login -u $DOCKERHUB_USER --password-stdin
docker image push darinpope/trivy:${TRIVY_VERSION}
