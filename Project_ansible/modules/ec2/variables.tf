#Ogni variabile viene associata agli attributi presenti nel main
#per la configurazione delle risorse


variable "ami_amz_linux_2" {
  type    = string
  default = "ami-0e8a34246278c21e4"
}


variable "instance-type" {
  type    = string
  default = "t2.micro"  
}

#Nome "key pair".pem

variable "key_ec2_name" {
  type    = string
  default = "keypair"
  
}


variable "public_sg_id" {

  description = "ID of the security group for the public subnet"
  type        = string
}

variable "public_subnet_id" {
  description = "ID of the public subnet"
  type        = string
}


variable "private_sg_id" {

  description = "ID of the security group for the private subnet"
  type        = string

}


variable "private_subnet_id" {
  description = "ID of the private subnet"
  type        = string
}


variable "test_sg_id" {

  description = "ID of the security group for the public subnet"
  type        = string
}

