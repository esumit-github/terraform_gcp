// Configure the Google Cloud provider
provider "google" {
  credentials = file("sumit-gcp-278301-9802bc26fa16.json")
  project = "sumit-gcp-278301"
  region  = "asia-east1"
  zone    = "asia-east1-a"
}
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
    network = "default"
    access_config {
    }
  }
}
