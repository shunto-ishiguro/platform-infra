# ==============================================================================
# Internet Gateway — VPC とインターネットをつなぐ出入口
# ==============================================================================

resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "${var.name_prefix}-igw"
  }
}

# ==============================================================================
# Elastic IP — NAT Gateway に割り当てる固定 IP
# ==============================================================================

resource "aws_eip" "nat" {
  count  = length(var.azs)
  domain = "vpc"

  tags = {
    Name = "${var.name_prefix}-nat-eip-${var.azs[count.index]}"
  }
}

# ==============================================================================
# NAT Gateway — Private Subnet から外へ出るための中継地点
# ==============================================================================

resource "aws_nat_gateway" "main" {
  count         = length(var.azs)
  allocation_id = aws_eip.nat[count.index].id
  subnet_id     = aws_subnet.public[count.index].id

  tags = {
    Name = "${var.name_prefix}-nat-${var.azs[count.index]}"
  }

  depends_on = [aws_internet_gateway.main]
}
