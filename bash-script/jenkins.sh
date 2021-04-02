#!/bin/bash
      sudo yum -y install java-1.8*
      export JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-1.8.0.282.b08-2.el8_3.x86_64
      cd /opt
      sudo yum -y install wget
      sudo wget  wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
      sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
      sudo yum -y install jenkins
      sudo  systemctl start jenkins
      sudo systemctl enable jenkins
      
