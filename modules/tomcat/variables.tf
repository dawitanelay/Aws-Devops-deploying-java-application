variable "num-ec2" {

default = "1"
}  

variable "server_name" {

  type = string
}
variable "ami" {
  
  type = string
  default = "ami-096fda3c22c1c990a"
}

variable "instance_type" {
  type = string
  default = "t2.micro"
  
}  

variable "key_name" {
  type = string  
}


variable "ingressrules" {
  type    = list(number)
  default = [80, 443, 22,8080]
} 


variable "name" {
  type = string
  default = "Allow web traffic"
}
variable "description" {  
  type = string
  default = "Allow ssh and standard http/https ports inbound and everything outbound"

} 