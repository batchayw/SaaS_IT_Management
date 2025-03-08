# Variables for oVirt module
variable "image_name" {
  type = string
}

variable "flavor_name" {
  type = string
}

variable "key_pair" {
  type = string
}

variable "security_groups" {
  type = list(string)
}

variable "network_name" {
  type = string
}