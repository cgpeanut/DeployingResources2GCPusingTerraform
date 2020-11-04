# Terraform 
- Is a tool for building, chaging, and versioning infrastructure safely and efficiently. 
- can manage existing and popular service providers as well as custom in-house solutions.
- Configuration files describe to Terraform the components needed to run a single application or your entire data center.
- Generates an execution plan describing what it will do to reach the desired state, and executes it to build the entire infrastructure. 
- As the configuration changes, Terraform is able to determine what changed and create incremental execution plans whihc can be applied. 
- The infrastructure Terraform can manage includes low-level components such as compute instances, load balancers, DNS entries, SaaS features like stackdriver etc.
# Benefits from Terraform
    1.  Infrastructure as Code
    2.  Execution Plans
    3.  Change Automation

#  Terraform 
    - Widely-used cloud tool 
    - Multi-Cloud Development, you can use Terrafrom in all major cloud public cloud providers AWS, GCP and Azure.
    - Terraform uses HCL, this is HashiCorp's configuration Language for creating IaC solutions for Cloud. 
    - All Major Cloud Providers are Supported .

# Installing Terraform 
    - centos7 server 
    - sudo yum update -y 
    - sudo yum -y install epel-release
	- sudo yum -y install wget unzip vim git -y
	- git --version
	- wget https://releases.hashicorp.com/terraform/0.12.29/terraform_0.12.29_linux_amd64.zip
	- unzip terraform_0.12.29_linux_amd64.zip
    - sudo mv terraform /usr/local/bin/
	- terraform --version

# Install & Setup Google Cloud SDK
    1. sudo tee -a /etc/yum.repos.d/google-cloud-sdk.repo << EOM
    2. [google-cloud-sdk]
    3. name=Google Cloud SDK
    4. baseurl=https://packages.cloud.google.com/yum/repos/cloud-sdk-el7-x86_64
    5. enabled=1
    6. gpgcheck=1
    7. repo_gpgcheck=1
    8. gpgkey=https://packages.cloud.google.com/yum/doc/yum-key.gpg
    9.        https://packages.cloud.google.com/yum/doc/rpm-package-key.gpg
    10. EOM
    11. yum install google-cloud-sdk -y

 # Initialize Cloud 
- gcloud init --console-only
 
 # Authorizing Cloud SDK Tools
 - gcloud auth activate-service-account --key-file [KEY_FILE]
 - Reference: https://cloud.google.com/sdk/docs/authorizing

 # Creating the Terrafrom Project and Service Account in GCP
 (Setting Up and Configuring Terrform Project)

    1. Create Terrafrom Project, new project in our GCP console that will host out Terraform Project.
    2. Create a Service Account,  create a new service account that will use to connect from our local environment to our GCO environment. 
    3. Set Up Configuration file, we are going to setup the configuration file in Terrafrom for our GCO environment.

 # Configuration File Template
    1. provider "google" {
    2.    credentials = file("NAME.json")
    3.    project = "<PROJECT_ID>"
    4.    region  = "<us-central1>"
    5.    zone    = "<us-central1-c"
    6. }
    7. 
    8.  resource "google_compute_network"
    9.  "vpc_network" {
    10. name = "terraform-network" }

# Create Project
# Create Service Account 
    - IAM & Admin -> Service Account -> Create New Service Account -> terraform description terrafrom service account -> create
    - Select Role Project Editor -> service account admin role robertoruizroxas@gmail.com -> create a key JSON terrafrom_key

# Setup terraform to connect to GCP with Service account key using template
    - cd $HOME
    - mkdir google
    - mv terraform-key.json google
    - vi main.tf 

# create terraform configuration file main.tf

    1. provider "google" {
    2.    credentials = file("terraform-key.json")
    3.    project = "terraformgcp-294523"
    4.    region  = "us-central1"
    5.    zone    = "us-central1-c"
    6. }
    7. 
    8.  resource "google_compute_network"
    9.  "vpc_network" {
    10. name = "terraform-network" }
    11. # Note Tells terrafrom to build a VOC network in google cloud environment 
    12. # particularly name it terraform-etwork

# Enabling GCP APIs

