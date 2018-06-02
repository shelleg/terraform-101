### 3nd form - refactor #2

- [shell recording](shell-recording) available below

In the 2nd lab we did some refactoring, and we also realized we have a hardcoded value of the ami ...

In the following lab we will use a [data source](https://www.terraform.io/docs/configuration/data-sources.html) which will dynamically find the `ubuntu` image in the specified `aws_region` like so:

```js
data "aws_ami" "ubuntu_xenial" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-xenial-16.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}
```
We are basically setting and datasource which is an `aws_ami` resource which is already present, this data source also has attributes like:

* most_recent = true
* filter by name `ubuntu/images/hvm-ssd/ubuntu-xenial-16.04-amd64-server-*
* By `virtualization-type`
* Of Canonical - aws account id `099720109477`

In this case when we `terraform plan` terraform will consult the datasource and return the `ami-id` we specified in previous labs ...

#### shell recording
[![asciicast](https://asciinema.org/a/eMjgjNUlUDaf7SnF4tu7L6Voe.png)](https://asciinema.org/a/eMjgjNUlUDaf7SnF4tu7L6Voe)
