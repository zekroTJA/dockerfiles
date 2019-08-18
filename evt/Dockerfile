FROM openjdk:8-stretch

ARG VERSION=1.2.168

ENV XMS=1G
ENV XMX=3G

RUN apt-get update &&\
    apt-get install -y \
        curl \
        unzip

WORKDIR /var/server

RUN curl -X GET -L \
        -o etv-server.zip \
        https://cdn.zekro.de/modpacks/evt/evolved_technics_server_v${VERSION}.zip && \
    unzip etv-server.zip &&\
    rm -f etv-server.zip

EXPOSE 25565 25575

CMD java -jar -Xms${XMS} -Xmx${XMX} ./minecraft_server.jar


# Directories and files you may want to bind:
# /var/server/world
# /var/server/backups
# /var/server/ops.json
# /var/server/server.properties
# /var/server/whitelist.json
