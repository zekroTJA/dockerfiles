FROM openjdk:8-stretch

ARG VERSION=1.0.0

ENV XMS=1G
ENV XMX=2G

RUN apt-get update &&\
    apt-get install -y \
    curl \
    unzip

WORKDIR /var/server

RUN curl -X GET -L \
    -o Tekkit.zip \
    --insecure \
    https://servers.technicpack.net/Technic/servers/tekkit-2/Tekkit-2_Server_v${VERSION}.zip &&\
    unzip Tekkit.zip &&\
    rm -f Tekkit.zip &&\
    mv forge-* Tekkit.jar

RUN echo "eula=true" > eula.txt

EXPOSE 25565 25575

CMD java -jar -Xms${XMS} -Xmx${XMX} ./Tekkit.jar

# INFO:
# Directories which should be mounted:
#
# /var/server/world
# /var/server/server.properties
# /var/server/white-list.json
# /var/server/ops.json
