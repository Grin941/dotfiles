.PHONY: help install_ansible configure_ssh

EMAIL :=

.DEFAULT: help
help:
	@echo "make install_ansible"
	@echo "		install Ansible with dependencies"
	@echo "make configure_ssh EMAIL=your@email"
	@echo "		configure ssh on the local maxhine"


install_ansible:
	@echo "Install Ansible with dependencies"
	apt update; \
	apt -y upgrade; \
	apt install -y python; \
	apt install -y software-properties-common; \
	apt install -y ansible; \
	apt install -y openssh-client openssh-server; \
	apt install -y xclip


configure_ssh:
	@echo "Configure ssh"
	@echo "Call make configure_ssh EMAIL=your@email"
	if [ ! -f "${HOME}/.ssh/id_rsa" ]; then \
		ssh-keygen -t rsa -b 4096 -C "${EMAIL}"; \
	fi; \
	eval `ssh-agent -s`; \
	ssh-add ~/.ssh/id_rsa; \
	ssh-keyscan -H localhost >> ~/.ssh/known_hosts
	ssh-copy-id grinenko_a@localhost
