FROM ubuntu:18.04

ENV KUBE_VERSION 1.20.0

RUN apt-get update && \
    apt-get install -y \
        curl \
        docker.io \
        dnsutils \
        gnupg \
        inetutils-ping \
        jq \
        netcat-openbsd \
        telnet \
        traceroute \
        vim \
        wget

RUN  cd /usr/local/bin \
    && curl -O https://storage.googleapis.com/kubernetes-release/release/v${KUBE_VERSION}/bin/linux/amd64/kubectl \
    && chmod 755 /usr/local/bin/kubectl

RUN . /etc/os-release && \
    echo "deb http://download.opensuse.org/repositories/devel:/kubic:/libcontainers:/stable/x${NAME}_${VERSION_ID}/ /" > /etc/apt/sources.list.d/devel:kubic:libcontainers:stable.list && \
    wget -nv https://download.opensuse.org/repositories/devel:kubic:libcontainers:stable/x${NAME}_${VERSION_ID}/Release.key -O- | apt-key add - && \
    apt-get update && \
    apt-get install -y skopeo
