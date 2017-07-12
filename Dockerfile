FROM alpine:3.5
MAINTAINER Truman Woo <truman@skrapit.co>

# apk install the Golang
RUN apk update && apk add go && \
    apk add curl && apk add git && apk add make && \
    apk add --update alpine-sdk && \
  rm -rf /var/cache/apk/* && mkdir /gopath && mkdir /gopath/bin

ENV GOROOT=/usr/lib/go \
    GOPATH=/gopath \
    GOBIN=/gopath/bin

ENV PATH=$PATH:$GOROOT/bin:$GOPATH/bin

# install glide
RUN curl https://glide.sh/get | sh

# default WORKDIR is GOPATH
WORKDIR $GOPATH/src
