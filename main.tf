resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr
  tags = merge(
    var.common_tags,
    {
        Name  = local.resource_name
    }
  )
}
resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id
  tags = merge(
    var.common_tags,
    {
        Name = local.resource_name
    }
  )
}
resource "aws_subnet" "database" {
    count = length(var.database_cidrs)
  vpc_id     = aws_vpc.main.id
  cidr_block = var.database_cidrs[count.index]
  availability_zone = local.az_names[count.index]
  map_public_ip_on_launch = false
  tags = merge(
    var.common_tags,
    {
        Name = "${local.resource_name}-db-${local.az_names[count.index]}"
    }
  )
}