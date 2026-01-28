FROM ghcr.io/home-operations/transmission

RUN apk add --no-cache pipx && \
    pipx install git+https://github.com/x1ppy/gazelle-origin

LABEL org.opencontainers.image.source="https://github.com/transmission/transmission"
