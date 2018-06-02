module "core" {
  source      = "modules/core"
  aws_profile = "${var.profile}"
  aws_region  = "${var.region}"
}

resource "aws_instance" "example" {
  ami           = "${module.core.image_id}"
  instance_type = "t2.micro"

  tags {
    Name = "xenail01"
  }
}
