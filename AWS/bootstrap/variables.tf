variable "vpc_id" {
  description = "VPC ID"
  type        = string
}
variable "bucket_name" {
  default = "infra-tfstate"
}

variable "lock_table_name" {
  default = "terraform-lock"
}
