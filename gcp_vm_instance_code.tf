// Configure the Google Cloud provider
provider "google" {
  credentials = file("sumit-gcp-278301-e434e7b64189.json")
  project = "sumit-gcp-278301"
  region  = "asia-east1"
  zone    = "asia-east1-a"
}
resource "google_compute_instance" "vm_instance" {
  name         = "terraform-instance"
  machine_type = "f1-micro"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  network_interface {
    # A default network is created for all GCP projects
    network = "default"
    access_config {
    }
  }
}
