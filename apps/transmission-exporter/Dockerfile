FROM docker.io/library/alpine:3.20.3

ARG TARGETPLATFORM
ARG VERSION
ARG CHANNEL

RUN apk add --no-cache \
    ca-certificates \
    curl \
    tar \
    && \
    mkdir -p /app \
    && \
    case "${TARGETPLATFORM}" in \
        'linux/amd64') export ARCH='amd64' ;; \
        'linux/arm64') export ARCH='arm64' ;; \
    esac \
    && \
    curl -L https://github.com/frantathefranta/transmission-exporter/releases/download/${VERSION}/transmission-exporter-${VERSION}-linux-${ARCH}.tar.gz -o transmission-exporter.tar.gz \
    && \
    tar xvzf transmission-exporter.tar.gz \
    && \
    mv ./transmission-exporter /app/transmission-exporter

USER nobody:nogroup

ENTRYPOINT ["/app/transmission-exporter"]

LABEL org.opencontainers.image.source="https://github.com/frantathefranta/transmission-exporter"
