#Creazione VPC

resource "aws_vpc" "my_vpc" {
  cidr_block = var.vpc_cidr

  tags = {
    Name = "My VPC"
  }

}


#Creazione SUBNETs

resource "aws_subnet" "my_public_subnet" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = var.public_sub_1_cidr
  availability_zone = var.az_first
  tags = {
    Name = "My Public Subnet"
  }
}

resource "aws_subnet" "my_private_subnet" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = var.private_sub_1_cidr
  availability_zone = var.az_first
  tags = {
    Name = "My Private Subnet"
  }
}


resource "aws_subnet" "my_public_subnet_2" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = var.public_sub_2_cidr
  availability_zone = var.az_second
  tags = {
    Name = "My Public Subnet 2"
  }
}

resource "aws_subnet" "my_private_subnet_2" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = var.private_sub_2_cidr
  availability_zone = var.az_second 
  tags = {
    Name = "My Private Subnet 2"
  }
}

##


#Creazione IGw


resource "aws_internet_gateway" "my_ig" {
  vpc_id = aws_vpc.my_vpc.id

  tags = {
    Name = "My Internet Gateway"
  }
}


#Creazione EIP


resource "aws_eip" "nat_gateway_eip" {
}


#Creazione NAT GATEWAY

resource "aws_nat_gateway" "my_nat_gateway" {
  allocation_id = aws_eip.nat_gateway_eip.id
  subnet_id     = aws_subnet.my_public_subnet.id

  tags = {
    Name = "My Nat Gateway"
  }
}


#Creazione ROUTE TABLEs


resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.my_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my_ig.id
  }

  tags = {
    Name = "Public Route Table"
  }
}

resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.my_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.my_nat_gateway.id 
  }

  tags = {
    Name = "Private Route Table"
  }
}


#ROUTE TABLE Association


resource "aws_route_table_association" "public_1_rt_a" {
  subnet_id      = aws_subnet.my_public_subnet.id
  route_table_id = aws_route_table.public_rt.id
}


resource "aws_route_table_association" "public_2_rt_a" {
  subnet_id      = aws_subnet.my_public_subnet_2.id
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_route_table_association" "private_1_rt_a" {
  subnet_id      = aws_subnet.my_private_subnet.id
  route_table_id = aws_route_table.private_rt.id
}


resource "aws_route_table_association" "private_2_rt_a" {
  subnet_id      = aws_subnet.my_private_subnet_2.id
  route_table_id = aws_route_table.private_rt.id
}


##



#Creazione SECURITY GROUPs

resource "aws_security_group" "public_sg" {
  name   = "Sg_Bastion"
  vpc_id = aws_vpc.my_vpc.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["93.40.196.82/32"]    #IP nostra macchina
  }
  

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }
}


resource "aws_security_group" "private_sg" {
  name   = "Sg_Controller"
  vpc_id = aws_vpc.my_vpc.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]    #IP PRIVATO istanza PUBBLICA
  }
  

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }
}



resource "aws_security_group" "test_sg" {
  name   = "Sg_VM_test"
  vpc_id = aws_vpc.my_vpc.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]    #IP PRIVATO istanza PUBBLICA
  }
  

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }
}




