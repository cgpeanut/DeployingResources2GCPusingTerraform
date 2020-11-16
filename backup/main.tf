provider "google" {
  credentials = file("terraform-key.json")
  project     = "terraformgcp-294600"
  region      = "us-central1"
  zone        = "us-central1-c"
}

resource "google_compute_network" "vpc_network" {
  name = "terraform-network"
}

terraform {
  backend "gcs" {
    bucket      = "terraform6315"
    prefix      = "terraform1"
    credentials = "terraform-key.json"
  }
}
