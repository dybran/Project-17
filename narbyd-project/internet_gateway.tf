resource "aws_internet_gateway" "narbyd-ig" {
  vpc_id = aws_vpc.narbyd-vpc.id

  tags = merge(
    var.tags,
    {
      Name = format("%s-%s", var.name, "IG")
    }
  )
}

