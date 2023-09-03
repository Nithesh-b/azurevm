To configure the Azure Blob Storage manually before running `terraform init` and use it as the backend for your Terraform configuration, you can follow these steps:

1. **Create an Azure Storage Account:**

   - Log in to the Azure portal (https://portal.azure.com/).
   - Click on "Create a resource."
   - Search for "Storage account" and select it.
   - Click the "Create" button to start configuring the storage account.
   - Provide the required information, such as the subscription, resource group (e.g., "myResourceGroup"), storage account name (e.g., "abijithjithu"), location, and performance options. Review and configure additional settings as needed.
   - Click "Review + create" and then "Create" to create the storage account.

2. **Create a Blob Container:**

   - After the storage account is created, navigate to the storage account in the Azure portal.
   - In the left-hand menu, under "Settings," click on "Containers."
   - Click the "+ Container" button to create a new container. Give it a name (e.g., "tfstate") and configure the access level (e.g., "Private" or "Blob" depending on your security requirements).
   - Click "Create" to create the container.

3. **Configure Access Keys or SAS Token (Optional):**

   - Depending on your desired level of security, you can configure access keys or generate a Shared Access Signature (SAS) token for your storage account to grant access to Terraform.
   - To use access keys, go to the "Access keys" section under "Settings" in your storage account and copy either of the two keys (Key1 or Key2).
   - To generate a SAS token, navigate to the "Shared access signature" section under "Settings" in your storage account. Configure the desired permissions and expiration date to generate the SAS token.

4. **Update the Backend Configuration in Your Terraform Configuration:**

   - In your Terraform configuration (e.g., `main.tf`), specify the backend configuration as you've already shown in your question:

     ```hcl
     terraform {
       backend "azurerm" {
         resource_group_name   = "myResourceGroup"
         storage_account_name  = "abijithjithu"
         container_name        = "tfstate"
         key                   = "terraform.tfstate"
       }
     }
     ```

     Make sure to replace `"myResourceGroup"`, `"abijithjithu"`, `"tfstate"`, and `"terraform.tfstate"` with the actual values you used when configuring your Azure Blob Storage.

5. **Initialize Terraform:**

   - Open your terminal and navigate to the directory containing your Terraform configuration files.
   - Run the following commands to initialize Terraform and configure the backend:

     ```bash
     terraform init
     ```

6. **Complete Other Terraform Configuration:**

   - After successfully initializing Terraform, you can continue with the rest of your Terraform configuration by defining resources and variables, and then running `terraform plan` and `terraform apply` as needed.

By following these steps, you will have manually configured the Azure Blob Storage backend for your Terraform configuration and can securely store your Terraform state files in the designated container.


Then the Keypair needs to be configured using this command
ssh-keygen -t rsa -b 2048 -f my-ssh-key -C "balakrishnannithesh@gmail.com"



## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >= 2.0, < 3.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | >= 2.0, < 3.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_linux_virtual_machine.example](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine) | resource |
| [azurerm_network_interface.example](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_interface) | resource |
| [azurerm_resource_group.example](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |
| [azurerm_storage_container.example](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_container) | resource |
| [azurerm_subnet.example](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet) | resource |
| [azurerm_virtual_network.example](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network) | resource |
| [azurerm_storage_account.existing](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/storage_account) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_admin_username"></a> [admin\_username](#input\_admin\_username) | The admin username for the virtual machine | `string` | n/a | yes |
| <a name="input_network_interface_name"></a> [network\_interface\_name](#input\_network\_interface\_name) | Name of the Azure network interface | `string` | n/a | yes |
| <a name="input_private_ip_allocation"></a> [private\_ip\_allocation](#input\_private\_ip\_allocation) | Private IP address allocation method | `string` | `"Dynamic"` | no |
| <a name="input_resource_group_location"></a> [resource\_group\_location](#input\_resource\_group\_location) | Location for the Azure Resource Group | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Name of the Azure Resource Group | `string` | n/a | yes |
| <a name="input_ssh_public_key_path"></a> [ssh\_public\_key\_path](#input\_ssh\_public\_key\_path) | Path to your SSH public key file | `string` | n/a | yes |
| <a name="input_subnet_address_prefix"></a> [subnet\_address\_prefix](#input\_subnet\_address\_prefix) | Address prefix for the Azure subnet | `string` | n/a | yes |
| <a name="input_subnet_name"></a> [subnet\_name](#input\_subnet\_name) | Name of the Azure subnet | `string` | n/a | yes |
| <a name="input_virtual_network_name"></a> [virtual\_network\_name](#input\_virtual\_network\_name) | Name of the Azure virtual network | `string` | n/a | yes |
| <a name="input_vm_name"></a> [vm\_name](#input\_vm\_name) | Name of the Azure virtual machine | `string` | n/a | yes |
| <a name="input_vm_size"></a> [vm\_size](#input\_vm\_size) | Size of the Azure virtual machine | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_vm_private_ip"></a> [vm\_private\_ip](#output\_vm\_private\_ip) | Private IP address of the Azure Linux Virtual Machine |
| <a name="output_vm_public_ip"></a> [vm\_public\_ip](#output\_vm\_public\_ip) | Public IP address of the Azure Linux Virtual Machine |
