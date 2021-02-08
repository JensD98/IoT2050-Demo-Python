all: setup_the_repository install_docker_engine

ARCH = arm64

setup_the_repository:
	@echo "Update apt package index ..."
	apt-get update
	sudo apt-get install -y \
		apt-transport-https \
		ca-certificates \
		curl \
		gnupg-agent \
		software-properties-common

	@echo "Add docker's official GPG key ..."
	curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -

	@echo "Set up the stable repository ..."
	sudo add-apt-repository \
		"deb [arch=$(ARCH)] https://download.docker.com/linux/debian \
		$(lsb_release -cs) stable"

install_docker_engine:
	@echo "Install docker engine ..."
	apt-get update
	apt-get install docker-ce docker-ce-cli containerd.io

clean:
	@echo "Cleaning up ..."
	apt-get purge docker-ce docker-ce-cli containerd.io
	rm -rf /var/lib/docker
	rm -rf /var/lib/containerd 