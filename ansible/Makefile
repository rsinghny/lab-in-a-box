AGENT_CONF?=$(shell pwd)/agent.conf

run:
	cp $(AGENT_CONF) master/ansible/agent.conf 
	docker-compose up -d --build
	docker exec -it master01 /bin/bash

build:
	cp $(AGENT_CONF) master/ansible/agent.conf
	docker-compose up -d --build
	docker exec -it master01 /bin/bash

clean:
	-docker-compose kill
	-docker-compose rm -f
	-docker volume rm ansible_ansible_vol

destroy:
	-docker-compose kill
	-docker-compose rm -f
	-docker volume rm ansible_ansible_vol
	-docker rmi ansible_host ansible_master ansible_base