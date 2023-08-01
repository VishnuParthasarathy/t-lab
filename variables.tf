# Specify the region in which we would want to deploy our stack
variable "defaultRegion" {
  default = "us-east-1"
}

# Specify 3 availability zones from the region
variable "az" {
  default = ["us-east-1a", "us-east-1b", "us-east-1c"]
}

# Specify default instance type
variable "instanceType" {
  default = "t2.micro"
}

variable "instanceCount" {
  default = "2"
}

variable "hostName" {
  type    = list(any)
  default = ["ref3t-web-01", "ref3t-web-02"]
}