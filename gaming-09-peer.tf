#3 ---> 1
resource "google_compute_network_peering" "network1_to_network3" {
  name         = "network1-to-network3"
  network      = google_compute_network.network_1.self_link
  peer_network = google_compute_network.network_3.self_link
  depends_on = [ google_compute_network.network_1, google_compute_network.network_3 ]
}

resource "google_compute_network_peering" "network3_to_network1" {
  name         = "network3-to-network1"
  network      = google_compute_network.network_3.self_link
  peer_network = google_compute_network.network_1.self_link
  depends_on = [ google_compute_network.network_1, google_compute_network.network_3 ]
}
#>>>

#Peering Internal Rule, To Note I prefer adding my tunnel/internetwork connection firewall rules in the same location as the connection.
#3-1
resource "google_compute_firewall" "allow_peering_traffic" {
  name    = "allow-peering-traffic"
  network = google_compute_network.network_1.self_link

  allow {
    protocol = "tcp"
    ports = ["80"]
  }

  source_ranges = ["172.16.32.0/24", "172.16.76.0/24"]  # Replace with the IP range of Network 3
  depends_on = [ google_compute_network_peering.network1_to_network3, google_compute_network_peering.network3_to_network1]
}
#>>>