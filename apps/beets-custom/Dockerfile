FROM docker.io/library/python:3.13.0-alpine

ARG TARGETPLATFORM
ARG VERSION
ARG CHANNEL

ENV \
    PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    PIP_ROOT_USER_ACTION=ignore \
    PIP_NO_CACHE_DIR=1 \
    PIP_DISABLE_PIP_VERSION_CHECK=1 \
    PIP_BREAK_SYSTEM_PACKAGES=1 \
    EDITOR="nvim" \
    BEETSDIR="/config" \
    HOME="/config"

RUN \
    apk add --no-cache --virtual=.build-deps \
      build-base \
      cargo \
      git \
    && \
    apk add --no-cache \
        bash \
        chromaprint \
        flac \
        imagemagick \
        neovim \
        restic \
    && \
    pip install \
        beets==${VERSION} \
        flask \
        beets-extrafiles \
        beetcamp \
        python3-discogs-client \
        typing-extensions \
        pyacoustid \
        pylast \
        requests \
        unidecode \
        git+https://github.com/x1ppy/beets-originquery \
    && \
    mkdir -p /config \
    && chown nobody:nogroup -R /config \
    && \
    apk del --purge .build-deps \
    && \
    rm -rf \
        /root/.cache \
        /root/.cargo \
        /tmp/*

USER nobody:nogroup
WORKDIR /config
VOLUME ["/config"]

COPY ./apps/beets-custom/entrypoint.sh /entrypoint.sh
EXPOSE 8337
ENTRYPOINT [ "/entrypoint.sh" ]

LABEL org.opencontainers.image.source="https://github.com/beetbox/beets"
