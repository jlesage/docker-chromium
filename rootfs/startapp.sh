#!/bin/sh
#
# NOTE: Parameters to pass to Chromium are defined via the `params` file of the
#       app service.
#

set -e # Exit immediately if a command exits with a non-zero status.
set -u # Treat unset variables as an error.

rm -rf /config/chromium/Singleton*

exec /usr/bin/chromium-browser "$@" >> /config/log/chromium/output.log 2>> /config/log/chromium/error.log

# vim:ft=sh:ts=4:sw=4:et:sts=4
