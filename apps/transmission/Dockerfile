FROM docker.io/library/alpine:3.22.1

ARG TARGETPLATFORM
ARG VERSION
ARG CHANNEL

ENV HOME=/config \
    XDG_CONFIG_HOME=/config \
    XDG_DATA_HOME=/config \
    TRANSMISSION__RPC_PORT=9091 \
    TRANSMISSION_WEB_HOME=/app/web

#hadolint ignore=DL3018
RUN apk add --no-cache bash curl ca-certificates findutils geoip p7zip python3 \
    transmission-cli~"${VERSION}" \
    transmission-daemon~"${VERSION}" \
    transmission-remote~"${VERSION}"

RUN mkdir -p /app
# renovate: datasource=github-releases depName=a8m/envsubst
ENV ENVSUBST_VERSION=v1.4.2
RUN curl -L https://github.com/a8m/envsubst/releases/download/${ENVSUBST_VERSION}/envsubst-$(uname -s)-$(uname -m) -o /app/envsubst \
    && chmod +x /app/envsubst


#hadolint ignore=DL3059
RUN chown -R root:root /usr/bin/transmission* \
    && chmod -R 755 /usr/bin/transmission* \
    && ln -s /usr/bin/transmission-cli /app/transmission-cli \
    && ln -s /usr/bin/transmission-daemon /app/transmission-daemon \
    && ln -s /usr/bin/transmission-remote /app/transmission-remote \
    && ln -s /usr/share/transmission/public_html /app/web \
    && rm -rf /tmp/*

USER nobody:nogroup
WORKDIR /config
VOLUME ["/config"]

COPY ./apps/transmission/settings.json.tmpl /app/settings.json.tmpl
COPY ./apps/transmission/entrypoint.sh /entrypoint.sh
CMD ["/entrypoint.sh"]

LABEL org.opencontainers.image.source="https://github.com/transmission/transmission"
