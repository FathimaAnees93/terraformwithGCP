Creating a Google Cloud VM with Terraform

Prerequisites:
Before you can start creating resources with Terraform on Google Cloud, there are several prerequisites to set up.
Step 1: Accessing Google Cloud Console
       1.Open your web browser and go to https://console.cloud.google.com/
       2.Sign in to your GCP account.
Step 2: Creating a New Project (Optional)
      1. If you don’t have a project yet, click on the project drop-down menu at the top of the page.
      2. Click on “New Project” and enter a name for your project.
      3. Click “Create” to create the new project.

Step 3: Navigating to Compute Engine
     1. In the GCP Console, click on the hamburger menu (☰) at the top-left corner.
     2. Under the “Compute” section, select “IAM &Admin.”
     3. Click on the Service Accounts+*-

Step 4: Create the service account.
    1. Click on Cerate Service account.
    2. ForService account name, enter a name for the service account.
    3. (Optional) ForService account description, enter a description of the service account.
    4. ClickCreate and Continue.
    5. Click Done /Save.
    6. Click on the manage keys from from the created account.
    7. At the top, click eysAdd Keys create new key.
    8. Make sure the key type is set to JSON and click create.
      You'll get a message that the service account's private key JSON file was downloaded to your computer. Make a note of the file name and where your browser saves it. You'll need it later.
      9. Click Close.
Step 5: Project Structure
       Start by creating a directory for your Terraform project. This directory will contain all your Terraform files and configurations. You can name it something like “TERRAFORMGCP”.
      TERRAFORMGCP
         main.tf
         provider.tf
        keys.json(download file from gcloud) 
  Step 6: Write the provider.tf file
        1. Goto the link https://registry.terraform.io/providers/hashicorp/google/latest/docs
        2. Click on the use provider and copy the peice of the code.
        3. Paste the code in the provider.tf  file in vs code.

Project in the code is the project ID of the project created in the GCP.
 Credentials are the file which got download from keys creation in GCP and added json file in the project.
Step 7: Write the main.tf file
        1. Goto the link https://registry.terraform.io/providers/hashicorp/google/latest/docs
        2. Serach for compute_instance
        3. Copy the code which is required.
        4. Paste the code in the main.tf and make changes accoding to the project and reuseable
  resource "google_compute_instance" "terraform-GCP" {
  name         = "my-vm-instance"
  machine_type = "n1-standard-1"
  zone         = "us-central1-a"

   boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
      labels = {
        my_label = "value"
      }
    }
    }

  network_interface {
    network = "default"
    access_config {
      // Ephemeral IP
    }
  }
}

you define the Google Compute Engine instance, which is your virtual machine.
name: You provide a name for your VM instance, in this case, "my-vm-instance."
machine_type: Specifies the machine type you want to use for the VM. "n1-standard-1" is a predefined machine type with 1 vCPU and 3.75 GB of memory.
zone: Indicates the specific GCP zone where you want to create the VM, in this case, "us-central1-a."
boot_disk: You set up the boot disk for the VM, specifying the image to use. In this example, you're using a Debian 10 image.
network_interface: Defines the network configuration for the VM. You link it to the VPC network and subnetwork you previously created. Additionally, you can configure access settings, such as ephemeral IP addresses.

Step 8: Initialize and Apply
Run terraform init in your project directory to initialize Terraform and download any necessary providers.
Run terraform plan command creates an execution plan 
Run terraform apply to create the resources defined in your configuration.

Step 9: Review and Confirm
Terraform will show you a plan of what it intends to do. Review the plan, and if everything looks correct, confirm the changes by typing “yes” when prompted.
You can continue with additional steps or configurations, such as adding firewall rules, custom metadata, or startup scripts, depending on the usecase.
