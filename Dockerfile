FROM cgr.dev/chainguard/wolfi-base

COPY trivy/trivy /usr/bin
COPY grype/grype /usr/bin
COPY syft/syft /usr/bin
