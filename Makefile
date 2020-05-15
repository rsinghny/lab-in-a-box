export DOCKERUSER=sigsci
export EXPOSE_PORT=4000
export REVERSE_AGENT_CONF=$(shell pwd)/agent-reverse-proxy.conf
export ENVOY_AGENT_CONF=$(shell pwd)/agent-envoy.conf
export AGENT_CONF=$(shell pwd)/agent.conf


help:
			@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'

howto: 			## By default all labs build on 3000 with the keys provided in the agent.conf and agent-reser-proxy.conf.
			## You may update the port in this Makefile or override at runtime by specifiying at runtime.
			## Example: make module-run EXPOSE_PORT=9999
			## 
			## You may also override the keys ona  per container basis using:
			## make module-name-run SIGSCI_ACCESSKEYID=[value] SIGSCI_SECRETACCESKEY=[value]
			## 
building:		## All labs can be built in this format:
			## `make module-name-build`  Example: `make php-build`
			## If needed most modules also provide a build-no-cache option.
			##
cleaning:		## All labs include a clean to remove running or stale containers.
			## `make module-name-clean` Example: `make ansible-clean`
			## 
destroy:		## Same as clean except deletes the image, as well:
			## `make module-name-destroy` Example: `make nginx-destroy`
			##


# Ansible

ansible-build:
	$(MAKE) -C ./ansible/ build

ansible-build-no-cache:
	$(MAKE) -C ./ansible/ build-no-cache

ansible-run:		## Ansible lab will generate 3 hosts and one master.
			## Running this will drop you into bash on the master.
			## Run `ansible-playbook -i inventory install_sigsci.yml` to run SigSci playbook.
			## 
	$(MAKE) -C ./ansible/ run	

ansible-deploy:
	$(MAKE) -C ./ansible/ deploy

ansible-clean:
	$(MAKE) -C ./ansible/ clean

ansible-destroy:
	$(MAKE) -C ./ansible/ destroy


# Apache
apache-build:	
	$(MAKE) -C ./apache/ build

apache-build-no-cache:
	$(MAKE) -C ./apache/ build-no-cache

apache-run:		## Apache based on Debian (must run `make apache-build` first.)
	$(MAKE) -C ./apache/ run	

apache-deploy:
	$(MAKE) -C ./apache/ deploy

apache-clean:
	$(MAKE) -C ./apache/ clean

apache-destroy:
	$(MAKE) -C ./apache/ destroy

# Apache-mutillidae

apache-mutillidae-build:	
	$(MAKE) -C ./apache-mutillidae/ build

apache-mutillidae-build-no-cache:
	$(MAKE) -C ./apache-mutillidae/ build-no-cache

apache-mutillidae-run:		## Apache based on Debian (must run `make apache-build` first.)
	$(MAKE) -C ./apache-mutillidae/ run	

apache-mutillidae-deploy:
	$(MAKE) -C ./apache-mutillidae/ deploy

apache-mutillidae-clean:
	$(MAKE) -C ./apache-mutillidae/ clean

apache-mutillidae-destroy:
	$(MAKE) -C ./apache-mutillidae/ destroy

#Apache-RedHat

apache-redhat-build:	
	$(MAKE) -C ./apache-redhat/ build

apache-redhat-build-no-cache:
	$(MAKE) -C ./apache-redhat/ build-no-cache

apache-redhat-run:		## Apache based on CentOS7 (must run `make apache-redhat-build` first.)
	$(MAKE) -C ./apache-redhat/ run	

apache-redhat-deploy:
	$(MAKE) -C ./apache-redhat/ deploy

apache-redhat-clean:
	$(MAKE) -C ./apache-redhat/ clean

apache-redhat-destroy:
	$(MAKE) -C ./apache-redhat/ destroy

#Envoy
envoy-build:	
	$(MAKE) -C ./envoy/ build
envoy-build-no-cache:
	$(MAKE) -C ./envoy/ build-no-cache

envoy-run:		## Apache based on CentOS7 (must run `make apache-redhat-build` first.)
	$(MAKE) -C ./envoy/ run	

envoy-deploy:
	$(MAKE) -C ./envoy/ deploy

envoy-clean:
	$(MAKE) -C ./envoy/ clean

envoy-destroy:
	$(MAKE) -C ./envoy/ destroy
# nginx

nginx-build:
	$(MAKE) -C ./nginx/ build

nginx-build-no-cache:
	$(MAKE) -C ./nginx/ build-no-cache

