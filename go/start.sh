#!/bin/sh

echo "Starting sigsci-agent"
nohup /usr/sbin/sigsci-agent > /tmp/sigsci-agent.log  &

echo "starting go app"
/go/bin/go-hello-world

