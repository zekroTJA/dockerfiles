FROM jenkins/jenkins:latest

ARG NODE_VERSION=12.x
ARG GO_VERSION=1.12.7

USER root

RUN apt-get update &&\
    apt-get install -y \
        sudo \
        curl

RUN rm -rf /var/lib/apt/lists/* &&\
    echo jenkins ALL=\(ALL\) NOPASSWD: ALL >> /etc/sudoers

RUN curl -sL https://deb.nodesource.com/setup_${NODE_VERSION} | sudo -E bash - &&\
    apt-get install -y nodejs &&\
    npm install -g @vue/cli

RUN mkdir go_tmp &&\
    cd go_tmp &&\
    curl -L -X GET \
        -o go.tar.gz \
        https://dl.google.com/go/go${GO_VERSION}.linux-amd64.tar.gz &&\
    tar -C /usr/local -xzf go.tar.gz &&\
    cd .. &&\
    rm -r -f go_tmp

USER jenkins
