FROM centos:7

RUN yum -y upgrade
RUN yum -y install httpd sed curl vim sudo
RUN yum install -y apt-transport-https wget
RUN yum update

# Set up some server stuff
RUN mkdir /app && mkdir /etc/sigsci
COPY start.sh /app/start.sh
RUN chmod +x /app/start.sh

# copy app code
COPY app/index.html /var/www/html/index.html

# Step 1 - Add the Package Repositories RedHat CentOS 7
COPY sigsci.repo /etc/yum.repos.d/sigsci.repo

# Step 2 - Install the Signal Sciences Agent Package
RUN sudo yum -y install sigsci-agent

ENTRYPOINT ["/app/start.sh"]