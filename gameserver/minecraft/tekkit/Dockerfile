# --- RCON client build stage
FROM python:3.7-stretch as build

WORKDIR /build/rcon

# Clone and build github.com/zekroTJA/rconclient
RUN git clone https://github.com/zekroTJA/rconclient \
      --branch master --depth 1 .
RUN python3 -m pip install -r requirements.txt &&\
    python3 -m pip install pyinstaller
RUN pyinstaller rconclient/main.py --onefile

# --- OpenJDK JRE final stage
FROM openjdk:8-jre-stretch as final

LABEL maintainer="zekro <contact@zekro.de>" \
      version="1.0.0" \
      description="Tekkit Lite server dockerized"

# Source to download Tekkit lite server from
ARG SERVER_SOURCE="https://cdn.zekro.de/modpacks/bpbsm/1.5/server.tar.gz"

# Java runtime parameters
ENV XMS="1G" \
    XMX="4G" \
    JVM_PARAMS=""

WORKDIR /mc

# Get rconclient binary from build stage and create
# link script to execute with server.properties
COPY --from=build /build/rcon/dist/main /usr/bin/rconcli
RUN chmod +x /usr/bin/rconcli
RUN printf "#!/bin/bash\nrconcli --properties /mc/server.properties --auto-reconnect --rcon-encoding cp1252 \$@" \
        | tee /usr/bin/rcon &&\
    chmod +x /usr/bin/rcon

# Setting up backup system
COPY scripts /scripts
RUN chmod +x /scripts/*
RUN apt-get update &&\
    apt-get install -y cron
RUN mkdir -p /etc/cron.d &&\
    printf "0 3,15 * * * /scripts/backup.sh >> /var/log/cron.log 2>&1\n" \
        | tee /etc/cron.d/backups &&\
    crontab /etc/cron.d/backups
RUN mkdir /backups

# Download tekkit server
RUN curl -Lo server.tgz $SERVER_SOURCE &&\
    tar -xzvf server.tgz &&\
    rm -rf server.tgz

EXPOSE 25565 25575
CMD cron &&\
    java -jar \
        -Xms$XMS -Xmx$XMX $JVM_PARAMS \
        TekkitLite.jar nogui
