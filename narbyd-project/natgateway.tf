resource "aws_eip" "narbyd-nat_eip" {
  vpc        = true
  depends_on = [aws_internet_gateway.narbyd-ig]

  tags = merge(
    var.tags,
    {
      Name = format("%s-EIP", var.name)
    },
  )
}

resource "aws_nat_gateway" "narbyd-nat" {
  allocation_id = aws_eip.narbyd-nat_eip.id
  subnet_id     = element(aws_subnet.public.*.id, 0)
  depends_on    = [aws_internet_gateway.narbyd-ig]

  tags = merge(
    var.tags,
    {
      Name = format("%s-NAT", var.name)
    },
  )
}