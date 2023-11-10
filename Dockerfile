FROM debian:bullseye-slim

LABEL AboutImage="Debian_Bullseye_Chromium_NoVNC"

LABEL Maintainer="furacas <s@furacas.com>"

ARG DEBIAN_FRONTEND=noninteractive

# VNC Server Password
ENV VNC_TITLE="Chromium" \
# VNC Resolution(720p is preferable)
    VNC_RESOLUTION="1280x720" \
# VNC Shared Mode (0=off, 1=on)
    VNC_SHARED=0 \
# Local Display Server Port
    DISPLAY=:0 \
# Locale
    LANG=en_US.UTF-8 \
    LANGUAGE=en_US.UTF-8 \
    LC_ALL=C.UTF-8 \
    TZ="Asia/Shanghai"

SHELL ["/bin/bash", "-c"]

RUN apt-get update && \
    apt-get install -y tzdata ca-certificates supervisor  tigervnc-standalone-server websockify openbox libnss3 libgbm1 libasound2 fonts-droid-fallback chromium wget && \
# noVNC
    openssl req -new -newkey rsa:4096 -days 36500 -nodes -x509 -subj "/C=IN/ST=Maharastra/L=Private/O=Dis/CN=www.google.com" -keyout /etc/ssl/novnc.key  -out /etc/ssl/novnc.cert && \
    wget https://github.com/novnc/noVNC/archive/refs/tags/v1.4.0.tar.gz -O /tmp/novnc.tar.gz && \
    mkdir -p /opt/novnc && \
    tar -zxvf /tmp/novnc.tar.gz --strip-components=1 -C /opt/novnc && \
    mv /opt/novnc/vnc.html /opt/novnc/index.html && \
# TimeZone
    ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && \
    echo $TZ > /etc/timezone && \
# Wipe Temp Files
    rm -rf /var/lib/apt/lists/* && \
    apt-get remove -y wget && \
    apt-get clean

COPY rootfs/ /

ENTRYPOINT ["supervisord", "-l", "/var/log/supervisord.log", "-c"]

CMD ["/config/supervisord.conf"]
