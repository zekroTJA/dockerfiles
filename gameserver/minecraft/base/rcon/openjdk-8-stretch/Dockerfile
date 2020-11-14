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

EXPOSE 25565 25575