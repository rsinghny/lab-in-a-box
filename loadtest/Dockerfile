FROM node
MAINTAINER Signal Sciences, Corp.

RUN apt-get update; apt-get install -y vim
RUN npm install -g loadtest artillery; artillery dino

COPY scripts/* /opt/

WORKDIR /opt
