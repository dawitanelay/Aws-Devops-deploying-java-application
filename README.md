
# Infrastructure automation with Terraform on AWS for CI/CD pipeline to host a java web application.

## pre-requisite
- AWS account 
- Amazon Machine Image (AMI)  Red Hat Enterprise Linux 8.x
- Terraform required_version = ">= 0.12"

## Get start 

1. [Install terraform ](https://learn.hashicorp.com/tutorials/terraform/install-cli)
2. git clone 
3. [create aws EC2 key pairs](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-key-pairs.html)

    - jenkins-key.pem
    - ansible-key.pem
    - tomcat-key.pem
    
4 provide your private key under Provisioner Connection Settings

  - Provisioner Connection Settings directory of a file  
  
        - CI-CD-PipelineOnAws/modules/ansible/instance.tf
        
        - CI-CD-PipelineOnAws/modules/jenkins/instance.tf
        
        - CI-CD-PipelineOnAws/modules/tomcat/instance.tf
        
      ```sh
        connection {
              type        = "ssh"
              host        = self.public_ip 
              user        = "ec2-user" 
              private_key = file("~/key/ansible-key.pem") 
             } 
      ```
5. specify corrrect PATH for file provisioning to excute bash scripte. 

    - file provisioning  directory of a file
    
          - CI-CD-PipelineOnAws/modules/ansible/instance.tf
          
          - CI-CD-PipelineOnAws/modules/jenkins/instance.tf
          
          - CI-CD-PipelineOnAws/modules/tomcat/instance.tf
          
             ```sh
          provisioner "file" {
	        	source     = "~/bash-script/ansible.sh" 
		      destination  = "/tmp/ansible.sh" 
	}  
      ```
6 cd /dev
7 terraform apply 
