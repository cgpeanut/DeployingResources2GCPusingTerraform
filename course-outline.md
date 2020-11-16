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
```
    Enabling APIs
    Setting Up Remote State in Cloud Storage
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
    Defining your network varibles 
    Creating firewall and associated rules 
    Defining public and private subnets
    Hand on lab: Using Terrafomr to Create a New VPC and Public Subnet in GCP
```
Chapter 7: Using Terraform to create Create Computer Engine Instances
    Defining your instance variables 
    setting up startup script
    Hands on lab: Using Terraform to lunch a Compute Emgine Instance in GCP
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



