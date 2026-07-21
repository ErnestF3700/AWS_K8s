resource "aws_security_group" "k8s_sg" {
  name        = "k8s-security-group"
  description = "Security Group for Kubernetes Cluster"
  vpc_id      = var.vpc_id

  tags = {
    Name = "k8s-security-group"
  }
}

#########################
# SSH
#########################

resource "aws_vpc_security_group_ingress_rule" "ssh" {
  security_group_id = aws_security_group.k8s_sg.id

  cidr_ipv4   = "0.0.0.0/0"
  from_port   = 22
  to_port     = 22
  ip_protocol = "tcp"
}

#########################
# HTTP
#########################

resource "aws_vpc_security_group_ingress_rule" "http" {
  security_group_id = aws_security_group.k8s_sg.id

  cidr_ipv4   = "0.0.0.0/0"
  from_port   = 80
  to_port     = 80
  ip_protocol = "tcp"
}

#########################
# HTTPS
#########################

resource "aws_vpc_security_group_ingress_rule" "https" {
  security_group_id = aws_security_group.k8s_sg.id

  cidr_ipv4   = "0.0.0.0/0"
  from_port   = 443
  to_port     = 443
  ip_protocol = "tcp"
}

#########################
# Kubernetes API
#########################

resource "aws_vpc_security_group_ingress_rule" "k8s_api" {
  security_group_id = aws_security_group.k8s_sg.id

  cidr_ipv4   = "0.0.0.0/0"
  from_port   = 6443
  to_port     = 6443
  ip_protocol = "tcp"
}

#########################
# etcd
#########################

resource "aws_vpc_security_group_ingress_rule" "etcd" {
  security_group_id = aws_security_group.k8s_sg.id

  referenced_security_group_id = aws_security_group.k8s_sg.id

  from_port   = 2379
  to_port     = 2380
  ip_protocol = "tcp"
}

#########################
# kubelet
#########################

resource "aws_vpc_security_group_ingress_rule" "kubelet" {
  security_group_id = aws_security_group.k8s_sg.id

  referenced_security_group_id = aws_security_group.k8s_sg.id

  from_port   = 10250
  to_port     = 10250
  ip_protocol = "tcp"
}

#########################
# Controller Manager
#########################

resource "aws_vpc_security_group_ingress_rule" "controller_manager" {
  security_group_id = aws_security_group.k8s_sg.id

  referenced_security_group_id = aws_security_group.k8s_sg.id

  from_port   = 10257
  to_port     = 10257
  ip_protocol = "tcp"
}

#########################
# Scheduler
#########################

resource "aws_vpc_security_group_ingress_rule" "scheduler" {
  security_group_id = aws_security_group.k8s_sg.id

  referenced_security_group_id = aws_security_group.k8s_sg.id

  from_port   = 10259
  to_port     = 10259
  ip_protocol = "tcp"
}

#########################
# NodePort
#########################

resource "aws_vpc_security_group_ingress_rule" "nodeport" {
  security_group_id = aws_security_group.k8s_sg.id

  cidr_ipv4   = "0.0.0.0/0"
  from_port   = 30000
  to_port     = 32767
  ip_protocol = "tcp"
}

#########################
# Calico VXLAN
#########################

resource "aws_vpc_security_group_ingress_rule" "calico_vxlan" {
  security_group_id = aws_security_group.k8s_sg.id

  referenced_security_group_id = aws_security_group.k8s_sg.id

  from_port   = 8472
  to_port     = 8472
  ip_protocol = "udp"
}

#########################
# Istio Webhook
#########################

resource "aws_vpc_security_group_ingress_rule" "istio_webhook" {
  security_group_id = aws_security_group.k8s_sg.id

  referenced_security_group_id = aws_security_group.k8s_sg.id

  from_port   = 15017
  to_port     = 15017
  ip_protocol = "tcp"
}

#########################
# Internal Cluster Traffic
#########################

resource "aws_vpc_security_group_ingress_rule" "cluster_internal" {
  security_group_id = aws_security_group.k8s_sg.id

  referenced_security_group_id = aws_security_group.k8s_sg.id

  ip_protocol = "-1"
}

#########################
# Outbound
#########################

resource "aws_vpc_security_group_egress_rule" "all_outbound" {
  security_group_id = aws_security_group.k8s_sg.id

  cidr_ipv4   = "0.0.0.0/0"
  ip_protocol = "-1"
}
