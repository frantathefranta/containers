#!/usr/bin/env sh
version="$(curl -sX GET "https://gitlab.com/passelecasque/varroa/-/releases/permalink/latest" | sed -n 's|.*releases/\([^"]*\).*|\1|p')"
# Gitlab doesn't have an API for checking a latest release. This curl query gets me the least amount of output, that looks like this:
# <html><body>You are being <a href="https://gitlab.com/passelecasque/varroa/-/releases/v35">redirected</a>.</body></html>%
#
# The sed just looks for the string between "releases/" and the following double quote (")
printf "%s" "${version}"
