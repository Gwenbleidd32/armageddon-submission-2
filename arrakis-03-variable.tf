#Network 1
variable "a-net1" {
type = string
default = "arrakis-net"
}
#>>>
#Subnet 1
variable "a-net1_sub1" {
    type = string
    default = "arrakeen-keep"
}

variable "a-net1_sub1_iprange" {
    type = string
    default = "10.176.32.0/24"
}

variable "a-net1_sub1_region" {
    type = string
    default = "me-west1"
}
#>>>

#VM Instances
variable "a-vm_name" {
  type = string
  default = "hark-1"
}

variable "a-vm_machine_type" {
  type = string
  default = "e2-medium"
}

variable "a-vm_zone" {
  type = string
  default = "me-west1-a"
}

variable "a-vm_image" {
  type = string
  default = "projects/debian-cloud/global/images/debian-12-bookworm-v20240415"
}

variable "a-vm_subnetwork" {
  type = string
  default = "projects/pooper-scooper/regions/me-west1/subnetworks/arrakeen-keep"
  
}
#Using Locals Since you cannot deploy a bash script within a variable
locals {
  a-vm_metadata = file("${path.module}/arrakis-script.sh")
}