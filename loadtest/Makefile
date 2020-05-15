DOCKERUSER?=sigsci
DOCKERNAME?=sigsci-loadtest
DOCKERTAG?=latest
SIGSCI_HOSTNAME?=loadtest

build:
	docker build -t $(DOCKERUSER)/$(DOCKERNAME):$(DOCKERTAG) .

build-no-cache:
	docker build --no-cache -t $(DOCKERUSER)/$(DOCKERNAME):$(DOCKERTAG) .

run:
	docker run --net="host" -it --name $(DOCKERNAME) --hostname $(SIGSCI_HOSTNAME) $(DOCKERUSER)/$(DOCKERNAME):$(DOCKERTAG) /bin/bash

clean: 
	-docker kill $(DOCKERNAME)
	-docker rm $(DOCKERNAME)

destroy: 
	-docker kill $(DOCKERNAME)
	-docker rm $(DOCKERNAME)
	-docker rmi $(DOCKERUSER)/$(DOCKERNAME):$(DOCKERTAG)