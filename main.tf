provider "google" {
  credentials = file("terraform-key.json")
  project = "terraformgcp-294523"
  region  = "us-central1"
  zone    = "us-central1-c"
}

  resource "google_compute_network"
    "vpc_network" {
       name = "terraform-network" 
    }
