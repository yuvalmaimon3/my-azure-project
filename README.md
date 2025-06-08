-Project Overview

This project automates the deployment and management of Azure resources using Terraform and ARM templates. The key components include Storage Accounts, Containers, Virtual Machine, and Pipeline Automation Process. Below is a breakdown of the implementation:

-1. Infrastructure Deployment (Terraform & ARM Templates)
Created two Storage Accounts, each containing a container.

Provisioned a Virtual network, Securitygroup and  Virtual Machine in Azure.

-2. Pipeline Setup & Execution
Configured a self-hosted agent on a local machine to run the Azure DevOps pipeline.

The pipeline performs the following tasks:

Deploys the infrastructure described above.

Generates 100 files and uploads them to container1 in storage account1.

Copies the files from container1 to container2 in storage account2.

Deletes the files from the agent after a successful transfer.

Update git

-3. State Management & Backup
Updates the GitHub repository in each pipleline run.

Stores the Terraform state file in GitHub, ensuring an additional backup.

-4. Monitoring & Dashboard
Created a dashboard to display storage usage, including the amount of space used and available in the containers.

* Additional Notes

To ensure unique Storage Account names, the Resource Group ID was used in the naming convention.

Use SAS keys to performe azcopy command, used to copy files from container1 to container2.

The script upload-and-copy-files.sh handles file uploads create and use the SAS credentials.

This automation improves efficiency by streamlining storage management, ensuring backup security, and providing real-time insights into resource usage.

Access to the machine allow only from my home IP and allow only with SSH key.

* Points for Improvement:

Separation of Virtual Network and Security Group creation into a separate ARM file from the Virtual Machine deployment ARM file, ensuring there are different ARM files for each Azure service.

Using variables in ARM templates enhances modularity and scalability for large and dynamic needs.

Add installation and login scripts to azure cli to ensure new agents will be able to run the pipeline.

![image](https://github.com/user-attachments/assets/0719783f-0565-4c43-9147-2e5513a71dd9)


![image](https://github.com/user-attachments/assets/69d69d29-6761-4730-a1dd-a426a267c28d)

