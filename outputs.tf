output vpc_id {
  value       = aws_vpc.main.id
}
output "igw_id" {
    value = aws_internet_gateway.main.id
}

output "database_subnet_ids" {
    value = aws_subnet.database[*].id
}

output "private_subnet_ids" {
    value = aws_subnet.private[*].id
}

output "public_subnet_ids" {
    value = aws_subnet.public[*].id
}

output "db_subnet_group_name" {
    value = aws_db_subnet_group.database.id
}

output "db_subnet_group_arn" {
    value = aws_db_subnet_group.database.arn
}

output "db_route_table_id" {
    value = aws_route_table.database.id
}

output "private_route_table_id" {
    value = aws_route_table.private.id
}

output "public_route_table_id" {
    value = aws_route_table.public.id
}
