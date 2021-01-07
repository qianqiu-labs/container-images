FROM alpine:3.12.3

ENV SKYWALKING_VERSION=8.1.0

RUN addgroup -g 1000 -S agent; \
    adduser -G 1000 -H -S -u 1000 agent; \
    wget https://archive.apache.org/dist/skywalking/8.1.0/apache-skywalking-apm-8.1.0.tar.gz; \
    tar zxf apache-skywalking-apm-8.1.0.tar.gz; \
    cp -r apache-skywalking-apm-bin/agent /skywalking; \
    rm -rf ./apache-skywalking-*;
