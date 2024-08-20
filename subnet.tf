resource "aws_subnet" "public" {
  count = length(var.public_cidrs)

  vpc_id            = aws_vpc.my-vpc.id
  cidr_block        = var.public_cidrs[count.index]
  availability_zone = var.availability_zones[count.index]
  map_public_ip_on_launch = true
}

resource "aws_subnet" "private" {
  count = length(var.private_cidrs)

  vpc_id            = aws_vpc.my-vpc.id
  cidr_block        = var.private_cidrs[count.index]
  availability_zone = var.availability_zones[count.index]
}

output "public_subnet_ids" {
  value = aws_subnet.public[*].id
}

output "private_subnet_ids" {
  value = aws_subnet.private[*].id
}