nginx-run:		## Nginx based on debian (must run `make nginx-build` first.)
	$(MAKE) -C ./nginx/ run	

nginx-deploy:
	$(MAKE) -C ./nginx/ deploy

nginx-clean:
	$(MAKE) -C ./nginx/ clean

nginx-destroy:
	$(MAKE) -C ./nginx/ destroy

#openresty

openresty-build:
	$(MAKE) -C ./openresty/ build

openresty-build-no-cache:
	$(MAKE) -C ./openresty/ build-no-cache

openresty-run:		## openresty based on debian 9 (must run `make openresty-build` first.)
	$(MAKE) -C ./openresty/ run	

openresty-deploy:
	$(MAKE) -C ./openresty/ deploy

openresty-clean:
	$(MAKE) -C ./openresty/ clean

openresty-destroy:
	$(MAKE) -C ./openresty/ destroy

#nginx-alpine

nginx-alpine-build:
	$(MAKE) -C ./nginx-alpine/ build

nginx-alpine-build-no-cache:
	$(MAKE) -C ./nginx-alpine/ build-no-cache

nginx-alpine-run:		## Nginx based on debian (must run `make nginx-build` first.)
	$(MAKE) -C ./nginx-alpine/ run	

nginx-alpine-deploy:
	$(MAKE) -C ./nginx-alpine/ deploy

nginx-alpine-clean:
	$(MAKE) -C ./nginx-alpine/ clean

nginx-alpine-destroy:
	$(MAKE) -C ./nginx-alpine/ destroy

# nginx-amazon

nginx-amazon-build:
	$(MAKE) -C ./nginx-amazon/ build

nginx-amazon-build-no-cache:
	$(MAKE) -C ./nginx-amazon/ build-no-cache

nginx-amazon-run:		## Nginx based on debian (must run `make nginx-build` first.)
	$(MAKE) -C ./nginx-amazon/ run	

nginx-amazon-deploy:
	$(MAKE) -C ./nginx-amazon/ deploy

nginx-amazon-clean:
	$(MAKE) -C ./nginx-amazon/ clean

nginx-amazon-destroy:
	$(MAKE) -C ./nginx-amazon/ destroy

# nginx-amazon1

nginx-amazon1-build:
	$(MAKE) -C ./nginx-amazon1/ build

nginx-amazon1-build-no-cache:
	$(MAKE) -C ./nginx-amazon1/ build-no-cache

nginx-amazon1-run:		## Nginx based on debian (must run `make nginx-build` first.)
	$(MAKE) -C ./nginx-amazon1/ run	

nginx-amazon1-deploy:
	$(MAKE) -C ./nginx-amazon1/ deploy

nginx-amazon1-clean:
	$(MAKE) -C ./nginx-amazon1/ clean

nginx-amazon1-destroy:
	$(MAKE) -C ./nginx-amazon1/ destroy

# nginx-amazon2

nginx-amazon2-build:
	$(MAKE) -C ./nginx-amazon2/ build

nginx-amazon2-build-no-cache:
	$(MAKE) -C ./nginx-amazon2/ build-no-cache

nginx-amazon2-run:		## Nginx based on debian (must run `make nginx-build` first.)
	$(MAKE) -C ./nginx-amazon2/ run	

nginx-amazon2-deploy:
	$(MAKE) -C ./nginx-amazon2/ deploy

nginx-amazon2-clean:
	$(MAKE) -C ./nginx-amazon2/ clean

nginx-amazon2-destroy:
	$(MAKE) -C ./nginx-amazon2/ destroy

#nginx-native

nginx-native-build:
	$(MAKE) -C ./nginx-native/ build

nginx-native-build-no-cache:
	$(MAKE) -C ./nginx-native/ build-no-cache

nginx-native-run:
	$(MAKE) -C ./nginx-native/ run	

nginx-native-deploy:
	$(MAKE) -C ./nginx-native/ deploy

nginx-native-clean:
	$(MAKE) -C ./nginx-native/ clean

nginx-native-destroy:
	$(MAKE) -C ./nginx-native/ destroy

# Python

python-build:
	$(MAKE) -C ./python/ build

python-build-no-cache:
	$(MAKE) -C ./python/ build-no-cache

python-run:		## Python based on flaskr (must run `make pyhton-build` first.)
	$(MAKE) -C ./python/ run	

python-deploy:
	$(MAKE) -C ./python/ deploy

