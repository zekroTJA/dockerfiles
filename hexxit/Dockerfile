FROM openjdk:8-stretch

ARG VERSION=1.0.10

ENV XMS=1G
ENV XMX=2G

RUN apt-get update &&\
    apt-get install -y \
        curl \
        unzip

WORKDIR /var/server

RUN curl -X GET -L \
        -o Hexxit.zip \
        http://servers.technicpack.net/Technic/servers/hexxit/Hexxit_Server_v${VERSION}.zip && \
    unzip Hexxit.zip &&\
    rm -f Hexxit.zip

EXPOSE 25565 25575

CMD java -jar -Xms${XMS} -Xmx${XMX} ./Hexxit.jar

# INFO:
# Directories which should be mounted:
#
# /var/server/world
# /var/server/server.properties
# /var/server/white-list.txt
# /var/server/ops.txt
