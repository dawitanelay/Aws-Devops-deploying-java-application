

terraform {
  required_version = ">= 0.12"
}

 
 resource "aws_security_group" "web_traffic" {
  name        = "Allow web traffic 2"
  description = "Allow ssh and standard http/https ports inbound and everything outbound"

  dynamic "ingress" {
    iterator = port
    for_each = var.ingressrules
    content {
      from_port   = port.value
      to_port     = port.value
      protocol    = "TCP"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    "Terraform" = "true"
  }
}
    

resource "aws_instance" "redhat-servers" { 
  
    
    ami                       = var.ami 
    instance_type             = var.instance_type 
    disable_api_termination   = "false" 
    key_name                  = var.key_name  
    security_groups           =  [aws_security_group.web_traffic.name] 


    provisioner "file" {
		source     = "/home/anelay/terraform/bash-script/ansible.sh" 
		destination = "/tmp/ansible.sh" 
	}  

    provisioner "remote-exec" {
    inline = [

      "sudo cd /tmp",
      "sudo chmod +x /tmp/ansible.sh",
      "sudo bash /tmp/ansible.sh"  

    ] 
  }  

  connection {
    type        = "ssh"
    host        = self.public_ip 
    user        = "ec2-user" 
    private_key = file("/home/anelay/terraform/key/ansible-key.pem") 
  } 

    tags = {
      "Name" = var.server_name
    }
	
}  


