#!/usr/bin/env bash

if [ -f "/config/config.yaml" ]; then
    /usr/local/bin/beet web
else
    /usr/local/bin/beet --plugins=web web
fi
