provider "aws" {
  region  = "${var.aws_region}"
  profile = "${var.aws_profile}"
}

resource "aws_instance" "example" {
  ami           = "${var.ami_id_eu_west_1}"
  instance_type = "t2.micro"

  tags {
    Name = "xenail01"
  }
}
