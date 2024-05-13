#Network1
resource google_compute_network "network_1" {
    name                    = var.net1
    description             = "Network channel for Net1 variable"
    auto_create_subnetworks = false
    routing_mode            = "REGIONAL"
    mtu                     = 1460
}

output "gaming-n1" {
    value = google_compute_network.network_1.name
}
#>>>

#Network1-Subnet1
resource google_compute_subnetwork "network_sub1" {
    name          = var.net1_sub1
    description   = "CDPR main office subnet"
    ip_cidr_range = var.net1_sub1_iprange
    region        = var.net1_sub1_region
    network       = google_compute_network.network_1.id
    private_ip_google_access = true
}
#>>>
output "gaming-n1_s1" {
    value = google_compute_subnetwork.network_sub1.name
}
output "gaming-n1_s1_range" {
    value = google_compute_subnetwork.network_sub1.ip_cidr_range
}
output "gaming-n1_s1_region" {
    value = google_compute_subnetwork.network_sub1.region
}
#>>>

#Network2

resource google_compute_network "network_2" {
    name                    = var.net2
    description             = "Network channel for Net1 variable"
    auto_create_subnetworks = false
    routing_mode            = "REGIONAL"
    mtu                     = 1460
}

output "gaming-n2" {
    value = google_compute_network.network_2.name
}
#>>>

#Network2-Subnet1
resource google_compute_subnetwork "network2_sub1" {
    name          = var.net2_sub1
    description   = "CDPR Tokyo office subnet"
    ip_cidr_range = var.net2_sub1_iprange
    region        = var.net2_sub1_region
    network       = google_compute_network.network_2.id
}
#>>>
output "gaming-n2_s1" {
    value = google_compute_subnetwork.network2_sub1.name
}
output "gaming-n2_s1_range" {
    value = google_compute_subnetwork.network2_sub1.ip_cidr_range
}
output "gaming-n2_s1_region" {
    value = google_compute_subnetwork.network2_sub1.region
}
#>>>

#Network3 
resource google_compute_network "network_3" {
    name                    = "cd-projeckt-red-americas1-net"
    description             = "3"
    auto_create_subnetworks = false
    routing_mode            = "REGIONAL"
    mtu                     = 1460
}

output "gaming-n3" {
    value = google_compute_network.network_3.name
}
#>>>

#Network3-Subnet1
resource google_compute_subnetwork "network3_sub1" {
    name          = var.net3_sub1
    description   = "Montreal office subnet"
    ip_cidr_range = var.net3_sub1_iprange
    region        = var.net3_sub1_region
    network       = google_compute_network.network_3.id
}
#>>>
output "gaming-n3_s1" {
    value = google_compute_subnetwork.network3_sub1.name
}
output "gaming-n3_s1_range" {
    value = google_compute_subnetwork.network3_sub1.ip_cidr_range
}
output "gaming-n3_s1_region" {
    value = google_compute_subnetwork.network3_sub1.region
}
#>>>

#Network3-Subnet2
resource google_compute_subnetwork "network3_sub2" {
    name          = var.net3_sub2
    description   = "Sao Paulo office subnet"
    ip_cidr_range = var.net3_sub2_iprange
    region        = var.net3_sub2_region
    network       = google_compute_network.network_3.id
}
#>>>
output "gaming-n3_s2" {
    value = google_compute_subnetwork.network3_sub2.name
}
output "gaming-n3_s2_range" {
    value = google_compute_subnetwork.network3_sub2.ip_cidr_range
}
output "gaming-n3_s2_region" {
    value = google_compute_subnetwork.network3_sub2.region
}
#>>>