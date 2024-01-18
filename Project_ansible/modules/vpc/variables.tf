#Ogni variabile viene associata agli attributi presenti nel main
#per la configurazione delle risorse


variable "vpc_cidr" {
  description = "CIDR block for the entire VPC"
  type        = string
}

variable "public_sub_1_cidr" {
  description = "CIDR block for the public subnet"
  type        = string
}

variable "public_sub_2_cidr" {
  description = "CIDR block for the public subnet"
  type        = string
}

variable "private_sub_1_cidr" {
  description = "CIDR block for the private subnet"
  type        = string
}


variable "private_sub_2_cidr" {
  description = "CIDR block for the private subnet"
  type        = string
}


#Creazione AZs

variable "az_first" {
  type = string
  default = "us-east-1a"
  
}

variable "az_second" {
  type = string
  default = "us-east-1b"
  
}