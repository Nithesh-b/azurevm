## Resource Group
resource_group_name       = "myResourceGroup1"
resource_group_location   = "East US"

# VNET
virtual_network_name      = "myVNet"
subnet_name               = "mySubnet"
subnet_address_prefix     = "10.0.1.0/24"

## VM
network_interface_name    = "myNIC"
vm_name                   = "myVM"
vm_size                   = "Standard_DS2_v2"
ssh_public_key_path       = "~/.ssh/my-ssh-key.pub"
private_ip_allocation     = "Dynamic"
name_prefix               = "dept1-dev"
environment               = "development"
owner                     = "John Doe"
project                   = "my_project"
admin_username            = "azureadmin"