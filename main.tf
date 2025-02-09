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
resource "aws_subnet" "private" {
    count = length(var.private_cidrs)
  vpc_id     = aws_vpc.main.id
  cidr_block = var.private_cidrs[count.index]
  availability_zone = local.az_names[count.index]
  map_public_ip_on_launch = false
  tags = merge(
    var.common_tags,
    {
        Name = "${local.resource_name}-private-${local.az_names[count.index]}"
    }
  )
}

resource "aws_subnet" "public" {
    count = length(var.public_cidrs)
  vpc_id     = aws_vpc.main.id
  cidr_block = var.public_cidrs[count.index]
  availability_zone = local.az_names[count.index]
  map_public_ip_on_launch = false
  tags = merge(
    var.common_tags,
    {
        Name = "${local.resource_name}-public-${local.az_names[count.index]}"
    }
  )
}

resource "aws_db_subnet_group" "database" {
  name       = local.resource_name
  subnet_ids = aws_subnet.database[*].id
  tags = merge(
    var.common_tags,
    {
        Name = local.resource_name
    }
  )
}