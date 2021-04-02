#!/usr/bash
	username="ansadmin"
	password="root123"
	sudo yum install python3 -y
	sudo alternatives --set python /usr/bin/python3
	sudo yum -y install python3-pip
	sudo useradd $username 
	sudo echo "${username}:${password}" | chpasswd
	sudo echo "ansadmin ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
	sudo sed -ie 's/PasswordAuthentication no/PasswordAuthentication yes/' /etc/ssh/sshd_config
	sudo service sshd reload
	su - ansadmin
	pip3 install ansible --user
	ansible --version
	
