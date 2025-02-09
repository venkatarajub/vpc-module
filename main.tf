resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr
  tags = merge(
    var.common_tags,
    {
        Name  = local.resource_name
    }
  )
}