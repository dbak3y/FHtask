Terraform
variable "location" {
description = "Azure region"
type = string
default = "westeurope"
}

variable "resource_group_name" {
description = "Resource Group name"
type = string
default = "rg-acr-weu-fhtest_1"
}

variable "acr_name" {
description = "ACR name"
type = string
default = "acrplatformtest1"
}

variable "base_image" {
default = "docker.io/library/ubuntu:22.04"
}

variable "target_image" {
default = "ubuntu:22.04"
}
