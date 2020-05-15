DOCKERUSER?=splunk
DOCKERNAME?=splunk
DOCKERTAG?=latest
DOCKERREPO?=
env_options?=
SIGSCI_PORT?=8000
SIGSCIAPP?=sigsci_TA_for_splunk
TARFILE?=signal-sciences-ng-wafrasp-ta_1023.tgz
LOGFOLDER?=./logs

run:
	tar -zxf $(TARFILE)
	mkdir -p $(LOGFOLDER)
	docker run -p $(SIGSCI_PORT):$(SIGSCI_PORT) --name $(DOCKERNAME) -v "$(PWD)/$(SIGSCIAPP):/opt/splunk/etc/apps/sigsci_TA_for_splunk/" -v "$(PWD)/$(LOGFOLDER):/opt/splunk/var/logs/splunk" -d $(env_options) -e "SPLUNK_START_ARGS=--accept-license --seed-passwd SigSci123!" -e "SPLUNK_USER=root" -e "SPLUNK_PASSWORD=SigSci123!" splunk/$(DOCKERNAME):$(DOCKERTAG)

clean:
	rm -rf ./logs
	rm -rf ./sigsci_TA_for_splunk
	-docker kill $(DOCKERNAME)
	-docker rm $(DOCKERNAME)