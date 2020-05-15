FROM alpine:latest

RUN apk update && apk add --no-cache ca-certificates curl wget

RUN wget https://dl.signalsciences.net/sigsci-agent/sigsci-agent_latest.tar.gz && tar -xvf sigsci-agent_latest.tar.gz
COPY start.sh /app/start.sh
RUN chmod +x /app/start.sh


ENTRYPOINT ["/app/start.sh"]

