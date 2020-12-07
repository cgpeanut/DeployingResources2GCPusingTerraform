Chapter 1: Getting Started
```
Chapter 2: Overview
    why you should use terraform to manage GCP
    what is Terraform ?
        1. Is a tool for building, changing, and versioning infrastructure safely and efficiently.
        2. Can manage existing and popular service providers as well as custom in-house solutions.
        3. Configuration files describe to Terraform the components needed to run a single application or your entire data center.
        4. Generates an execution plan describing what it will do to reach the desired state, and executes it to build the entire infrastructure.
        5. As the configuration changes, Terraform is able to determine what changed and create incremental execution plans whihc can be applied.
        6. The infrastructure Terraform can manage includes low-level components such as compute instances, load balancers, DNS entries, SaaS features like stackdriver etc.
```
    How does Terraform Differ from Google Deployment Manager?
        Benefits from Terraform
            1. Infrastructure as Code
            2. Execution Plans
            3. Change Automation
```
        Terraform is:
           1. Widely-used cloud tool
           2. Multi-Cloud Development, you can use Terrafrom in all major cloud public cloud providers AWS, GCP and Azure.
           3. Terraform uses HCL, this is HashiCorp's configuration Language for creating IaaC solutions for Cloud.
           4. All Major Cloud Providers are Supported.
```
Chapter 3: Creating your Terraform Admin Project
    Step for Installing Terraform
```
    $ centos7 server 
    $ sudo yum update -y 
    $ sudo yum -y install epel-release
    $ sudo yum -y install wget unzip vim git -y
    $ git --version
    $ wget https://releases.hashicorp.com/terraform/0.12.29/terraform_0.12.29_linux_amd64.zip
    $ unzip terraform_0.12.29_linux_amd64.zip
    $ sudo mv terraform /usr/local/bin/
    $ terraform --version
```
Install & Setup Google Cloud SDK
```
    $ sudo tee -a /etc/yum.repos.d/google-cloud-sdk.repo << EOM

[google-cloud-sdk]
name=Google Cloud SDK
baseurl=https://packages.cloud.google.com/yum/repos/cloud-sdk-el7-x86_64
enabled=1
gpgcheck=1
repo_gpgcheck=1
gpgkey=https://packages.cloud.google.com/yum/doc/yum-key.gpg https://packages.cloud.google.com/yum/doc/rpm-package-key.gpg
EOM

$ sudo yum install google-cloud-sdk -y

Initialize Cloud 
$ gcloud init --console-only
```
Authorizing Cloud SDK Tools
$ gcloud auth activate-service-account --key-file [KEY_FILE]

$ Reference: https://cloud.google.com/sdk/docs/authorizing
```
    Creating the Terraform Project and Service Account
    (Setting Up and Configuring Terrform Project)
        1. Create Terrafrom Project, new project in our GCP console that will host out Terraform Project.
        2. Create a Service Account, create a new service account that will use to connect from our local environment to our GCO environment. 
        3. Set Up Configuration file, we are going to setup the configuration file in Terrafrom for our GCO environment.
```
Configuration File Template
```

provider "google" {
   credentials = file("NAME.json")
   project = "<PROJECT_ID>"
   region  = "<us-central1>"
   zone    = "<us-central1-c"
}

resource "google_compute_network"
  "vpc_network" {
  name = "terraform-network" }

Note: Tells terrafrom to build a VPC network in google cloud environment particularly name
it terraform-network
```
Enabling APIs
```
    1. Hamburger -> Dashboard -> Enable API & Services 
    2. Cloud Resource Manager API
    3. Compute Engine API
    4. Cloud Storage API
    5. Cloud IAM API
    6. Cloud Billing API
```
    Setting Up Remote State in Cloud Storage
```
    - Stores the state as an object in a configurable prefix in a given bucket on Google Cloud Storage (GCS).
    - This backend also supports state locking.
```
Note: Remote backends allows Terraform to use a share store space or state data so any member of your team can use Terrafrom to manage the same infrastructure.
```
    - Remote state, stores the state of an object in a configurable prefix, any given bucket in google cloud storage also supports state locking.
    - State Locking if supported by your backend will lock the state of all operations that can write state, this prevents others from acquiring the lock and potetially corrupting your state file.
```
```
Create two buckets in the google cloud console to store a backup of the terrafrom TF state file.
Hamburger -> Storage -> Create bucket -> uniquely name it mytfbucket6315 ->
Location Type: Region
Location: us-central-1 iowa
Default Storage Class for your data: Standard
Access control: fine-grain
Advanced Settings: Google-mananged-key
Create
```
```
Within the newly created bucket, create a folder named terrform6315
Once the Teraaform bucket and folder is created, use terminal to create a backend configuration to our main.tf file.
```
```
$ vi main.tf

Inside the main.tf Configuration File:

 provider "google" {
    credentials = file("terraform-key.json")
    project = "terraformgcp-294600"
    region  = "us-central1"
    zone    = "us-central1-c"
 }

 resource "google_compute_network" "vpc_network" {
    name = "terraform-network"
 }
```
```
terraform {
  backend "gcs" {
  bucket = "terraform6315"
  prefix = "terraform1"
  credentials = "terraform-key.json"
  }
}
```
```
Chapter 4: Terraform init, plan and apply
    Understanding 'terraform init'
    Understanding 'terraform plan'
    Understanding 'terraform apply'
    Understanding 'terraform output'
    Hands on Lab - Installing and Configuring Terraform in a computer engine
    Terraform Basics: Understanding 'init', 'plan' and 'apply'
```
Chapter 5: Using Terraform to Create a New Project
    Using Terraform Modules
```
Chapter 6: Using Terraform to Create a New VPC
    Defining your network variables
    Creating firewall and associated rules
    Defining public and private subnets
    Hand on lab: Using Terrafomr to Create a New VPC and Public Subnet in GCP
        - Create a service account
            - GCP cpnsole (Hamburger) -> IAM & Admin -> Service Accounts
                - Click Service account 
                - Give service account a name 
        - login to the terraform instance
            - echo "PATH='$PATH:/downloads/'" >> /etc/profile # terraform executable is located.
            - source /etc/profile
            - gcloud auth login
            - gcloud iam service-accounts keys create /downloads/instance.json --iam-account terraform@using-terraf-156-1e320073.iam.gserviceaccount.com
            - cd /
            - vim main.tf

provider "google" {
  version = "3.5.0"
  credentials = file("/downloads/instance.json")
  project = "<PROJECT_NAME>"
  region  = "us-central1"
  zone    = "us-central1-c"
}
resource "google_compute_network" "vpc_network" {
  name = "terraform-network"
}
resource "google_compute_subnetwork" "public-subnetwork" {
  name          = "terraform-subnetwork"
  ip_cidr_range = "10.2.0.0/16"
  region        = "us-central1"
  network       = google_compute_network.vpc_network.name
  }



```
Chapter 7: Using Terraform to create Create Compute Engine Instance
    Defining your instance variables
    setting up startup script
    Hands on lab: Using Terraform to lunch a Compute Engine Instance in GCP
```
Chapter 8: Using Terrafomr to Auto Scale and Load Balance and Managed Instanced Groups
    Definig your Auto Scale and Load Balancing Variables 
    Hands on LabL Using Terrafomr to auto scale and load balance computer engine instances groups
```
Chapter 9: Cleaning up
    Deploying Resources Using Terraform 
```
Final Steps 
    What Next ?



