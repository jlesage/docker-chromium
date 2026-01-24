# Docker container for Chromium
[![Release](https://img.shields.io/github/release/jlesage/docker-chromium.svg?logo=github&style=for-the-badge)](https://github.com/jlesage/docker-chromium/releases/latest)
[![Docker Image Size](https://img.shields.io/docker/image-size/jlesage/chromium/latest?logo=docker&style=for-the-badge)](https://hub.docker.com/r/jlesage/chromium/tags)
[![Docker Pulls](https://img.shields.io/docker/pulls/jlesage/chromium?label=Pulls&logo=docker&style=for-the-badge)](https://hub.docker.com/r/jlesage/chromium)
[![Docker Stars](https://img.shields.io/docker/stars/jlesage/chromium?label=Stars&logo=docker&style=for-the-badge)](https://hub.docker.com/r/jlesage/chromium)
[![Build Status](https://img.shields.io/github/actions/workflow/status/jlesage/docker-chromium/build-image.yml?logo=github&branch=master&style=for-the-badge)](https://github.com/jlesage/docker-chromium/actions/workflows/build-image.yml)
[![Source](https://img.shields.io/badge/Source-GitHub-blue?logo=github&style=for-the-badge)](https://github.com/jlesage/docker-chromium)
[![Donate](https://img.shields.io/badge/Donate-PayPal-green.svg?style=for-the-badge)](https://paypal.me/JocelynLeSage)

This is a Docker container for [Chromium](https://www.chromium.org/Home/).

The graphical user interface (GUI) of the application can be accessed through a
modern web browser, requiring no installation or configuration on the client

> This Docker container is entirely unofficial and not made by the creators of
> Chromium.

---

[![Chromium logo](https://images.weserv.nl/?url=raw.githubusercontent.com/jlesage/docker-templates/master/jlesage/images/chromium-icon.png&w=110)](https://www.chromium.org/Home/)[![Chromium](https://images.placeholders.dev/?width=256&height=110&fontFamily=monospace&fontWeight=400&fontSize=52&text=Chromium&bgColor=rgba(0,0,0,0.0)&textColor=rgba(121,121,121,1))](https://www.chromium.org/Home/)

Chromium is an open-source browser project that aims to build a safer, faster, and
more stable way for all users to experience the web.

---

## Quick Start

**NOTE**:
    The Docker command provided in this quick start is an example, and parameters
    should be adjusted to suit your needs.

Launch the Chromium docker container with the following command:
```shell
docker run -d \
    --name=chromium \
    -p 5800:5800 \
    -v /docker/appdata/chromium:/config:rw \
    jlesage/chromium
```

Where:

  - `/docker/appdata/chromium`: Stores the application's configuration, state, logs, and any files requiring persistency.

Access the Chromium GUI by browsing to `http://your-host-ip:5800`.

## Documentation

Full documentation is available at https://github.com/jlesage/docker-chromium.

## Support or Contact

Having troubles with the container or have questions? Please
[create a new issue](https://github.com/jlesage/docker-chromium/issues).

For other Dockerized applications, visit https://jlesage.github.io/docker-apps.
