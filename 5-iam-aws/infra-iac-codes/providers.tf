provider "aws" {
  region = "us-east-1"
  default_tags {
    tags = {
      Environment = "Test"
      Name        = "Provider Tag"
      Managed_by  = "Terraform"
    }
  }
}