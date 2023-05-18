output "instance_id" {
  value = aws_instance.web.id
}

output "ami" {
  value = aws_instance.web.ami
}