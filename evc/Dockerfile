FROM openjdk:8-stretch

ARG VERSION=alpha

ENV XMS=1G
ENV XMX=3G

RUN apt-get update &&\
    apt-get install -y \
        curl \
        unzip

WORKDIR /var/server

RUN curl -X GET -L \
        -o server.zip \
        https://cdn.zekro.de/modpacks/evolved-combat/${VERSION}/server.zip && \
    unzip server.zip &&\
    rm -f server.zip

RUN mv forge-* forge.jar

EXPOSE 25565 25575

CMD java -jar -Xms${XMS} -Xmx${XMX} ./forge.jar

# Directories and files you may want to bind:
# /var/server/world
# /var/server/backups
# /var/server/ops.json
# /var/server/server.properties
# /var/server/whitelist.json
