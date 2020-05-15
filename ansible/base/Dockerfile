# BASE image - used as a starting point by MASTER and HOST images

# Uses official Ubuntu 16.04image as a starting point
FROM ubuntu:16.04

# install required packages
RUN apt-get update \
    && apt-get install -y \
        aptitude ca-certificates iputils-ping vim curl wget apt-transport-https openssh-server python apt-utils \
    && rm -rf /var/lib/apt/lists/*

# ensure that required directories are created
RUN mkdir /var/run/sshd
RUN mkdir /root/.ssh