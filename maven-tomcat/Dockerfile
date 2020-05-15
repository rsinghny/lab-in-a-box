FROM centos:7

RUN yum -y upgrade
RUN yum -y install httpd sed curl vim sudo
RUN yum install -y apt-transport-https wget
RUN yum -y install java java-devel
RUN yum update

# set JAVA_HOME
ENV JAVA_HOME /usr/lib/jvm/java-openjdk

# Step 1 - Add the Package Repositories RedHat CentOS 7
COPY sigsci.repo /etc/yum.repos.d/sigsci.repo

# Step 2 - Install the Signal Sciences Agent Package
RUN sudo yum -y install sigsci-agent

# Step 3 - Install maven and Tomcat
RUN mkdir /maven
RUN wget -q http://apache.cs.utah.edu/maven/maven-3/3.6.3/binaries/apache-maven-3.6.3-bin.tar.gz
RUN tar -xzvf apache-maven-3.6.3-bin.tar.gz -C /maven/
ENV PATH="/maven/apache-maven-3.6.3/bin:${PATH}"

RUN wget -q http://apache.cs.utah.edu/tomcat/tomcat-9/v9.0.30/bin/apache-tomcat-9.0.30.tar.gz
RUN tar -zxpvf apache-tomcat-9.0.30.tar.gz -C /opt/
RUN mv /opt/apache-tomcat-9.0.30/ /opt/tomcat
RUN echo "export CATALINA_HOME='/opt/tomcat/'" >> ~/.bashrc
RUN source ~/.bashrc 

# Step 4 - Copy over our settings files and maven app
COPY settings/tomcat-users.xml /opt/tomcat/conf
COPY settings/web.xml /opt/tomcat/webapps/examples/WEB-INF
COPY settings/settings.xml /maven/apache-maven-3.6.3/conf

RUN mkdir /app
COPY app/* /app/
COPY app/src /app/src

COPY /start.sh /app/start.sh
RUN chmod +x /app/start.sh

RUN mkdir -p /etc/sigsci

ENTRYPOINT ["/app/start.sh"]