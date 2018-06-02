variable "aws_profile" {
  type        = "string"
  description = "your default / custom aws profile see your ~/.aws/credentials file for details"
  default     = "default"
}

variable "aws_region" {
  type        = "string"
  description = "your default aws region"
  default     = "eu-west-1"
}
