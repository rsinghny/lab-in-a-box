DOCKERUSER?=sigsci
DOCKERNAME?=sigsci-nginx-alpine
DOCKERTAG?=latest
SIGSCI_HOSTNAME?=nginx-alpine
EXPOSE_PORT?=4000
AGENT_CONF?=$(shell pwd)/agent.conf

build:
	docker build --build-arg OS=$(OS) --build-arg MODULE=$(MODULE) --build-arg AGENT=$(AGENT) -t $(DOCKERUSER)/$(DOCKERNAME):$(DOCKERTAG) .

build-no-cache:
	docker build --build-arg OS=$(OS) --build-arg MODULE=$(MODULE) --build-arg AGENT=$(AGENT) --no-cache -t $(DOCKERUSER)/$(DOCKERNAME):$(DOCKERTAG) .

run:
	docker run -v $(AGENT_CONF):/etc/sigsci/agent.conf --name $(DOCKERNAME) --hostname $(SIGSCI_HOSTNAME) -p $(EXPOSE_PORT):80 -d $(DOCKERUSER)/$(DOCKERNAME)

deploy:
	docker push $(DOCKERUSER)/$(DOCKERNAME):$(DOCKERTAG)
	
clean:
	-docker kill $(DOCKERNAME)
	-docker rm $(DOCKERNAME)

destroy:
	-docker kill $(DOCKERNAME)
	-docker rm $(DOCKERNAME)
	-docker rmi $(DOCKERUSER)/$(DOCKERNAME):$(DOCKERTAG)
