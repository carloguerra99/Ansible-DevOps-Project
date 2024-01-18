
#Parametri output da inserire nei relativi moduli del main root


output "public_subnet_id" {
  value = aws_subnet.my_public_subnet.id
}

output "public_sg_id" {
  value = aws_security_group.public_sg.id
}


output "private_subnet_id" {
  value = aws_subnet.my_private_subnet.id
}

output "private_sg_id" {
  value = aws_security_group.private_sg.id
}

output "db_sg_id" {
  value = aws_security_group.db_sg.id
}


output "db_subnet_group" {
  value = aws_db_subnet_group.db_subnet_group.id
}