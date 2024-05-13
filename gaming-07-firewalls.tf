#Firewall rules:

#Network 1
#ICMP
resource "google_compute_firewall" "net1_icmp"{
    name = "net1-icmp"
    network = google_compute_network.network_1.id
    description = "whodoneit?"
    direction = "INGRESS"
    priority = 65534
    source_ranges = ["0.0.0.0/0"]
    allow {
        protocol = "icmp"
    }
}
#>>>>>


#Network 2
#RDP
resource "google_compute_firewall" "net2_rdp"{
    name = "net2-rdp"
    network = google_compute_network.network_2.id
    description = "whatforandwhy?"
    direction = "INGRESS"
    priority = 65534
    source_ranges = ["0.0.0.0/0"]
    allow {
        protocol = "tcp"
        ports = ["3389"]
    }
}
#>>>

#Network 3
#RDP
#I have configured one windows machine and one linux machine in this network.
resource "google_compute_firewall" "net3_rdp"{
    name = "net3-rdp"
    network = google_compute_network.network_3.id
    description = "whatforandwhy?"
    direction = "INGRESS"
    priority = 65534
    source_ranges = ["0.0.0.0/0"]
    allow {
        protocol = "tcp"
        ports = ["3389"]
    }
}
#SSH
resource "google_compute_firewall" "net3_ssh"{
    name = "net3-ssh"
    network = google_compute_network.network_3.id
    description = "whatforandwhy?"
    direction = "INGRESS"
    priority = 65534
    source_ranges = ["0.0.0.0/0"]
    allow {
        protocol = "tcp"
        ports = ["22"]
    }
}
#>>>