FROM citizenstig/nowasp

RUN apt-get update
RUN apt-get install -y apt-transport-https wget gnupg
#RUN a2enmod rewrite
RUN wget -qO - https://apt.signalsciences.net/release/gpgkey | apt-key add - 
RUN echo "deb https://apt.signalsciences.net/release/ubuntu trusty main" > /etc/apt/sources.list.d/sigsci-release.list
RUN apt-get update
RUN apt-get install -y sigsci-agent
RUN apt-get install -y sigsci-module-apache
RUN a2enmod signalsciences   
RUN mkdir /start

COPY start.sh /start/start.sh
RUN chmod +x /start/start.sh
ENTRYPOINT ["/start/start.sh"]