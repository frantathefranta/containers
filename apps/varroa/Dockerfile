FROM alpine:3.21.0 AS dwld

ARG TARGETPLATFORM
ARG VERSION
ARG CHANNEL

RUN wget -q -O /tmp/varroa.zip "https://gitlab.com/passelecasque/varroa/-/jobs/artifacts/${VERSION}/download?job=compiled_varroa_released_version" \
    && \
    mkdir /app \
    && \
    unzip -q -d /app /tmp/varroa.zip \
    && \
    apk add --no-cache libc6-compat ca-certificates \
    &&


VOLUME /config
WORKDIR /config

CMD /usr/bin/varroa start --no-daemon

LABEL org.opencontainers.image.source="https://gitlab.com/passelecasque/varroa"
