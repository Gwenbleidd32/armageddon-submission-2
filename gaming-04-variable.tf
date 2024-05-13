#Network1
variable "net1" {
type = string
default = "cd-projeckt-red-main-net"
}
#>>>

#Network1-Subnet1
variable "net1_sub1" {
    type = string
    default = "warsaw-office"
}

variable "net1_sub1_iprange" {
    type = string
    default = "10.132.32.0/24"
}

variable "net1_sub1_region" {
    type = string
    default = "europe-central2"
}
#>>>

#Subnet1-VMInstance
variable "vm_name" {
  type = string
  default = "kamila-1"
}

variable "vm_machine_type" {
  type = string
  default = "e2-medium"
}

variable "vm_zone" {
  type = string
  default = "europe-central2-b"
}

variable "vm_image" {
  type = string
  default = "projects/debian-cloud/global/images/debian-12-bookworm-v20240415"
}

variable "vm_subnetwork" {
  type = string
  default = "projects/pooper-scooper/regions/europe-central2/subnetworks/warsaw-office"
  
}
/* Learned you can't Store this file in a variable. You need to make use of the locals resource.
variable "vm_metadata" {
  type = string
  default = file("${path.module}/script.sh")
}
*/
locals {
  vm_metadata = file("${path.module}/script.sh")
}
#>>>>>>



#Network 2
variable "net2" {
type = string
default = "cd-projeckt-red-japan-net"
}
#>>>
#Subnet 1
variable "net2_sub1" {
    type = string
    default = "tokyo-office"
}

variable "net2_sub1_iprange" {
    type = string
    default = "192.168.32.0/24"
}

variable "net2_sub1_region" {
    type = string
    default = "asia-northeast1"
}
#>>>

#Network2-Subnet1-VMInstance
variable "vm2_name" {
  type = string
  default = "kise-beya-1"
}

variable "vm2_machine_type" {
  type = string
  default = "e2-highmem-2"
}

variable "vm2_zone" {
  type = string
  default = "asia-northeast1-b"
}

variable "vm2_image" {
  type = string
  default = "projects/windows-cloud/global/images/windows-server-2022-dc-v20240415"
}

variable "vm2_subnetwork" {
  type = string
  default = "projects/pooper-scooper/regions/asia-northeast1/subnetworks/tokyo-office"
  
}
#>>>>>



#Network3
variable "net3" {
type = string
default = "cd-projeckt-red-americas"
}
#>>>
#Subnet 1
variable "net3_sub1" {
    type = string
    default = "montreal-office"
}

variable "net3_sub1_iprange" {
    type = string
    default = "172.16.32.0/24"
}

variable "net3_sub1_region" {
    type = string
    default = "northamerica-northeast1"
}
#>>>
#Subnet 1 VM Instance

variable "vm3_name" {
  type = string
  default = "atreides-1"
  
}
variable "vm3_machine_type" {
  type = string
  default = "e2-medium"
  
}
variable "vm3_zone" {
  type = string
  default = "northamerica-northeast1-a"
}

variable "vm3_image" {
  type = string
  default = "projects/debian-cloud/global/images/debian-12-bookworm-v20240415"
}

variable "vm3_subnetwork" {
  type = string
  default = "projects/pooper-scooper/regions/northamerica-northeast1/subnetworks/montreal-office"
  
}
#>>>



#Subnet 2
variable "net3_sub2" {
    type = string
    default = "sao-paulo-office"
}

variable "net3_sub2_iprange" {
    type = string
    default = "172.16.76.0/24"
}

variable "net3_sub2_region" {
    type = string
    default = "southamerica-east1"
}
#>>>

#Subnet 2 VM Instance
variable "vm3_1_name" {
  type = string
  default = "atreides-2"
  
}
variable "vm3_1_machine_type" {
  type = string
  default = "e2-highmem-2"
  
}
variable "vm3_1_zone" {
  type = string
  default = "southamerica-east1-a"
}

variable "vm3_1_image" {
  type = string
  default = "projects/windows-cloud/global/images/windows-server-2022-dc-v20240415"
}

variable "vm3_1_subnetwork" {
  type = string
  default = "projects/pooper-scooper/regions/southamerica-east1/subnetworks/sao-paulo-office"
  
}
#>>>

