FROM yishuida/alpine:3.12.3

ENV SKYWALKING_VERSION=8.1.0

USER 1000

RUN wget https://archive.apache.org/dist/skywalking/8.1.0/apache-skywalking-apm-8.1.0.tar.gz; \
    tar zxf apache-skywalking-apm-8.1.0.tar.gz; \
    cp -r apache-skywalking-apm-bin/agent /skywalking/agent; \
    rm -rf ./apache-skywalking-*;
