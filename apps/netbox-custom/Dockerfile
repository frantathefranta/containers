FROM netboxcommunity/netbox:v4.4

COPY ./apps/netbox-custom/plugin_requirements.txt /opt/netbox/
RUN /usr/local/bin/uv pip install -r /opt/netbox/plugin_requirements.txt

LABEL org.opencontainers.image.source="https://github.com/netbox-community/netbox"
