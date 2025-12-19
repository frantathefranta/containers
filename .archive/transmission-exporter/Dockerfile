FROM docker.io/library/alpine:3.23.2

ARG TARGETPLATFORM
ARG VERSION
ARG CHANNEL

USER root
WORKDIR /app

RUN apk add --no-cache \
    ca-certificates \
    curl \
    && \
    mkdir -p /app \
    && \
    case "${TARGETPLATFORM}" in \
        'linux/amd64') export ARCH='amd64' ;; \
        'linux/arm64') export ARCH='arm64' ;; \
    esac \
    && \
    curl -L https://github.com/frantathefranta/transmission-exporter/releases/download/v${VERSION}/transmission-exporter-v${VERSION}-linux-${ARCH} -o /app/transmission-exporter \
    # && \
    # chown -R root:root /app \
    # && \
    # chmod -R 755 /app \
    && \
    chmod +x /app/transmission-exporter

USER nobody:nogroup

CMD ["/app/transmission-exporter"]

LABEL org.opencontainers.image.source="https://github.com/frantathefranta/transmission-exporter"
