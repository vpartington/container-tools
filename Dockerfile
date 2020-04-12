FROM ubuntu:18.04

RUN apt-get update && apt-get install -y \
    dnsutils \
    inetutils-ping \
    netcat \
    telnet \
    traceroute
	
