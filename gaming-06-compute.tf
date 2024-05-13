#VM NETWORK 1 SUBNET 1 INSTANCE 1
resource "google_compute_instance" "vm_instance" {
  name         = var.vm_name
  machine_type = var.vm_machine_type
  zone         = var.vm_zone

  boot_disk {
    initialize_params {
      image = var.vm_image
      size = 10 
      type = "pd-balanced"
    }
  }

  network_interface {
    access_config {
      // Ephemeral IP
      network_tier = "PREMIUM"
    }
    subnetwork = var.vm_subnetwork
    stack_type  = "IPV4_ONLY"
  }

  metadata_startup_script = local.vm_metadata

  service_account {
    email  = "876288284083-compute@developer.gserviceaccount.com"
    scopes = ["https://www.googleapis.com/auth/devstorage.read_only", "https://www.googleapis.com/auth/logging.write", "https://www.googleapis.com/auth/monitoring.write", "https://www.googleapis.com/auth/service.management.readonly", "https://www.googleapis.com/auth/servicecontrol", "https://www.googleapis.com/auth/trace.append"]
  }
  depends_on = [ google_compute_subnetwork.network_sub1 ]
}
#>>>

#VM NETWORK 2 SUBNET 1 INSTANCE 1
resource "google_compute_instance" "vm_instance_2" {
  name         = var.vm2_name
  machine_type = var.vm2_machine_type
  zone         = var.vm2_zone

  boot_disk {
    initialize_params {
      image = var.vm2_image
      size = 50 
      type = "pd-balanced"
    }
  }

  network_interface {
    access_config {
      // Ephemeral IP
      network_tier = "PREMIUM"
    }
    subnetwork = var.vm2_subnetwork
    stack_type  = "IPV4_ONLY"
  }

  service_account {
    email  = "876288284083-compute@developer.gserviceaccount.com"
    scopes = ["https://www.googleapis.com/auth/devstorage.read_only", "https://www.googleapis.com/auth/logging.write", "https://www.googleapis.com/auth/monitoring.write", "https://www.googleapis.com/auth/service.management.readonly", "https://www.googleapis.com/auth/servicecontrol", "https://www.googleapis.com/auth/trace.append"]
  }
  depends_on = [ google_compute_subnetwork.network2_sub1 ]
}
#>>>

#VM NETWORK 3 SUBNET 1 INSTANCE 1
resource "google_compute_instance" "vm_instance_3" {
  name         = var.vm3_name
  machine_type = var.vm3_machine_type
  zone         = var.vm3_zone

  boot_disk {
    initialize_params {
      image = var.vm3_image
      size = 50 
      type = "pd-balanced"
    }
  }

  network_interface {
    access_config {
      // Ephemeral IP
      network_tier = "PREMIUM"
    }
    subnetwork = var.vm3_subnetwork
    stack_type  = "IPV4_ONLY"
  }

  service_account {
    email  = "876288284083-compute@developer.gserviceaccount.com"
    scopes = ["https://www.googleapis.com/auth/devstorage.read_only", "https://www.googleapis.com/auth/logging.write", "https://www.googleapis.com/auth/monitoring.write", "https://www.googleapis.com/auth/service.management.readonly", "https://www.googleapis.com/auth/servicecontrol", "https://www.googleapis.com/auth/trace.append"]
  }
  depends_on = [ google_compute_subnetwork.network3_sub1 ]
}
#>>>

#VM NETWORK 3 SUBNET 2 INSTANCE 1
resource "google_compute_instance" "vm_instance_3_1" {
  name         = var.vm3_1_name
  machine_type = var.vm3_1_machine_type
  zone         = var.vm3_1_zone

  boot_disk {
    initialize_params {
      image = var.vm3_1_image
      size = 50 
      type = "pd-balanced"
    }
  }

  network_interface {
    access_config {
      // Ephemeral IP
      network_tier = "PREMIUM"
    }
    subnetwork = var.vm3_1_subnetwork
    stack_type  = "IPV4_ONLY"
  }

  service_account {
    email  = "876288284083-compute@developer.gserviceaccount.com"
    scopes = ["https://www.googleapis.com/auth/devstorage.read_only", "https://www.googleapis.com/auth/logging.write", "https://www.googleapis.com/auth/monitoring.write", "https://www.googleapis.com/auth/service.management.readonly", "https://www.googleapis.com/auth/servicecontrol", "https://www.googleapis.com/auth/trace.append"]
  }
  depends_on = [ google_compute_subnetwork.network3_sub2 ]
}
#>>>