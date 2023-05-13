## __USING TERRAFORM IAC TOOL TO AUTOMATE AWS CLOUD SOLUTION FOR 2 COMPANY WEBSITES - CONTINUATION__

This is a countinuation of [Project-16](https://github.com/dybran/Project-16/blob/main/Project-16.md).

In this Project, we will continue creating the resources

__CREATE 4 PRIVATE SUBNETS__

We will create 4 subnets by updating the __main.tf__ with the following code

```
# Create private subnets
resource "aws_subnet" "private" {
  count                   = var.preferred_number_of_private_subnets == null ? length(data.aws_availability_zones.available.names) : var.preferred_number_of_private_subnets
  vpc_id                  = aws_vpc.narbyd-vpc.id
  cidr_block              = cidrsubnet(var.vpc_cidr, 8, count.index)
  map_public_ip_on_launch = false
  availability_zone       = data.aws_availability_zones.available.names[count.index]
  tags = {
    Name = "narbyd-private-sub"
  }

}
```

Then update the __vars.tf__ with the following code

```
variable "preferred_number_of_private_subnets" {
  default = 4
}
```
