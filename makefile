IMAGENAME = satapps/geoserver-commands:0.8

build:
	docker build -t $(IMAGENAME) .

clean:
	docker images | awk -F' ' '{if ($$1=="$(IMAGENAME)") print $$3}' | xargs -r docker rmi

test:
	docker run --rm -t -i $(IMAGENAME)

push:
	docker push $(IMAGENAME)