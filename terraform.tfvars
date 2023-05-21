region = "us-east-1"

vpc_cidr = "172.16.0.0/16"

enable_dns_support = "true"

enable_dns_hostnames = "true"

enable_classiclink = "false"

enable_classiclink_dns_support = "false"

preferred_number_of_public_subnets = 2

preferred_number_of_private_subnets = 4

name = "narbyd"

tags = {
  Owner-Email     = "onwuasoanyasc@gmail.com"
  Managed-By      = "Terraform"
  Billing-Account = "939895954199"
}

ami = "ami-03951dc3553ee499f"

keypair = "dybran-ec2"

environment = "dev"

account_no = "939895954199"

master-username = "narbyd-db"

master-password = "Sa4la2xa#""

