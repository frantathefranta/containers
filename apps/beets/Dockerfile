FROM docker.io/library/python:3.12.6-alpine

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
    BEETSDIR="/config" \
    HOME="/config"

RUN \
    apk add --no-cache --virtual=.build-deps \
      build-base \
    #   cairo-dev \
    #   cargo \
    #   cmake \
    #   ffmpeg-dev \
    #   fftw-dev \
      git \
    #   gobject-introspection-dev \
    #   jpeg-dev \
    #   libpng-dev \
    #   mpg123-dev \
    #   openjpeg-dev \
    #   python3-dev
    && \
    apk add --no-cache \
        bash \
    #   chromaprint \
    #   expat \
    #   ffmpeg \
    #   fftw \
        flac \
    #   gdbm \
    #   gobject-introspection \
    #   gst-plugins-good \
    #   gstreamer \
    #   imagemagick \
    #   jpeg \
    #   lame \
    #   libffi \
    #   libpng \
    #   mpg123 \
    #   nano \
    #   openjpeg \
    #   python3 \
    #   sqlite-libs
    # && \
    # pip install uv \
    && \
    pip install \
        beets==${VERSION} \
        flask \
        beets-extrafiles \
        beetcamp \
        python3-discogs-client \
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

COPY ./apps/beets/entrypoint.sh /entrypoint.sh
# COPY ./apps/beets/web-config.yaml /config/web-config.yaml
EXPOSE 8337
ENTRYPOINT [ "/entrypoint.sh" ]
# CMD ["/bin/bash"]

LABEL org.opencontainers.image.source="https://github.com/beetbox/beets"
