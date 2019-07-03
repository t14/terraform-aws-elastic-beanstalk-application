# Define composite variables for resources
module "label" {
  source     = "git::https://github.com/t14/terraform-null-label.git?ref=tf_upgrade"
  namespace  = var.namespace
  name       = var.name
  stage      = var.stage
  delimiter  = var.delimiter
  attributes = var.attributes
  tags       = var.tags
}

resource "aws_elastic_beanstalk_application" "default" {
  name        = module.label.id
  description = var.description
}

