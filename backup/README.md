Terraform 
1. Is a tool for building, changing, and versioning infrastructure safely and efficiently. 
2. Can manage existing and popular service providers as well as custom in-house solutions.
3. Configuration files describe to Terraform the components needed to run a single application or your entire data center.
4. Generates an execution plan describing what it will do to reach the desired state, and executes it to build the entire infrastructure. 
5. As the configuration changes, Terraform is able to determine what changed and create incremental execution plans whihc can be applied. 
6. The infrastructure Terraform can manage includes low-level components such as compute instances, load balancers, DNS entries, SaaS features like stackdriver etc.
```
```
Benefits from Terraform
1. Infrastructure as Code
2. Execution Plans
3. Change Automation
```
```
Terraform is: 
1. Widely-used cloud tool 
2. Multi-Cloud Development, you can use Terrafrom in all major cloud public cloud providers AWS, GCP and Azure.
3. Terraform uses HCL, this is HashiCorp's configuration Language for creating IaC solutions for Cloud. 
4. All Major Cloud Providers are Supported .
```
Installing Terraform 
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
```
Install & Setup Google Cloud SDK
$ sudo tee -a /etc/yum.repos.d/google-cloud-sdk.repo << EOM
[google-cloud-sdk]
name=Google Cloud SDK
baseurl=https://packages.cloud.google.com/yum/repos/cloud-sdk-el7-x86_64
enabled=1
gpgcheck=1
repo_gpgcheck=1
gpgkey=https://packages.cloud.google.com/yum/doc/yum-key.gpg https://packages.cloud.google.com/yum/doc/rpm-package-key.gpg
EOM
```
$ sudo yum install google-cloud-sdk -y
Initialize Cloud 
$ gcloud init --console-only
 
```
```
Authorizing Cloud SDK Tools
$ gcloud auth activate-service-account --key-file [KEY_FILE]
$ Reference: https://cloud.google.com/sdk/docs/authorizing
```
```
Creating the Terrafrom Project and Service Account in GCP
(Setting Up and Configuring Terrform Project)
1. Create Terrafrom Project, new project in our GCP console that will host out Terraform Project.
2. Create a Service Account, create a new service account that will use to connect from our local environment to our GCO environment. 
3. Set Up Configuration file, we are going to setup the configuration file in Terrafrom for our GCO environment.
```
```
Configuration File Template
provider "google" {
   credentials = file("NAME.json")
   project = "<PROJECT_ID>"
   region  = "<us-central1>"
   zone    = "<us-central1-c"
}

resource "google_compute_network"
  "vpc_network" {
  name = "terraform-network" }
```
Create Project -> simple enough
Create Service Account 
1. IAM & Admin -> Service Account -> Create New Service Account -> terraform description terrafrom service account -> create
2. Select Role Project Editor -> service account admin role robertoruizroxas@gmail.com -> create a key JSON terrafrom_key
```
$ cd $HOME
$ mkdir google
$ mv terraform-key.json google
$ vi main.tf 
```
create terraform configuration file main.tf

provider "google" {
  credentials = file("terraform-key.json")
  project = "terraformgcp-294600"
  region  = "us-central1"
  zone    = "us-central1-c"
}

resource "google_compute_network"
  "vpc_network" {
  name = "terraform-network" }
```
Note: Tells terrafrom to build a VPC network in google cloud environment particularly name
it terraform-network

```
Enabling GCP APIs
1. Hamburger -> Dashboard -> Enable API & Services 
2. Cloud Resource Manager API
3. Compute Engine API
4. Cloud Storage API 
5. Cloud IAM API 
6. Cloud Billing API
```
1. Setting Up a Remote State in in GCP with Terraform

2. Stores the state as an object in a configurable prefix in a given bucket on Google Cloud Storage (GCS).
3. This backend also supports state locking.
4. Remote backends allows Terraform to use a share store space or state data so any member of your team can use Terrafrom to manage the same infrastructure.
5. Remote state, stores the state of an object in a configurable prefix, any given bucket in google cloud storage also supports state locking.
6. State Locking if supported by your backend will lock the state of all operations that can write state, this prevents others from acquiring the lock and potetially corrupting your state file.
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
Within the newly created bucket, create a folder named terrform6315
Once the Teraaform bucket and folder is created, use terminal to create a backend configuration to our main.tf file.

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
terraform {
  backend "gcs" {
  bucket = "terraform6315"
  prefix = "terraform1"
  credentials = "terraform-key.json"
  }
}
```
use terraform init, plan and apply to create the remote state in our google cloud storage and create the network as well.
```
terrafrom init, plan, apply
```
disregards any existing configuration
$ terraform init --reconfigure
```
Terraform apply
Terraform will perform the following actions:
```
Hamburger -> Storage -> Browser -> terraform6315 -> terraform1 -> default.tfstate
```
```
Understanding Terrafrom init (main.tf configuration file ) used to initialize your
working directory that contains your configuration files.
```
```
init can be used to bring any working directory up to speed on changes within the configuration.  by default, when running init, Terraform assumes you alread have
configuration files in the current directory.
```
```
Understanding Terraform 
Understanding terraform init
Understanding terraform plan
Understanding terraform apply
Understanding terraform output
```
```
Using Terrafrom Modules
Modules are packages of terrafrom configurations contained as a group. 
Use terrafrom init to download any modules thate are used in the config files.
```
```
Template - checkout main.tf
```
```
Template - checkout variables.tf
```
```
Creating Firewall Rules in GCP with Terraform - main.tf
```
```
