iproute2_repo ?=git://git.kernel.org/pub/scm/linux/kernel/git/shemminger/iproute2.git
project ?=scanf/iproute2-pdf-manuals
iproute2_dir ?=~/src/kernel.org/shemminger/iproute2

iproute2:
	if ! test -d $(iproute2_dir); then \
	  git clone $(iproute2_repo) $(iproute2_dir); \
	fi

pdf: iproute2
	./pdf-gen

docker:
	docker build -t ${project} .
docker_nocache:
	docker build --no-cache=true -t ${project} .
docker_deploy: docker docker_push
	echo "Pushed to docker, https://hub.docker.com/r/${project}"
docker_run: docker
	docker run ${project}
docker_push:
	docker push ${project}
