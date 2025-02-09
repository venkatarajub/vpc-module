locals {
  resource_name = "${var.project}-${var.environment}"
  az_names = slice(data.aws_availability_zones.available, 0, 2)
}
