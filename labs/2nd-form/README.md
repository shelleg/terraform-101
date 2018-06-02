### 2nd form - refactor #1

In the first lab we did the following:

```js
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
```

Although terraform doesn't require file separation, it basically merges all *.tf files in the directory you run it. It is a best practice to separate them like so:

* `provider.tf`
  ```js
  provider "aws" {
    region  = "${var.aws_region}"
    profile = "${var.aws_profile}"
  }
  ```
* `main.tf`
  request a resource from the provider in this example and `aws_instance` resource, with 3 attributes:
  * ami - `ami-58d7e821`
  * type/size - `t2.micro`
  * tags - name: "xenail01"

  ```js
  resource "aws_instance" "example" {
    ami           = "ami-58d7e821"
    instance_type = "t2.micro"

    tags {
      Name = "xenail01"
    }
  }
  ```
* `variables.tf`
  Although hard coded we can still set the ami as a variable until we find a way (lab 03) to do this automatically ...

  ```js
  variable "aws_profile" {
    default = "default"
  }

  variable "aws_region" {
    default = "eu-west-1"
  }

  variable "ami_id_eu_west_1" {
    default = "ami-58d7e821"
  }
  ```
You can fo ahead and repeat the terraform lifecycle on this lab the reuslts will be the same ;)
