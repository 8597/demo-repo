output "ec2_id" {
  value = "${module.ec2_instance.instance_id}"
}

output "ami" {
  value = "${module.ec2_instance.ami}"
}