python-clean:
	$(MAKE) -C ./python/ clean

python-destroy:
	$(MAKE) -C ./python/ destroy

# Python-Gunicorn

python-gunicorn-build:
	$(MAKE) -C ./python-gunicorn/ build

python-gunicorn-build-no-cache:
	$(MAKE) -C ./python-gunicorn/ build-no-cache

python-gunicorn-run: ## Python based on gunicorn/flask (must run `make pyhton-gunicorn-build` first.)
	$(MAKE) -C ./python-gunicorn/ run	

python-gunicorn-deploy:
	$(MAKE) -C ./python-gunicorn/ deploy

python-gunicorn-clean:
	$(MAKE) -C ./python-gunicorn/ clean

python-gunicorn-destroy:
	$(MAKE) -C ./python-gunicorn/ destroy

#NodeJS

nodejs-build:
	$(MAKE) -C ./nodejs/ build

nodejs-build-no-cache:
	$(MAKE) -C ./nodejs/ build-no-cache

nodejs-run:		## NodeJS based on Ubuntu:16.04 (must run `make nodejs-build` first.)
	$(MAKE) -C ./nodejs/ run	

nodejs-deploy:
	$(MAKE) -C ./nodejs/ deploy

nodejs-clean:
	$(MAKE) -C ./nodejs/ clean

nodejs-destroy:
	$(MAKE) -C ./nodejs/ destroy

# Java

java-build:
	$(MAKE) -C ./java/ build

java-build-no-cache:
	$(MAKE) -C ./java/ build-no-cache

java-run:		## Python based on Jetty Example (must run `make java-build` first.)
	$(MAKE) -C ./java/ run	

java-deploy:
	$(MAKE) -C ./java/ deploy

java-clean:
	$(MAKE) -C ./java/ clean

java-destroy:
	$(MAKE) -C ./java/ destroy

# Dropwizard

dropwizard-build:
	$(MAKE) -C ./dropwizard/ build

dropwizard-build-no-cache:
	$(MAKE) -C ./dropwizard/ build-no-cache

dropwizard-run:
	$(MAKE) -C ./dropwizard/ run

dropwizard-stop:
	$(MAKE) -C ./dropwizard/ stop

dropwizard-clean:
	$(MAKE) -C ./dropwizard/ clean

dropwizard-destroy:
	$(MAKE) -C ./dropwizard/ destroy

# PHP

php-build:
	$(MAKE) -C ./php/ build

php-build-no-cache:
	$(MAKE) -C ./php/ build-no-cache

php-run:		## PHP based on debian [use POST button to run attack] (must run `make php-build` first.)
	$(MAKE) -C ./php/ run	

php-deploy:
	$(MAKE) -C ./php/ deploy

php-clean:
	$(MAKE) -C ./php/ clean

php-destroy:
	$(MAKE) -C ./php/ destroy


# Reverse Proxy

reverse-proxy-build:
	$(MAKE) -C ./reverse-proxy/ build

reverse-proxy-build-no-cache:
	$(MAKE) -C ./reverse-proxy/ build-no-cache

reverse-proxy-run:	## Reverse Proxy based on debian (must run `make reverse-proxy-build` first.)
	$(MAKE) -C ./reverse-proxy/ run	

reverse-proxy-deploy:
	$(MAKE) -C ./reverse-proxy/ deploy

reverse-proxy-clean:
	$(MAKE) -C ./reverse-proxy/ clean

reverse-proxy-destroy:
	$(MAKE) -C ./reverse-proxy/ destroy

# golang

go-build:
	$(MAKE) -C ./go/ build

go-build-no-cache:
	$(MAKE) -C ./go/ build-no-cache

go-run:			## go module based on golang (must run `make go-build` first.)
	$(MAKE) -C ./go/ run	

go-deploy:
	$(MAKE) -C ./go/ deploy

go-clean:
	$(MAKE) -C ./go/ clean

go-destroy:
	$(MAKE) -C ./go/ destroy

# HAProxy

haproxy-build:
	$(MAKE) -C ./haproxy/ build

haproxy-build-no-cache:
	$(MAKE) -C ./haproxy/ build-no-cache

haproxy-run:		## HAProxy based on Ubuntu 17.10 + LUA 5.3 + HAProxy 7+ (must run `make haproxy-build` first.)
	$(MAKE) -C ./haproxy/ run	

haproxy-deploy:
	$(MAKE) -C ./haproxy/ deploy

