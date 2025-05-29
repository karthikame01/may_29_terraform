variable "ami" {}
variable "instance_type" {}
variable "subnet_id" {}
variable "vpc_id" {}
variable "my_key_name" {
    type    = string
   # default = "personal_lap" # Replace with your key pair name
}
variable "public_ip" {
  type    = bool
  default = false
}

variable "tags" {
  type    = map(string)
  default = {}
}
