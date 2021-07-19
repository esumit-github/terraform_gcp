
##################################################################################
# VARIABLES
##################################################################################






##################################################################################
# RESOURCES
##################################################################################

#-----------------
#FIREWALL resource
#-----------------
# google_compute_firewall | firewall – 
# this is to allow port 22 for SSH to the public

resource "google_compute_firewall" "firewall" {
  name    = "test-firewall-externalssh"
  network = "default"
  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
  source_ranges = ["0.0.0.0/0"] # Not So Secure. Limit the Source Range
  target_tags   = ["externalssh"]
}


#-----------------
#FIREWALL Rule
#-----------------
# google_compute_firewall | webserverrule – this is to create a firewall rule to 
# allow port 80 and 443 required by NGINX


resource "google_compute_firewall" "webserverrule" {
  name    = "test-webserver"
  network = "default"
  allow {
    protocol = "tcp"
    ports    = ["80","443"]
  }
  source_ranges = ["0.0.0.0/0"] # Not So Secure. Limit the Source Range
  target_tags   = ["webserver"]
}

#-----------------
#VM resource
#-----------------
resource "google_compute_instance" "vm_instance" {
  name         = "terraform-instance"
  machine_type = "e2-standard-2"

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-1804-lts"
    }
  }

  network_interface {
    # A default network is created for all GCP projects
    network = "${google_compute_network.vpc_network.self_link}"
    access_config {
    }
  }
}

resource "google_compute_network" "vpc_network" {
  name                    = "terraform-network"
  auto_create_subnetworks = "true"
}

##################################################################################
# OUTPUT
##################################################################################
