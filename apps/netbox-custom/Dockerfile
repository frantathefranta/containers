FROM netboxcommunity/netbox:v4.3

COPY ./apps/netbox-custom/plugin_requirements.txt /opt/netbox/
RUN /usr/local/bin/uv pip install -r /opt/netbox/plugin_requirements.txt
