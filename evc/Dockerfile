FROM openjdk:8-stretch

ARG VERSION=alpha

ENV XMS=1G
ENV XMX=3G

RUN apt-get update &&\
    apt-get install -y \
        curl

WORKDIR /var/server

RUN curl -X GET -L \
        -o server.tar.gz \
        https://cdn.zekro.de/modpacks/evolved-combat/${VERSION}/server.tar.gz && \
    tar -xzf server.tar.gz &&\
    rm -f server.tar.gz

ADD ./run.sh ./run.sh

RUN mv forge-* forge.jar

RUN mv ./config ./_config &&\
    mkdir config

EXPOSE 25565 25575

CMD bash ./run.sh
