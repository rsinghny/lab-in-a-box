FROM ubuntu:trusty

# Install packages
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && \
  apt-get -y install supervisor apt-transport-https wget git apache2 libapache2-mod-php5 mysql-server php5-mysql pwgen php-apc php5-mcrypt && \
  echo "ServerName localhost" >> /etc/apache2/apache2.conf

# Add image configuration and scripts
ADD start-apache2.sh /start-apache2.sh
ADD start-mysqld.sh /start-mysqld.sh
ADD start.sh /start.sh
RUN chmod 755 /*.sh
ADD my.cnf /etc/mysql/conf.d/my.cnf
ADD supervisord-apache2.conf /etc/supervisor/conf.d/supervisord-apache2.conf
ADD supervisord-mysqld.conf /etc/supervisor/conf.d/supervisord-mysqld.conf

# Remove pre-installed database
RUN rm -rf /var/lib/mysql/*

# Add MySQL utils
ADD create_xvwa_db.sh /create_xvwa_db.sh
RUN chmod 755 /*.sh

# config to enable .htaccess
ADD apache_default /etc/apache2/sites-available/000-default.conf
RUN a2enmod rewrite

RUN rm -fr /var/www/html
RUN git clone https://github.com/s4n7h0/xvwa /var/www/html/xvwa

#Enviornment variables to configure php
ENV PHP_UPLOAD_MAX_FILESIZE 10M
ENV PHP_POST_MAX_SIZE 10M

# Add volumes for MySQL 
VOLUME  ["/etc/mysql", "/var/lib/mysql" ]

# Add Signal Sciences Apache agent
RUN wget -qO - https://apt.signalsciences.net/release/gpgkey | apt-key add - &&  echo "deb https://apt.signalsciences.net/release/ubuntu/ trusty main" | tee /etc/apt/sources.list.d/sigsci-release.list && apt-get update
RUN apt-get install -y sigsci-agent
RUN apt-get install -y sigsci-module-apache
RUN a2enmod signalsciences   
RUN mkdir /etc/sigsci

EXPOSE 80 3306
CMD ["/start.sh"]
