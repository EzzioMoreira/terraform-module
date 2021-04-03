#output "instance_id" {
#  description = "ID and of the EC2 instance"
#  value       = "${aws_instance.web.*.id}"
#}

#output "instance_public_ip" {
#  description = "Public IP address of the EC2 instance"
#  value       = "${aws_instance.web.*.public_ip}"
#}

output "ip_address-dns_name" {
  description = "For output ip and dns of the EC2 instance"
  value = {
    for instance in aws_instance.web:
    instance.tags.Name => [instance.public_ip, instance.public_dns]
  } 
}