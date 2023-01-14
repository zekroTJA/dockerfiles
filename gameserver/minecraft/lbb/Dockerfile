FROM openjdk:18-alpine
WORKDIR /server
COPY server .
COPY world.tar.gz . 
RUN tar -xzvf world.tar.gz \
    && rm -f world.tar.gz
RUN chmod +x ./run.sh
EXPOSE 25565
ENTRYPOINT [ "./run.sh" ]
CMD [ "-Xmx2G", "-Xms1G" ]