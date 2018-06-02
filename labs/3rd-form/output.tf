output "image_id" {
  value = "${data.aws_ami.ubuntu_xenial.id}"
  // value = "${data.aws_ami.ubuntu.id}"
}
