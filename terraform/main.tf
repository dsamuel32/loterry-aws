terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.82.2"
    }
  }
}

provider "aws" {
  region                      = "us-east-1"
  access_key                  = "localstack"
  secret_key                  = "localstack"
  skip_credentials_validation = true
  skip_requesting_account_id = true
  skip_metadata_api_check    = true
  endpoints {
    s3 = "https://s3.localhost.localstack.cloud:4566"
  }
}

module "s3_bucket" {
  source = "./modules/s3_bucket"
  bucket_name = "my-bucket"
  acl = "private"
}

module "sqs_queue" {
  source = "./modules/sqs"
  sqs_name = "retrieve-draws"
}