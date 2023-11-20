FROM cgr.dev/chainguard/wolfi-base

COPY trivy/trivy /usr/local/bin
COPY grype/grype /usr/local/bin
COPY syft/syft /usr/local/bin