haproxy-clean:
	$(MAKE) -C ./haproxy/ clean
	
haproxy-destroy:
	$(MAKE) -C ./haproxy/ destroy

# HAProxy-Alpine

haproxy-alpine-build:
	$(MAKE) -C ./haproxy-alpine/ build

haproxy-alpine-build-no-cache:
	$(MAKE) -C ./haproxy-alpine/ build-no-cache

haproxy-alpine-run:		## HAProxy based on Ubuntu 17.10 + LUA 5.3 + HAProxy 7+ (must run `make haproxy-build` first.)
	$(MAKE) -C ./haproxy-alpine/ run	

haproxy-alpine-deploy:
	$(MAKE) -C ./haproxy-alpine/ deploy

haproxy-alpine-clean:
	$(MAKE) -C ./haproxy-alpine/ clean
	
haproxy-alpine-destroy:
	$(MAKE) -C ./haproxy-alpine/ destroy

# loadtest
loadtest-build:
	$(MAKE) -C ./loadtest/ build

loadtest-build-no-cache:
	$(MAKE) -C ./loadtest/ build-no-cache

loadtest-run:		## Load test your build! `loadtest -n 1000 -c 10 --rps 1000 "http://localhost:4000"`
	$(MAKE) -C ./loadtest/ run	

loadtest-deploy:
	$(MAKE) -C ./loadtest/ deploy

loadtest-clean:
	$(MAKE) -C ./loadtest/ clean
	
loadtest-destroy:
	$(MAKE) -C ./loadtest/ destroy

# Apache CentOS 7

apache-centos7-build:
	$(MAKE) -C ./apache-centos7/ build

apache-centos7-build-no-cache:
	$(MAKE) -C ./apache-centos7/ build-no-cache

apache-centos7-run:		## Apache on CentOS 7 (must run `make apache-centos7-build` first.)
	$(MAKE) -C ./apache-centos7/ run	

apache-centos7-deploy:
	$(MAKE) -C ./apache-centos7/ deploy

apache-centos7-clean:
	$(MAKE) -C ./apache-centos7/ clean
	
apache-centos7-destroy:
	$(MAKE) -C ./apache-centos7/ destroy

# Tomcat

tomcat-build:
	$(MAKE) -C ./tomcat/ build

tomcat-build-no-cache:
	$(MAKE) -C ./tomcat/ build-no-cache

tomcat-run:		## Apache on CentOS 7 (must run `make apache-centos7-build` first.)
	$(MAKE) -C ./tomcat/ run	

tomcat-deploy:
	$(MAKE) -C ./tomcat/ deploy

tomcat-clean:
	$(MAKE) -C ./tomcat/ clean
	
tomcat-destroy:
	$(MAKE) -C ./tomcat/ destroy

# httpbin

httpbin-build:
	$(MAKE) -C ./httpbin/ build

httpbin-build-no-cache:
	$(MAKE) -C ./httpbin/ build-no-cache

httpbin-run:
	$(MAKE) -C ./httpbin/ run	

httpbin-deploy:
	$(MAKE) -C ./httpbin/ deploy

httpbin-clean:
	$(MAKE) -C ./httpbin/ clean
	
httpbin-destroy:
	$(MAKE) -C ./httpbin/ destroy

# xvwa

xvwa-build:
	$(MAKE) -C ./xvwa/ build

xvwa-build-no-cache:
	$(MAKE) -C ./xvwa/ build-no-cache

xvwa-run:
	$(MAKE) -C ./xvwa/ run	

xvwa-deploy:
	$(MAKE) -C ./xvwa/ deploy

xvwa-clean:
	$(MAKE) -C ./xvwa/ clean
	
xvwa-destroy:
	$(MAKE) -C ./xvwa/ destroy

# splunk

splunk-run:
	$(MAKE) -C ./splunk/ run

splunk-clean:
	$(MAKE) -C ./splunk/ clean

# maven-tomcat

maven-tomcat-build:
	$(MAKE) -C ./maven-tomcat/ build

maven-tomcat-build-no-cache:
	$(MAKE) -C ./maven-tomcat/ build-no-cache

maven-tomcat-run:
	$(MAKE) -C ./maven-tomcat/ run	

maven-tomcat-deploy:
	$(MAKE) -C ./maven-tomcat/ deploy

maven-tomcat-clean:
	$(MAKE) -C ./maven-tomcat/ clean
	
maven-tomcat-destroy:
	$(MAKE) -C ./maven-tomcat/ destroy
