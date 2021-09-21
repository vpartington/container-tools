FROM ubuntu:21.04

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Europe/Amsterdam
ENV KUBE_VERSION v1.21.4
ENV MINIO_VERSION RELEASE.2021-09-02T09-21-27Z
ENV YQ_VERSION v4.12.2

ADD "https://www.random.org/cgi-bin/randbyte?nbytes=10&format=h" skipcache

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y \
        curl \
        docker.io \
        dnsutils \
        gnupg \
        inetutils-ping \
        jq \
        netcat-openbsd \
        python3-pip \
        skopeo \
        sudo \
        telnet \
        traceroute \
        vim \
        wget

RUN rm skipcache

RUN curl https://baltocdn.com/helm/signing.asc | sudo apt-key add - && \
    sudo apt-get install apt-transport-https --yes && \
    echo "deb https://baltocdn.com/helm/stable/debian/ all main" | sudo tee /etc/apt/sources.list.d/helm-stable-debian.list && \
    sudo apt-get update && \
    sudo apt-get install -y helm

RUN curl -L https://storage.googleapis.com/kubernetes-release/release/${KUBE_VERSION}/bin/linux/amd64/kubectl -o /usr/local/bin/kubectl --fail && \
    chmod 755 /usr/local/bin/kubectl

RUN curl -L https://dl.min.io/client/mc/release/linux-amd64/archive/mc.${MINIO_VERSION} -o /usr/local/bin/mc --fail && \
    chmod 755 /usr/local/bin/mc

RUN curl -L https://github.com/mikefarah/yq/releases/download/${YQ_VERSION}/yq_linux_amd64 -o /usr/local/bin/yq --fail && \
    chmod 755 /usr/local/bin/yq

RUN pip install anchorecli

RUN useradd --uid 1001 --home-dir /work --create-home user && \
    chmod 777 /work && \
    echo "user ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

ENV HOME /work
WORKDIR /work
USER 1001
