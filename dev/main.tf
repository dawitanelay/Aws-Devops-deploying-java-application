
provider "aws" {
	region  = "us-east-1" 
}   

module "web-server-ec2" { 
  source        = "../modules/tomcat"  
  num-ec2       = 1
  ami           = "ami-096fda3c22c1c990a" 
  instance_type = "t2.micro"
 server_name    = "tomcat-server" 
  key_name      = "tomcat-key" 
   
}  


module "jenkins" {
  source = "../modules/jenkins"
  num-ec2       = 1
  ami           = "ami-096fda3c22c1c990a" 
  instance_type = "t2.micro"
  server_name   = "jenkins-server" 
  key_name      = "jenkis-name" 
}




module "ansiable" {
  source = "../modules/ansible"
  num-ec2       = 1
  ami           = "ami-096fda3c22c1c990a" 
  instance_type = "t2.micro"
  server_name   = "ansible-server" 
  key_name      = "ansible-key" 
} 






  
 
