#!/bin/bash
      sudo yum -y install java-1.8*
      export JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-1.8.0.282.b08-2.el8_3.x86_64
      cd /opt
      sudo yum -y install wget
      sudo wget https://downloads.apache.org/tomcat/tomcat-8/v8.5.64/bin/apache-tomcat-8.5.64.tar.gz
      sudo tar -zvxf *.gz
      sudo chmod +x /opt/apache-tomcat-8.5.64/bin/startup.sh shutdown.sh
      sudo  ln -s /opt/apache-tomcat-8.5.64/bin/startup.sh /usr/bin/tomcatup
      sudo ln -s /opt/apache-tomcat-8.5.64/bin/shutdown.sh /usr/bin/tomcatdown
      sudo tomcatup 
