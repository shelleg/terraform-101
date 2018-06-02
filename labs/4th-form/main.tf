module "core" {
  source      = "modules/core"
  aws_profile = "${var.aws_profile}"
  aws_region  = "${var.aws_region}"
}

resource "aws_instance" "example" {
  ami           = "${module.core.image_id}"
  instance_type = "t2.micro"

  tags {
    Name = "xenail01"
  }
}
