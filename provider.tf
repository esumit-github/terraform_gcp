##################################################################################
# PROVIDERS
##################################################################################

provider "google" {
  credentials = file("sumit-gcp-278301-9802bc26fa16.json")
  project = "sumit-gcp-278301"
  region  = "asia-east1"
  zone    = "asia-east1-a"
}
