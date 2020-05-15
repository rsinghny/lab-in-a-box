#!/bin/sh
echo "Starting Tomcat..."
/opt/tomcat/bin/startup.sh
echo "Compile maven...."
cd /app && mvn tomcat7:deploy
echo "Starting SigSci Agent..."
/usr/sbin/sigsci-agent
