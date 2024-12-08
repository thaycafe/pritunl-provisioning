output "public_ip" {
  value       = aws_instance.pritunl.public_ip
  description = "The puclic IP address"
}