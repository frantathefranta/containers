FROM docker.io/library/alpine:3.23.2

ARG TARGETPLATFORM
ARG VERSION
ARG CHANNEL

RUN apk add --no-cache ipmitool
RUN wget -q -O /tmp/source.zip "https://github.com/tigerblue77/Dell_iDRAC_fan_controller_Docker/archive/refs/tags/${VERSION}.zip" \
    && \
    mkdir /app \
    && \
    unzip -q -d /app /tmp/source.zip \
    && \
    cp /app/*/*.sh /app \
    && \
    chmod 0777 /app/functions.sh /app/Dell_iDRAC_fan_controller.sh \
    && \
    rm /tmp/source.zip

USER nobody:nogroup
WORKDIR /app
ENTRYPOINT ["/app/Dell_iDRAC_fan_controller.sh"]

LABEL org.opencontainers.image.source="https://github.com/tigerblue77/Dell_iDRAC_fan_controller_Docker"
