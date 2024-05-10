variable "instance_type" {
  default = "cache.t3.micro"
}

resource "humanitec_resource_definition" "redis" {
  name        = "redis"
  id          = "redis"
  driver_type = "humanitec/terraform"
  type        = "redis"

  driver_inputs = {
    values_string = jsonencode({
      "script" = <<-EOT
        variable "instance_type" {
          type = string
        }

        # We do not actually want to provision any resource. Your code would go here if you wanted to.
        # resource "aws_elasticache_replication_group" "default" {
        # }

        output "host" {
          value     = "redis.aws.com"
        }

        output "instance_type"{
          value     = var.instance_type
        }
      EOT
      "variables" = {
        instance_type = var.instance_type
      }
    })
  }
}

resource "humanitec_resource_definition" "bucket" {
  name        = "bucket"
  id          = "bucket"
  driver_type = "humanitec/terraform"
  type        = "s3"

  driver_inputs = {
    values_string = jsonencode({
      "script" = <<-EOT
        variable "tag" {
          type = string
        }

        # We do not actually want to provision any resource. Your code would go here if you wanted to.
        # resource "aws_s3_bucket" "default" {
        # }

        output "bucket" {
          value     = "s3.aws.com"
        }

        output "tag"{
          value     = var.tag
        }
      EOT
      "variables" = {
        tag = "mybuckettag"
      }
    })
  }
}

resource "humanitec_resource_definition" "postgres" {
  name        = "postgres"
  id          = "postgres"
  driver_type = "humanitec/terraform"
  type        = "postgres"

  driver_inputs = {
    values_string = jsonencode({
      "script" = <<-EOT
        variable "tag" {
          type = string
        }

        # We do not actually want to provision any resource. Your code would go here if you wanted to.
        # resource "aws_db_instance" "default" {
        # }

        output "host" {
          value     = "postgres.aws.com"
        }

        output "tag"{ 
          value     = var.tag
        }
      EOT
      "variables" = {
        tag = "mypostgrestag"
      }
    })
  }
}