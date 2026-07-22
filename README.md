# Azure Container Registry Deployment using Terraform

# **Overview**
This Terraform configuration deploys an Azure Container Registry (ACR) in the West Europe region. The registry is configured using Azure best practices, including the use of the Premium SKU and disabling the admin account.

Following deployment, a Linux base image (Ubuntu 22.04) is imported into the registry using Azure Container Registry's native image import functionality.

# **Assumptions**
•	Azure subscription is available.
•	Tenant ID: 12345
•	Azure CLI is installed and authenticated.
•	Terraform 1.5 or later is installed.
•	Sufficient permissions exist to create Azure resources.

# **Resources Created**
•	Resource Group
•	Azure Container Registry (Premium SKU)

# **Project Structure**
.
├── provider.tf
├── variables.tf
├── main.tf
├── outputs.tf
└── README.md

# **Image Import**
The solution imports the Ubuntu 22.04 base image from Docker Hub into Azure Container Registry using:

az acr import \
--name <acr-name> \
--source docker.io/library/ubuntu:22.04 \
--image ubuntu:22.04

This approach was chosen because it allows Azure to pull the image directly from Docker Hub without requiring a local Docker daemon.

