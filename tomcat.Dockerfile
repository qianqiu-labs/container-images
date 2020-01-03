FROM tomcat:8

LABEL maintainers="Vista Yih"

ENV LANG=C.UTF-8 \
    TZ="Asia/Shanghai" \
    SKYWALKING_VERSION=6.3.0

RUN wget -qO "apache-skywalking-apm-${SKYWALKING_VERSION}.tar.gz" \
        "https://archive.apache.org/dist/skywalking/${SKYWALKING_VERSION}/apache-skywalking-apm-${SKYWALKING_VERSION}.tar.gz" && \
    tar zxf "apache-skywalking-apm-${SKYWALKING_VERSION}.tar.gz" && \
    mv apache-skywalking-apm-bin/agent / && \
    rm -rf apache-skywalking-apm* && \
    mv /agent/optional-plugins/apm-trace-ignore-plugin-${SKYWALKING_VERSION}.jar /agent/plugins
