# GKE Cluster and Voting app

Before start you need configure your workspace

## 0 - Setup

### Configure git

```sh
# Git config - replace email and username with your info
git config --global user.email "example@gmail.com"
git config --global user.name "Example"

# Fork to you github space
https://github.com/yolitals/terraform-aprovisionamiento-gcp-gke-cluster-and-app-deploy.git

# Clone the repository
git clone https://github.com/[GITHUB-USER]/terraform-aprovisionamiento-gcp-gke-cluster-and-app-deploy.git
# Replace [GITHUB-USER] with your github user (Ensure it have been forked).


# Move to cloned repository
cd terraform-aprovisionamiento-gcp-gke-cluster-and-app-deploy

```

### Login into Google Cloud Platform

Acquire new user credentials to use for Application Default Credentials

```sh
gcloud auth application-default login
```

Above command will return an URL, follow it to login with your google credentials, once login is completed it return a code, copy it and paste in the terminal where you execute gcloud command.

## 1 - GCP project

Create a GCP project and enable container service

```sh
# Move to database directory
cd 1-terraform-gc-project
# Get plugins and modules
terraform init
# Dry run to validate resources to create
terraform plan
# expected output:
# Plan: 5 to add, 0 to change, 0 to destroy.
# Create resouces
terraform apply
# If you want destroy resouces
terraform destroy
```

## 2 - GKE Cluster

Create a GKE cluster with public endpoint

```sh
# Move to backend directory
cd 2-terraform-gcp-gke
# Get plugins and modules
terraform init
# Dry run to validate resources to create
terraform plan
# expected output:
# Plan: 1 to add, 0 to change, 0 to destroy.
# Create resouces
terraform apply
# If you want destroy resouces
terraform destroy
```

## 3 - Deploy voting app

Deploy all required k8s manifest to deploy voting app

```sh
# Move to frontend directory
cd 3-terraform-gcp-k8s-manifests
# Get plugins and modules
terraform init
# Dry run to validate resources to create
terraform plan
# expected output:
# Plan: 9 to add, 0 to change, 0 to destroy.
# Create resouces
terraform apply
# If you want destroy resouces
terraform destroy
```

## 4 - Deploy complete stack once

Terraform manifests contains modules blocks to create a project and a GKE cluster plus resources to deploy same voting app trough k8s manifests

```sh
# Move to backend directory
cd 4-project-gke-cluster-stack
# Get plugins and modules
terraform init
# Dry run to validate resources to create
terraform plan
# expected output:
# Plan: 15 to add, 0 to change, 0 to destroy.
# Create resouces
terraform apply
# If you want destroy resouces
terraform destroy
```
