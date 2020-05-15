FROM amazonlinux:2

# initial setup
RUN yum -y upgrade
RUN yum -y install sed curl vim sudo net-tools procps apt-transport-https wget

# install amazon nginx
#RUN amazon-linux-extras install -y nginx1.12

# Set up some server stuff
RUN mkdir /app && mkdir /etc/sigsci

# Step 1 - Add the Package Repositories RedHat CentOS 7
COPY /app/nginx.repo /etc/yum.repos.d/nginx.repo
COPY /app/sigsci.repo /etc/yum.repos.d/sigsci.repo
RUN yum -y update

# Step 2 - Install the Signal Sciences Agent Package
RUN yum -y install nginx sigsci-agent

# Step 3 - Install the sigsci module
RUN yum install -y nginx-module-lua-`rpm -q --qf "%{VERSION}" nginx`
RUN yum -y install sigsci-module-nginx

COPY /app/nginx.conf /etc/nginx/nginx.conf
COPY app/index.html /var/www/html/index.html
COPY app/default.conf /etc/nginx/sites-enabled/default.conf
COPY start.sh /app/start.sh
RUN chmod +x /app/start.sh

ENTRYPOINT ["/app/start.sh"]
