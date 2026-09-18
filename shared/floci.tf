provider "aws" {
  region     = var.aws_region
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key

  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true
  skip_region_validation      = true
  s3_use_path_style           = true

  endpoints {
    acm                    = var.floci_endpoint
    apigateway             = var.floci_endpoint
    apigatewayv2           = var.floci_endpoint
    cloudwatch             = var.floci_endpoint
    cloudwatchevents       = var.floci_endpoint
    cloudwatchlogs         = var.floci_endpoint
    dynamodb               = var.floci_endpoint
    ec2                    = var.floci_endpoint
    ecr                    = var.floci_endpoint
    ecs                    = var.floci_endpoint
    elasticache            = var.floci_endpoint
    elasticloadbalancing   = var.floci_endpoint
    elasticloadbalancingv2 = var.floci_endpoint
    events                 = var.floci_endpoint
    firehose               = var.floci_endpoint
    iam                    = var.floci_endpoint
    kinesis                = var.floci_endpoint
    kms                    = var.floci_endpoint
    lambda                 = var.floci_endpoint
    logs                   = var.floci_endpoint
    rds                    = var.floci_endpoint
    s3                     = var.floci_endpoint
    secretsmanager         = var.floci_endpoint
    sns                    = var.floci_endpoint
    sqs                    = var.floci_endpoint
    ssm                    = var.floci_endpoint
    sts                    = var.floci_endpoint
  }
}

variable "aws_region" {
  type    = string
  default = "us-east-1"
}

variable "aws_access_key" {
  type    = string
  default = "test"
}

variable "aws_secret_key" {
  type    = string
  default = "test"
}

variable "floci_endpoint" {
  type    = string
  default = "http://localhost:4566"
}

variable "project" {
  type    = string
  default = "academy"
}

variable "environment" {
  type    = string
  default = "lab"
}

locals {
  common_tags = {
    Project     = var.project
    Environment = var.environment
    ManagedBy   = "terraform"
    Academy     = "tf-aws-floci-academy"
  }
}
