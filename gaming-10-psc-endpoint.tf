/*
First time using modules to complete a task in terraform.
This module is used to create a private service connect endpoint.
Based on how I used it it seems akin to the process of importing a function in python.
Now to test it out.
It worked! The module was able to create the private service connect endpoint.
This enabled Access to one of my private storage buckets. 
The way endpoints are created in the command line reminds me of creating and using VPN Gateways.
*/

module "private_service_connect" {
  source                     = "terraform-google-modules/network/google//modules/private-service-connect"
  project_id                 = "pooper-scooper"
  network_self_link          = google_compute_network.network_3.self_link
  private_service_connect_ip = "10.176.32.4"
  forwarding_rule_target     = "all-apis"
}

