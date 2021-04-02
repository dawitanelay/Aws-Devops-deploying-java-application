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
      sudo echo "maven installation"
      sudo mkdir /opt/maven.  
      sudo wget https://downloads.apache.org/maven/maven-3/3.6.3/binaries/apache-maven-3.6.3-bin.tar.gz  
      sudo tar -xvzf 
      sudo export M2_HOME=/opt/maven/apache-maven-3.6.3  
      sudo export M2=$M2_HOME/bin 
      sudo  systemctl start jenkins
      echo "Done"
      
      
