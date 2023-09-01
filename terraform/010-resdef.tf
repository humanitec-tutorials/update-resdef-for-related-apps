variable "instance_type" {
  default = "cache.t3.micro"
}
resource "humanitec_resource_definition" "redis" {
  name        = "redis"
  id          = "redis"
  driver_type = "${var.org}/terraform"
  type        = "redis"

  driver_inputs = {
    values = {
      "script" = <<-EOT
                    variable "instance_type" {
                      type = string
                    }

                    # resource "aws_elasticache_replication_group" "default" {
                    # }

                    output "host" {
                      value     = "redis.aws.com"
                    }

                    output "instance_type"{
                      value     = var.instance_type
                    }
                EOT
      "variables" = jsonencode(
        {
          instance_type = var.instance_type
        }
      )
    }
  }
  lifecycle {
    ignore_changes = [
      criteria
    ]
  }
}

resource "humanitec_resource_definition" "bucket" {
  name        = "bucket"
  id          = "bucket"
  driver_type = "${var.org}/terraform"
  type        = "s3"

  driver_inputs = {
    values = {
      "script" = <<-EOT
                    variable "tag" {
                      type = string
                    }

                    # resource "aws_s3_bucket" "default" {
                    # }

                    output "bucket" {
                      value     = "s3.aws.com"
                    }

                    output "tag"{
                      value     = var.tag
                    }
                EOT
      "variables" = jsonencode(
        {
          tag = "mybuckettag"
        }
      )
    }
  }
  lifecycle {
    ignore_changes = [
      criteria
    ]
  }
}

resource "humanitec_resource_definition" "postgres" {
  name        = "postgres"
  id          = "postgres"
  driver_type = "${var.org}/terraform"
  type        = "postgres"

  driver_inputs = {
    values = {
      "script" = <<-EOT
                    variable "tag" {
                      type = string
                    }

                    # resource "aws_db_instance" "default" {
                    # }

                    output "host" {
                      value     = "postgres.aws.com"
                    }

                    output "tag"{ 
                      value     = var.tag
                    }
                EOT
      "variables" = jsonencode(
        {
          tag = "mypostgrestag"
        }
      )
    }
  }
  lifecycle {
    ignore_changes = [
      criteria
    ]
  }
}
