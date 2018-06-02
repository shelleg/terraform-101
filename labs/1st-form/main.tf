provider "aws" {
  region  = "${var.aws_region}"
  profile = "${var.aws_profile}"
}

resource "aws_instance" "example" {
  ami           = "ami-58d7e821"
  instance_type = "t2.micro"

  tags {
    Name = "xenail01"
  }
}

variable "aws_profile" {
  default = "default"
}

variable "aws_region" {
  default = "eu-west-1"
}

variable "ami_id_eu_west_1" {
  default = "ami-58d7e821"
}
