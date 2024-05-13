#Gateway Network 1 Subnet 1
resource "google_compute_vpn_gateway" "gateway-1" {
    name = "lunar-gateway1"
    network = google_compute_network.network_1.id
    region = var.net1_sub1_region
    depends_on = [ google_compute_subnetwork.network_sub1 ]
}
#>>>

#IP Birth
resource "google_compute_address" "st1" {
  name = "orbit1"
  region = var.net1_sub1_region
}
#IP Output
output "gateway1-ip" {
  value = google_compute_address.st1.address
}
#>>>

#Fowarding Rule to Link Gatway to Generated IP
resource "google_compute_forwarding_rule" "rule1-esp" {
  name = "rule-1"
  region = var.net1_sub1_region
  ip_protocol = "ESP"
  ip_address = google_compute_address.st1.address
  target = google_compute_vpn_gateway.gateway-1.self_link
}
#>>>

#UPD 500 traffic Rule
resource "google_compute_forwarding_rule" "rule2-500" {
  name = "rule-2"
  region = var.net1_sub1_region
  ip_protocol = "UDP"
  ip_address = google_compute_address.st1.address
  port_range = "500"
  target = google_compute_vpn_gateway.gateway-1.self_link
}
#>>>

#UDP 4500 traffic rule
resource "google_compute_forwarding_rule" "rule3-4500" {
  name = "rule-3"
  region = var.net1_sub1_region
  ip_protocol = "UDP"
  ip_address = google_compute_address.st1.address
  port_range = "4500"
  target = google_compute_vpn_gateway.gateway-1.self_link
}
#>>>

#Tunnel
resource "google_compute_vpn_tunnel" "tunnel-1" {
  name = "highliner1"
  target_vpn_gateway = google_compute_vpn_gateway.gateway-1.id
  peer_ip = google_compute_address.st2.address
  shared_secret = sensitive("iq/dW63iCXYPbNDshzG6W1Ay1qpWoC0y")
  ike_version = 2
  local_traffic_selector = [var.net1_sub1_iprange] 
  remote_traffic_selector = [var.net2_sub1_iprange]
  depends_on = [ 
    google_compute_forwarding_rule.rule1-esp,
    google_compute_forwarding_rule.rule2-500,
    google_compute_forwarding_rule.rule3-4500
   ]
}
#>>>

#Next Hop to Final Destination
resource "google_compute_route" "route1" {
  name = "route1"
  network = google_compute_network.network_1.id
  dest_range = var.net2_sub1_iprange
  priority = 1000
  next_hop_vpn_tunnel = google_compute_vpn_tunnel.tunnel-1.id
  depends_on = [ google_compute_vpn_tunnel.tunnel-1 ]
}
#>>>

#Internal Traffic Firewall rule 
resource "google_compute_firewall" "allow_internal-1" {
  name    = "allow-internal-1"
  network = var.net1

  allow {
    protocol = "tcp"
    ports = ["80"]
  }

  source_ranges = [var.net2_sub1_iprange]
  description   = "Allowing only port 80 traffic from peer network"
  depends_on = [ google_compute_route.route1 ]
}
#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>  

#Gateway Network 2 Subnet 1
resource "google_compute_vpn_gateway" "gateway-2" {
    name = "lunar-gateway2"
    network = google_compute_network.network_2.id
    region = var.net2_sub1_region
    depends_on = [ google_compute_subnetwork.network2_sub1]
}
#>>>

#IP Birth
resource "google_compute_address" "st2" {
  name = "orbit2"
  region = var.net2_sub1_region
}
#IP Output
output "gateway2-ip" {
  value = google_compute_address.st2.address
}
#>>>

#Fowarding Rule to Link Gatway to Generated IP
resource "google_compute_forwarding_rule" "rule4-esp" {
  name = "rule-4"
  region = var.net2_sub1_region
  ip_protocol = "ESP"
  ip_address = google_compute_address.st2.address
  target = google_compute_vpn_gateway.gateway-2.self_link
}
#>>>

#UPD 500 traffic Rule
resource "google_compute_forwarding_rule" "rule5-500" {
  name = "rule-5"
  region = var.net2_sub1_region
  ip_protocol = "UDP"
  ip_address = google_compute_address.st2.address
  port_range = "500"
  target = google_compute_vpn_gateway.gateway-2.self_link
}
#>>>

#UDP 4500 traffic rule
resource "google_compute_forwarding_rule" "rule6-4500" {
  name = "rule-6"
  region = var.net2_sub1_region
  ip_protocol = "UDP"
  ip_address = google_compute_address.st2.address
  port_range = "4500"
  target = google_compute_vpn_gateway.gateway-2.self_link
}
#>>>

#Tunnel
resource "google_compute_vpn_tunnel" "tunnel-2" {
  name = "highliner2"
  target_vpn_gateway = google_compute_vpn_gateway.gateway-2.id
  peer_ip = google_compute_address.st1.address
  shared_secret = sensitive("iq/dW63iCXYPbNDshzG6W1Ay1qpWoC0y")
  ike_version = 2
  local_traffic_selector = [var.net2_sub1_iprange] 
  remote_traffic_selector = [var.net1_sub1_iprange]
  depends_on = [ 
    google_compute_forwarding_rule.rule4-esp,
    google_compute_forwarding_rule.rule5-500,
    google_compute_forwarding_rule.rule6-4500
   ]
}
#>>>

#Next Hop to Final Destination
resource "google_compute_route" "route2" {
  name = "route2"
  network = google_compute_network.network_2.id
  dest_range = var.net1_sub1_iprange
  priority = 1000
  next_hop_vpn_tunnel = google_compute_vpn_tunnel.tunnel-2.id
  depends_on = [ google_compute_vpn_tunnel.tunnel-2 ]
}
#>>>
/* No need for this as Warsaw does not need communications from Japan.
#Internal Traffic Firewall rule
resource "google_compute_firewall" "allow_internal-2" {
  name    = "allow-internal-2"
  network = var.net2

  allow {
    protocol = "all"
  }

  source_ranges = [var.net1_sub1_iprange]
  description   = "Allow all internal traffic from peer network"
  depends_on = [ google_compute_route.route2 ]
}
#>>>
*/