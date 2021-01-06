FROM alpine:3.12

LABEL Dockerfile = "https://code.choerodon.com.cn/choerodon-infra/mysql-client.git"

RUN adduser -h /home/mysql -s /bin/sh -u 1001 -D mysql-client && \
    sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories && \
    apk add --no-cache mysql-client
USER 1001