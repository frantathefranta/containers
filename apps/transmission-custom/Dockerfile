FROM ghcr.io/home-operations/transmission:4.1.0

USER root:root
RUN apk add --no-cache git pipx && \
    pipx install git+https://github.com/x1ppy/gazelle-origin

USER nobody:nogroup
LABEL org.opencontainers.image.source="https://github.com/transmission/transmission"
