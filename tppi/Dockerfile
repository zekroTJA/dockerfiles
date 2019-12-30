FROM openjdk:8-stretch

ARG VERSION=1.1.2a

ENV XMS=1G
ENV XMX=2G

RUN apt-get update &&\
    apt-get install -y \
        curl \
        unzip

WORKDIR /var/server

RUN curl -X GET -L \
        -o tppi.zip \
        http://servers.technicpack.net/Technic/servers/tppi/TPPIServer-v${VERSION}.zip && \
    unzip tppi.zip &&\
    rm -f tppi.zip

RUN curl -X GET -L \
        -o mods/legacyjavafixer-1.0.jar \
        http://files.minecraftforge.net/LegacyJavaFixer/legacyjavafixer-1.0.jar

EXPOSE 25565 25565

CMD java -jar -Xms${XMS} -Xmx${XMX} -XX:PermSize=256m -jar ./minecraft_server.jar nogui

# INFO:
# Directories which should be mounted:
#
# /var/server/world
# /var/server/server.properties
# /var/server/white-list.txt
# /var/server/ops.txt
