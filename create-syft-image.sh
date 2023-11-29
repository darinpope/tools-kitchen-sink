#!/bin/bash
SYFT_VERSION=0.97.1

rm -rf syft
rm -f syft.tar.gz

mkdir syft

# Download Syft
curl -L -o syft.tar.gz https://github.com/anchore/syft/releases/download/v$SYFT_VERSION/syft_$(echo $SYFT_VERSION)_linux_amd64.tar.gz
tar zxvf syft.tar.gz -C syft

# Build images
docker build -f Dockerfile-syft -t darinpope/syft:${SYFT_VERSION} .

# Push image
echo $DOCKERHUB_API_TOKEN | docker login -u $DOCKERHUB_USER --password-stdin
docker image push darinpope/syft:${SYFT_VERSION}