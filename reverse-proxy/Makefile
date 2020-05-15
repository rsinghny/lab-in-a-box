DOCKERUSER?=sigsci
DOCKERNAME?=sigsci-reverse-proxy
DOCKERTAG?=latest
SIGSCI_HOSTNAME?=reverse-proxy
EXPOSE_PORT?=4000
REVERSE_AGENT_CONF?=$(shell pwd)/agent-reverse-proxy.conf

build:
	docker build -t $(DOCKERUSER)/$(DOCKERNAME):$(DOCKERTAG) .

build-no-cache:
	docker build --no-cache -t $(DOCKERUSER)/$(DOCKERNAME):$(DOCKERTAG) .

run:
	docker run -v $(REVERSE_AGENT_CONF):/etc/sigsci/agent.conf --name $(DOCKERNAME) --hostname $(SIGSCI_HOSTNAME) -p $(EXPOSE_PORT):81 -d -e SIGSCI_HOSTNAME=$(SIGSCI_HOSTNAME)  $(DOCKERUSER)/$(DOCKERNAME)

deploy:
	docker push $(DOCKERUSER)/$(DOCKERNAME):$(DOCKERTAG)
	
clean:
	-docker kill $(DOCKERNAME)
	-docker rm $(DOCKERNAME)

destroy:
	-docker kill $(DOCKERNAME)
	-docker rm $(DOCKERNAME)
	-docker rmi $(DOCKERUSER)/$(DOCKERNAME):$(DOCKERTAG)
