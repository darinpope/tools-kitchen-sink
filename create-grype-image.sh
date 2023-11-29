#!/bin/bash
GRYPE_VERSION=0.73.3

rm -rf grype
rm -f grype.tar.gz

mkdir grype

# Download Grype
curl -L -o grype.tar.gz https://github.com/anchore/grype/releases/download/v$GRYPE_VERSION/grype_$(echo $GRYPE_VERSION)_linux_amd64.tar.gz
tar zxvf grype.tar.gz -C grype

# Build images
docker build -f Dockerfile-grype -t darinpope/grype:${GRYPE_VERSION} .

# Push image
echo $DOCKERHUB_API_TOKEN | docker login -u $DOCKERHUB_USER --password-stdin
docker image push darinpope/grype:${GRYPE_VERSION}
