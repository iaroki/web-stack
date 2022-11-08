output "private_ip" {
  value = zipmap(aws_instance.web_instance.*.tags.Name, aws_instance.web_instance.*.private_ip)
}

output "public_ip" {
  value = zipmap(aws_instance.web_instance.*.tags.Name, aws_eip.web_eip.*.public_ip)
}

output "public_dns" {
  value = zipmap(aws_instance.web_instance.*.tags.Name, aws_eip.web_eip.*.public_dns)
}

output "private_dns" {
  value = zipmap(aws_instance.web_instance.*.tags.Name, aws_instance.web_instance.*.private_dns)
}

output "alb_id" {
  value = aws_lb.web_lb.dns_name
}
