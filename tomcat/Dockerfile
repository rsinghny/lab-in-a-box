FROM tomcat:9.0


# initial setup
RUN apt-get update
RUN apt-get install -y apt-transport-https wget sed curl
RUN wget -qO - https://apt.signalsciences.net/gpg.key | apt-key add -
RUN echo "deb https://apt.signalsciences.net/release/debian/ jessie main" > /etc/apt/sources.list.d/sigsci-release.list
RUN apt-get update

# install
RUN apt-get -y install apache2 php
RUN apt-get -y install sigsci-agent


# Install and Configure SigSci Servlet Module
RUN cd /tmp
RUN wget https://dl.signalsciences.net/sigsci-module-java/sigsci-module-java_latest.tar.gz
RUN tar -xvzf sigsci-module-java_latest.tar.gz
RUN mv *.jar /usr/local/tomcat/lib/.

#Add SigSci Module to web.xml
COPY app/web.xml /usr/local/tomcat/conf/web.xml
COPY start.sh /start.sh
RUN chmod +x /start.sh
ENTRYPOINT ["/start.sh"]
