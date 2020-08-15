FROM openjdk:8-alpine

ARG VERSION=latest

ENV XMS=1G
ENV XMX=3G

RUN apk add curl

WORKDIR /var/server

RUN curl -X GET -L \
        -o server.tar.gz \
        https://cdn.zekro.de/modpacks/evolved-infinity/release/server/evolved-infinity-server-${VERSION}.tar.gz \
    && tar -xzf server.tar.gz \
    && rm -f server.tar.gz

COPY ./run.sh ./run.sh

RUN mv forge-* forge.jar

RUN mv ./config/MoreDefaultOptions/server.properties ./_server.properties

EXPOSE 25565 25575

CMD sh ./run.sh
