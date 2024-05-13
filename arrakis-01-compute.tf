#VM Instance 1
resource "google_compute_instance" "a-vm_instance" {
  name         = var.a-vm_name
  machine_type = var.a-vm_machine_type
  zone         = var.a-vm_zone

  tags = ["http-server", "https-server"]#public network tags

  boot_disk {
    initialize_params {
      image = var.a-vm_image
      size = 10 
      type = "pd-balanced"
    }
  }

  network_interface {
    access_config {
      // Ephemeral IP
      network_tier = "PREMIUM"
    }
    subnetwork = var.a-vm_subnetwork
    stack_type  = "IPV4_ONLY"
  }

  metadata_startup_script = local.a-vm_metadata

  service_account {
    email  = "876288284083-compute@developer.gserviceaccount.com"
    scopes = ["https://www.googleapis.com/auth/devstorage.read_only", "https://www.googleapis.com/auth/logging.write", "https://www.googleapis.com/auth/monitoring.write", "https://www.googleapis.com/auth/service.management.readonly", "https://www.googleapis.com/auth/servicecontrol", "https://www.googleapis.com/auth/trace.append"]
  }
  depends_on = [ google_compute_subnetwork.a-network_sub1 ]
}

# Output the IP address of the instance with print included
output "arrakis-vm_public_ip" {
  description = "The public IP of the VM instance"
  value       = google_compute_instance.a-vm_instance.network_interface[0].access_config[0].nat_ip
}

output "arrakis-vm_internal_ip" {
  description = "The internal IP of the VM instance"
  value       = google_compute_instance.a-vm_instance.network_interface[0].network_ip
}

resource "local_file" "arrakis-output" {
  content = "Public IP: ${google_compute_instance.a-vm_instance.network_interface[0].access_config[0].nat_ip}\nInternal IP: ${google_compute_instance.a-vm_instance.network_interface[0].network_ip}\nNetwork Name: ${google_compute_network.a-network_1.name}\nSubnetwork Name: ${google_compute_subnetwork.a-network_sub1.name}\nSubnetwork Region: ${google_compute_subnetwork.a-network_sub1.region}"
  filename = "${path.module}/output.txt"
}