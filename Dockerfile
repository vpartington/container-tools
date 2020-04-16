FROM ubuntu:18.04

RUN apt-get update && \
    apt-get install -y \
        curl \
        dnsutils \
        gnupg \
        inetutils-ping \
        netcat \
        telnet \
        traceroute \
        wget

RUN . /etc/os-release && \
    echo "deb http://download.opensuse.org/repositories/devel:/kubic:/libcontainers:/stable/x${NAME}_${VERSION_ID}/ /" > /etc/apt/sources.list.d/devel:kubic:libcontainers:stable.list && \
    wget -nv https://download.opensuse.org/repositories/devel:kubic:libcontainers:stable/x${NAME}_${VERSION_ID}/Release.key -O- | apt-key add - && \
    apt-get update && \
    apt-get install -y skopeo
