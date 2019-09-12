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
        -o server.tar.gz \
        https://cdn.zekro.de/modpacks/evolved-combat/${VERSION}/server.tar.gz && \
    tar -xzf server.tar.gz &&\
    rm -f server.tar.gz

RUN mv forge-* forge.jar

EXPOSE 25565 25575

CMD java -jar -Xms${XMS} -Xmx${XMX} ./forge.jar
