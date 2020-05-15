
# lab-in-a-box v2

*This lab is based on the fine work of many individuals, this is simply a resource for updated versions and running solutions in a consistent format.*

_Working implementations of each module in Docker._

## Currently supported modules

* ansible
  * multiple hosts and basic deployment playbook.
* apache
* go
* haproxy
* java
* nginx
* nodejs
* php
* python
* reverse-proxy
* tomcat
* dropwizard
* gunicorn
* openresty
* standalone docker agent on alpine
* mutillidae
* envoy

## Use guidelines

*You may also find information by running  `make help`*

### All labs are Makefile based

Update the master "agent.conf", "agent-envoy.conf", and "agent-reverse-proxy.conf" (in the root directory) with your lab site keys and any additional configuration options you choose.  By default, all labs will be mapped to http://localhost:4000. This can easily be overridden by running an EXPOSE_PORT value or changing the master Makefile with the desired port.

## General use

`make %module_of_choice%-build`

example: `make php-build`
  -Builds lab for running
  
`make %module_of_choice%-build-no-cache`

example: `make go-build-no-cache`
  -Builds lab without using any cached components
  
`make %module_of_choice%-run`

example: `make reverse-proxy-run`
  -Runs lab of choice (must run build first except ansible)
  
`make %module_of_choice%-clean`

example: `make ansible-clean`
  -Removes running lab

`make %module_of_choice%-destory`

example: `make ansible-destroy`
  -Removes running lab and all associated Docker images

## Load testing

To load test your implementation use `make artillery-build` and `make artillery-run`.  From the prompt use `loadtest -n 100000 -c 10 --rps 100 "http://localhost:4000`.  Edit the numbers to match your desired load test.
  
## Ansible use

To run the Ansible lab use: 
`make ansible-run` or `make ansible-build` both have the same end result.  Once the nodes are alive, you'll be automatically dropped into master01 bash.  Initiate your connections using `ansible-playbook -i inventory ping_all.yml`.

Once all your nodes are responding and successfully can ping, then you can run the SigSci installation playbook.  This playbook will install Apache (with module) and SigSci agent.  Run this by initiating `ansible-playbook -i inventory install_sigsci.yml`.  Once completed each of the servers in the "web" group will be loaded with Signal Sciences.  From master01 bash run `curl "http://host01?q=<script>alert()</script>"` to test.

## Standard apps
There are two fully functioning apps included to help with testing detections. 

### httpbin
[httpbin](https://httpbin.org/) is a python applicaitons that provides simple HTTP requests and responses. There is a reverse proxy agent installed.

### Xtreme Vulnerable Web Application (xvwa)
[Xtreme Vulnerable Web Application](https://github.com/s4n7h0/xvwa) is a purposely badly coded web application written for a LAMP stack to help provide a testing framework for various web application attacks. It comes with a MYSQL database and is loaded with the agent and apache module.

## Splunk

The source for this container is https://github.com/signalsciences/splunk-docker. This container runs Splunk and the SigSci Splunk TA locally on your machine. The tar file can be downloaded from https://splunkbase.splunk.com/app/3495/ . Normally for customers they can just go to `Manage Apps` and browse the splunk store to install the Technical Adapter. Directions for configuring the app can be found at https://github.com/dacoburn/sigsci-splunk-app.

There are only 2 make commands for this container - `make splunk-run` and `make-splunk-clean` as there is nothing to build or destroy.

The splunk console runs on `localhost:8000`

Default username and password will be `admin`/`SigSci123!`


