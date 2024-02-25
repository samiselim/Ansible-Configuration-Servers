 # Node.js Application Deployment on AWS with Ansible and Terraform

## Project Overview

This project revolves around the seamless deployment of a Node.js application on AWS instances using the powerful combination of Ansible and Terraform. The project encapsulates the synergy of infrastructure as code (Terraform), configuration management (Ansible), and the seamless deployment of a Node.js application.

## Project Highlights

### Infrastructure Setup with Terraform

Leveraging Terraform's capabilities, I crafted AWS instances to serve as a robust hosting environment for the Node.js application.

### Ansible Playbook Magic

The Ansible playbook, meticulously designed for this project, served as the conductor, orchestrating the installation and execution of the Node.js app on the AWS instances spawned by Terraform.

#### Plays in the Playbook

1. **Update apt and Install Node using npm:**
   - Ensure a primed environment for the Node.js app.

2. **Create a New User for Deployment:**
   - Craft a new user dedicated to the deployment and management of the application.

3. **Seamless Deployment Across AWS Instances:**
   - Orchestrate the deployment across two Ubuntu instances in AWS seamlessly.
