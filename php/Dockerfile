FROM debian:8.0

# initial setup
RUN sed -i '/jessie-updates/d' /etc/apt/sources.list  # Now archived
RUN apt-get update
RUN apt-get install -y apt-transport-https wget sed curl
RUN wget -qO - https://apt.signalsciences.net/gpg.key | apt-key add -
RUN echo "deb https://apt.signalsciences.net/release/debian/ jessie main" > /etc/apt/sources.list.d/sigsci-release.list
RUN apt-get update

# install
RUN apt-get -y install apache2 php5
RUN apt-get -y install sigsci-agent

# copy app code
CMD mkdir app
RUN cd /var/www/html && curl -O https://dl.signalsciences.net/sigsci-module-php/sigsci-module-php_latest.tar.gz && tar -xvzf sigsci-module-php_latest.tar.gz -C /var/www/html --strip-components=1
COPY app /var/www/html/
RUN rm /var/www/html/index.html

COPY start.sh /app/start.sh
RUN chmod +x /app/start.sh
RUN mkdir /etc/sigsci

ENTRYPOINT ["/app/start.sh"]