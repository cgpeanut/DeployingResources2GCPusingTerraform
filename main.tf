provider "google" {
    2.    credentials = file("terraform-key.json")
    3.    project = "terraformgcp-294523"
    4.    region  = "<us-central1>"
    5.    zone    = "<us-central1-c"
    6. }
    7. 
    8.  resource "google_compute_network"
    9.  "vpc_network" {
    10. name = "terraform-network" }