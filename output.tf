output "rapadura-id" {
  description = "The id of instance"
  value       = [aws_instance.devops-test.*.id]
}

output "rapadura-public_dns" {
  description = "The public dns of instance"
  value       = [aws_instance.devops-test.*.public_dns]
}

output "rapadura-public_ip" {
  description = "The public ip of instance"
  value       = [aws_instance.devops-test.*.public_ip]
}

output "rapadura-private_ip" {
  description = "The private ip of instance"
  value       = [aws_instance.devops-test.*.private_ip]
}