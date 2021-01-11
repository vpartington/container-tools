FROM ubuntu:18.04

ENV KUBE_VERSION 1.20.0
ENV YQ_VERSION v4.2.0 

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

RUN curl -L https://storage.googleapis.com/kubernetes-release/release/v${KUBE_VERSION}/bin/linux/amd64/kubectl -o /usr/local/bin/kubectl && \
    chmod 755 /usr/local/bin/kubectl

RUN curl -L https://github.com/mikefarah/yq/releases/download/${YQ_VERSION}/yq_linux_amd64 -o /usr/local/bin/yq && \
    chmod 755 /usr/local/bin/yq

RUN . /etc/os-release && \
    echo "deb http://download.opensuse.org/repositories/devel:/kubic:/libcontainers:/stable/x${NAME}_${VERSION_ID}/ /" > /etc/apt/sources.list.d/devel:kubic:libcontainers:stable.list && \
    wget -nv https://download.opensuse.org/repositories/devel:kubic:libcontainers:stable/x${NAME}_${VERSION_ID}/Release.key -O- | apt-key add - && \
    apt-get update && \
    apt-get install -y skopeo
