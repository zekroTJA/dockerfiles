FROM openjdk:8

ARG PACKID=36

ENV XMS=1G
ENV XMX=4G
ENV JVM_OPTIONS="-XX:+UseG1GC -XX:+UnlockExperimentalVMOptions"

WORKDIR /var/server

RUN curl -Lo setup https://api.modpacks.ch/public/modpack/36/38/server/linux \
    && chmod +x ./setup \
    && ./setup ${PACKID} --noscript --latest \
    && echo "eula=true" > eula.txt \
    && mv forge-*.jar forge-server.jar

EXPOSE 25565 25575

CMD java -server ${JVM_OPTIONS} \
         -Xmx${XMX} -Xms${XMS} -jar forge-server.jar nogui


# Directories and files you may want to bind:
# /var/server/world
# /var/server/backups
# /var/server/ops.json
# /var/server/server.properties
# /var/server/whitelist.json
