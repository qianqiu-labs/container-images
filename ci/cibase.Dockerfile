
FROM gcr.io/kaniko-project/executor:v0.13.0 AS kaniko
FROM openjdk:8-jdk

ENV LANG=C.UTF-8 \
    TZ="Asia/Shanghai" \
    KANIKO_VERSION="v0.13.0" \
    DOCKER_VERSION="19.03.14" \
    YQ_VERSION=3.4.1 \
    HELM_VERSION=v3.4.0 \
    HELM_PUSH_VERSION=v0.9.0

COPY --from=kaniko /kaniko /kaniko 


# install docker 
RUN set -eux; \
	\
	arch="$(uname -m)"; \
	case "$arch" in \
		'x86_64') \
			url='https://download.docker.com/linux/static/stable/x86_64/docker-19.03.14.tgz'; \
			;; \
		'armhf') \
			url='https://download.docker.com/linux/static/stable/armel/docker-19.03.14.tgz'; \
			;; \
		'armv7') \
			url='https://download.docker.com/linux/static/stable/armhf/docker-19.03.14.tgz'; \
			;; \
		'aarch64') \
			url='https://download.docker.com/linux/static/stable/aarch64/docker-19.03.14.tgz'; \
			;; \
		*) echo >&2 "error: unsupported architecture ($arch)"; exit 1 ;; \
	esac; \
	\
	wget -O docker.tgz "$url"; \
	\
	tar --extract \
		--file docker.tgz \
		--strip-components 1 \
		--directory /usr/local/bin/ \
	; \
	rm docker.tgz; \
	\
	dockerd --version; \
	docker --version; \
    ln -s /kaniko/executor /kaniko/kaniko; \
    set -eux; \
	apt-get update; \
	apt-get install -y --no-install-recommends \
# utilities for keeping Debian and OpenJDK CA certificates in sync
		ca-certificates p11-kit jq git npm yarn \
	; \
	rm -rf /var/lib/apt/lists/* && \
    wget -qO /usr/bin/yq "https://github.com/mikefarah/yq/releases/download/${YQ_VERSION}/yq_linux_${arch}" && \
    chmod a+x /usr/bin/yq && \
    echo "https://get.helm.sh/helm-${HELM_VERSION}-linux-${arch}.tar.gz" && \
    wget -qO "/tmp/helm-${HELM_VERSION}-linux-${arch}.tar.gz" "https://get.helm.sh/helm-${HELM_VERSION}-linux-${dpkgArch}.tar.gz"  && \
    tar xzf "/tmp/helm-${HELM_VERSION}-linux-${arch}.tar.gz" -C /tmp && \
    mv /tmp/linux-${dpkgArch}/helm /usr/bin/helm && \
    rm -r /tmp/* &&  \
    helm plugin install --version $HELM_PUSH_VERSION https://github.com/chartmuseum/helm-push && \
    npm install -g typescript@3.6.3