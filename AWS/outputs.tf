output "control_plane_ip" {
  value = module.ec2.control_plane_public_ip
}

output "worker1_ip" {
  value = module.ec2.worker1_public_ip
}

output "worker2_ip" {
  value = module.ec2.worker2_public_ip
}
