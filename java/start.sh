#!/bin/sh
/usr/sbin/sigsci-agent &
echo "Compiling..." && cd /example
javac -d classes -cp slf4j-log4j12-1.7.16.jar:log4j-1.2.17.jar:sigsci-msgpack-rpc-1.0.2.jar:sigsci-module-java-1.0.2.jar:jetty-all-uber.jar SimpleExampleServer.java RequestLogger.java TestServlet.java 
echo "Running..."
java -cp classes:slf4j-log4j12-1.7.16.jar:log4j-1.2.17.jar:sigsci-msgpack-rpc-1.0.2.jar:sigsci-module-java-1.0.2.jar:jetty-all-uber.jar com.signalsciences.example.SimpleExampleServer

#/usr/sbin/sigsci-agent