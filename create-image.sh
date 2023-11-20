#!/bin/bash
TRIVY_VERSION=0.47.0
GRYPE_VERSION=0.73.3
SYFT_VERSION=0.97.1

rm -rf trivy
rm -rf grype
rm -rf syft
rm -f trivy.tar.gz
rm -f grype.tar.gz
rm -f syft.tar.gz

mkdir trivy
mkdir grype
mkdir syft

# Download Trivy
curl -L -o trivy.tar.gz https://github.com/aquasecurity/trivy/releases/download/v$TRIVY_VERSION/trivy_$(echo $TRIVY_VERSION)_Linux-64bit.tar.gz
tar zxvf trivy.tar.gz -C trivy

# Download Grype
curl -L -o grype.tar.gz https://github.com/anchore/grype/releases/download/v$GRYPE_VERSION/grype_$(echo $GRYPE_VERSION)_linux_amd64.tar.gz
tar zxvf grype.tar.gz -C grype

# Download Syft
curl -L -o syft.tar.gz https://github.com/anchore/syft/releases/download/v$SYFT_VERSION/syft_$(echo $SYFT_VERSION)_linux_amd64.tar.gz
tar zxvf syft.tar.gz -C syft

# Build image
docker build -t darinpope/tools-kitchen-sink:latest .

# Push image
echo $DOCKERHUB_API_TOKEN | docker login -u $DOCKERHUB_USER --password-stdin
docker image push darinpope/tools-kitchen-sink:latest

