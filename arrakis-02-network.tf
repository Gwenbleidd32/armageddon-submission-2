#Parent Network
resource google_compute_network "a-network_1" {
    name                    = var.a-net1
    description             = "Network channel for Net1 variable"
    auto_create_subnetworks = false
    routing_mode            = "REGIONAL"
    mtu                     = 1460
}

output "arrakis-n1" {
    value = google_compute_network.a-network_1.name
}
#>>>
#Subnet1
resource google_compute_subnetwork "a-network_sub1" {
    name          = var.a-net1_sub1
    description   = "default subnet secure"
    ip_cidr_range = var.a-net1_sub1_iprange
    region        = var.a-net1_sub1_region
    network       = google_compute_network.a-network_1.id
}
#>>>
output "arrakis-n1_s1" {
    value = google_compute_subnetwork.a-network_sub1.name
}
output "arrakis-n1_s1_region" {
    value = google_compute_subnetwork.a-network_sub1.region
}
#>>>



#Firewall rules:
#ICMP
resource "google_compute_firewall" "a-net1_icmp"{
    name = "a-net1-icmp"
    network = google_compute_network.a-network_1.id
    description = "whodoneit?"
    direction = "INGRESS"
    priority = 65534
    source_ranges = ["0.0.0.0/0"]
    allow {
        protocol = "icmp"
    }
    depends_on = [google_compute_network.a-network_1]
}
#>>>
#SSH
resource "google_compute_firewall" "a-net1_ssh"{
    name = "a-net1-ssh"
    network = google_compute_network.a-network_1.id
    description = "whodoneit?"
    direction = "INGRESS"
    priority = 65534
    source_ranges = ["0.0.0.0/0"]
    allow {
        protocol = "tcp"
        ports = ["22"]
    }
    depends_on = [google_compute_network.a-network_1]
}
#>>>
#HTTP/HTTPS
resource "google_compute_firewall" "a-net1_http" {
  name    = "a-net1-http"
  network = google_compute_network.a-network_1.id

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }

  source_ranges = ["0.0.0.0/0"]
  direction     = "INGRESS"
  priority      = 1000
  description   = "Allow HTTP traffic from all sources"

  depends_on = [google_compute_network.a-network_1]
}
