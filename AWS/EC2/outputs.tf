output "control_plane_ip" {
  value = aws_instance.control_plane.public_ip
}

output "worker1_ip" {
  value = aws_instance.worker1.public_ip
}

output "worker2_ip" {
  value = aws_instance.worker2.public_ip
}
