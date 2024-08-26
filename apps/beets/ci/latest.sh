#!/usr/bin/env bash
version=$(curl -sL  https://pypi.python.org/pypi/beets/json |jq -r '. | .info.version')
version="${version%%_*}"
version="${version%%-*}"
printf "%s" "${version}"
