#
# chromium Dockerfile
#
# https://github.com/jlesage/docker-chromium
#

# Build the PID namespace check tool.
FROM alpine:3.22 AS pid-namespace-check
WORKDIR /tmp
COPY src/check_pid_namespace/check_pid_namespace.c .
RUN apk --no-cache add build-base linux-headers
RUN gcc -static -Wall -Werror -o check_pid_namespace check_pid_namespace.c
RUN strip check_pid_namespace
RUN chmod u+s check_pid_namespace

# Pull base image.
FROM jlesage/baseimage-gui:alpine-3.24-v4.12.6

# Docker image version is provided via build arg.
ARG DOCKER_IMAGE_VERSION=

# Define software versions.
ARG CHROMIUM_VERSION=150.0.7871.128-r0

# Define software download URLs.

# Define working directory.
WORKDIR /tmp

# Install Chromium.
RUN \
    add-pkg \
        chromium=${CHROMIUM_VERSION} \
        chromium-lang==${CHROMIUM_VERSION}

# Install extra packages.
RUN \
    add-pkg \
        socat \
        adwaita-icon-theme \
        mesa-gl \
        mesa-dri-gallium \
        mesa-va-gallium

# Generate and install favicons.
RUN \
    APP_ICON_URL=https://github.com/jlesage/docker-templates/raw/master/jlesage/images/chromium-icon.png && \
    install_app_icon.sh "$APP_ICON_URL"

# Add files.
COPY rootfs/ /
COPY --from=pid-namespace-check /tmp/check_pid_namespace /usr/bin/

# Set internal environment variables.
RUN \
    set-cont-env APP_NAME "Chromium" && \
    set-cont-env APP_VERSION "$CHROMIUM_VERSION" && \
    set-cont-env DOCKER_IMAGE_VERSION "$DOCKER_IMAGE_VERSION" && \
    true

# Set public environment variables.
ENV \
    CHROMIUM_APP_URL= \
    CHROMIUM_REMOTE_DEBUGGING=0 \
    CHROMIUM_REMOTE_DEBUGGING_PORT=9222 \
    CHROMIUM_CUSTOM_ARGS=

# Expose ports.
#   - 9222: For Chromium remote debugging.
EXPOSE 9222

# Metadata.
LABEL \
      org.label-schema.name="chromium" \
      org.label-schema.description="Docker container for Chromium" \
      org.label-schema.version="${DOCKER_IMAGE_VERSION:-unknown}" \
      org.label-schema.vcs-url="https://github.com/jlesage/docker-chromium" \
      org.label-schema.schema-version="1.0"
