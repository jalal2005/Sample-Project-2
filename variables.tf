variable "region" {
  default = "ap-south-1"
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "public_cidrs" {
  default = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_cidrs" {
  default = ["10.0.3.0/24", "10.0.4.0/24"]
}

variable "availability_zones" {
  default = ["ap-south-1a", "ap-south-1b"]
}

variable "s3_bucket_name" {
  default = "my-s3-dynamic-bucket-999999"
}

variable "s3_policy_json_path" {
  description = "Path to the S3 policy JSON template"
  default     = "templates/s3_policy.json.tpl"
}