FROM yishuida/alpine:3.12.3

ENV SKYWALKING_VERSION=8.1.0 \
    USER=default

USER 1000

RUN wget -q https://archive.apache.org/dist/skywalking/${SKYWALKING_VERSION}/apache-skywalking-apm-${SKYWALKING_VERSION}.tar.gz; \
    tar zxf apache-skywalking-apm-${SKYWALKING_VERSION}.tar.gz; \
    sudo mkdir /skywalking; \
    sudo chown -R ${USER}:${USER} /skywalking; \
    cp -r apache-skywalking-apm-bin/agent /skywalking; \
    rm -rf ./apache-skywalking-*; \
