data "aws_ami" "aws_image_latest" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-20231207"]
  }

}
# Declare the data source
data "aws_availability_zones" "azs" {}