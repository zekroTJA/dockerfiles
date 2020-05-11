FROM alpine:latest
LABEL maintainer="zekro <contact@zekro.de>"

# You can specify the desired Go version and
# architecture by specifying these variables 
# on docker build:
# docker build . -t goenv \
#    --build-arg GO_VERSION=1.13.10 \
#    --build-arg GO_ARCH=linux-arm64
ARG GO_VERSION="1.14.2"
ARG GO_ARCH="linux-amd64"

RUN apk add --no-cache \
        git curl vim openssh

WORKDIR /tmp/init
RUN curl -Lo go.tar.gz \
        https://dl.google.com/go/go${GO_VERSION}.${GO_ARCH}.tar.gz \
    && tar -C /usr/local -xzf go.tar.gz \
    && chmod +x /usr/local/go/bin/go \
    && rm go.tar.gz \
    && ln -s /usr/local/go/bin/go /usr/bin/go

RUN mkdir /lib64 \
    && ln -s /lib/libc.musl-x86_64.so.1 /lib64/ld-linux-x86-64.so.2

WORKDIR /root
ENV PATH="${PATH}:/usr/local/go/bin"
ENV EDITOR="vim"

ENTRYPOINT ["/bin/ash"]
