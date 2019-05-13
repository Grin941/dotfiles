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
	apt upgrade; \
	apt install -y python; \
	apt install -y ansible


configure_ssh:
	@echo "Configure ssh"
	@echo "Call make configure_ssh EMAIL=your@email"
	apt install openssh-client openssh-server; \
	if [ ! -d "${HOME}/.ssh/" ]; then \
		ssh-keygen -t rsa -b 4096 -C "${EMAIL}"; \
	fi; \
	eval `ssh-agent -s`; \
	ssh-add ~/.ssh/id_rsa
