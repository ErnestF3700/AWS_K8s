terraform {
  backend "s3" {
    bucket         = "infra-tfstate"
    key            = "kubernetes/terraform.tfstate"
    region         = "eu-central-1"
    dynamodb_table = "terraform-lock"
    encrypt        = true
  }
}
