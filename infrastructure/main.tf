provider "aws" {}

variable "apex_function_names" {
  type = "map"
}

variable "apex_function_submit_aws_batch_job" {
  type = "string"
}
