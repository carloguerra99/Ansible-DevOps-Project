#Creazione di istanze e assegnazione variabili 


resource "aws_instance" "ec2_pub" {
  ami           = var.ami_amz_linux_2
  instance_type = var.instance-type
  key_name      = var.key_ec2_name
  

  subnet_id                   = var.public_subnet_id
  vpc_security_group_ids      = [var.public_sg_id]
  associate_public_ip_address = true

tags = {
    Name = "ec2-bastion"
  }

}


resource "aws_instance" "ec2_pvt" {
  ami           = var.ami_amz_linux_2
  instance_type = var.instance-type
  key_name      = var.key_ec2_name
  

  subnet_id                   = var.private_subnet_id
  vpc_security_group_ids      = [var.private_sg_id]
  associate_public_ip_address = false

tags = {
    Name = "ec2-controller"
  }

}



resource "aws_instance" "ec2_test1" {
  ami           = var.ami_amz_linux_2
  instance_type = var.instance-type
  key_name      = var.key_ec2_name

  subnet_id                   = var.private_subnet_id
  vpc_security_group_ids      = [var.test_sg_id]
  associate_public_ip_address = false

tags = {
    Name = "ec2-test1"
  }

}


resource "aws_instance" "ec2_test2" {
  ami           = var.ami_amz_linux_2
  instance_type = var.instance-type
  key_name      = var.key_ec2_name

  subnet_id                   = var.private_subnet_id
  vpc_security_group_ids      = [var.test_sg_id]
  associate_public_ip_address = false

tags = {
    Name = "ec2-test2"
  }

}