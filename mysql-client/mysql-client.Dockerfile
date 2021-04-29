FROM yishuida/alpine:3.12.3

LABEL Dockerfile = "https://code.choerodon.com.cn/choerodon-infra/mysql-client.git"
ARG MYSQL_CLIENT_VERSION=10.4.17-r1

COPY entrypoint.sh /home/default

RUN sudo apk add --no-cache mysql-client=$MYSQL_CLIENT_VERSION && \
        rm -rf /var/cache/apk/* && \
        sudo chmod +x ./entrypoint.sh
