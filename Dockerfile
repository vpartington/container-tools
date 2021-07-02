FROM ubuntu:20.04

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Europe/Amsterdam
ENV KUBE_VERSION v1.21.2
ENV MINIO_VERSION RELEASE.2021-06-13T17-48-22Z
ENV YQ_VERSION v4.9.6

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

RUN . /etc/os-release && \
    echo "deb http://download.opensuse.org/repositories/devel:/kubic:/libcontainers:/stable/x${NAME}_${VERSION_ID}/ /" > /etc/apt/sources.list.d/devel:kubic:libcontainers:stable.list && \
    wget -nv https://download.opensuse.org/repositories/devel:kubic:libcontainers:stable/x${NAME}_${VERSION_ID}/Release.key -O- | apt-key add - && \
    apt-get update && \
    apt-get install -y skopeo

RUN curl -L https://storage.googleapis.com/kubernetes-release/release/${KUBE_VERSION}/bin/linux/amd64/kubectl -o /usr/local/bin/kubectl --fail && \
    chmod 755 /usr/local/bin/kubectl

RUN curl -L https://dl.min.io/client/mc/release/linux-amd64/archive/mc.${MINIO_VERSION} -o /usr/local/bin/mc --fail && \
    chmod 755 /usr/local/bin/mc

RUN curl -L https://github.com/mikefarah/yq/releases/download/${YQ_VERSION}/yq_linux_amd64 -o /usr/local/bin/yq --fail && \
    chmod 755 /usr/local/bin/yq
