FROM zekro/minecraft-base:rcon-openjdk8-stretch

ARG SERVER_SOURCE="http://servers.technicpack.net/Technic/servers/tekkit/Tekkit_Server_3.1.2.zip"

# Java runtime parameters
ENV XMS="1G" \
    XMX="4G" \
    JVM_PARAMS=""

RUN curl -Lo server.zip $SERVER_SOURCE &&\
    unzip server.zip &&\
    rm -rf server.zip

CMD cron &&\
    java -jar \
        -Xms$XMS -Xmx$XMX $JVM_PARAMS \
        Tekkit.jar nogui