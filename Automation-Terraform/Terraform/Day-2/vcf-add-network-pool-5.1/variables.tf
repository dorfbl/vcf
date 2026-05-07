# variables.tf for VCF 5.1 network pool create - last updated on 12-11-2023

#########################################################
############## SDDC Manager Configuration ###############
#########################################################

# This section contains details for the SDDC Manager configuration

##### SDDC Manager Credentials #####

variable "sddc_manager_host" { default = "sddc-manager-1.sddc.lab" }
variable "sddc_manager_username" { default = "administrator@vsphere.local" }
variable "sddc_manager_password" {
  default = "VMw@re1!1234"
  sensitive = true
}

#########################################################
################ Network Pool Configuration ################
#########################################################


variable "wld_network_pool_name" { default = "pse-w01-np02" }

# Network assignments for pool
# Network 1 - Storage

variable "wld_network_pool_gw1" { default = "10.1.4.1" }
variable "wld_network_pool_subnetmask1" { default = "255.255.255.0" }
variable "wld_network_pool_mtu1" { default = "8000" }
variable "wld_network_pool_subnet1" { default = "10.1.4.0" }
variable "wld_network_pool_type1" { default = "VSAN" }
variable "wld_network_pool_vlan1" { default = "2104" }
variable "wld_network_pool_ip_start1" { default = "10.1.4.101" }
variable "wld_network_pool_ip_end1" { default = "10.1.4.200" }

# Network assignments for pool
# Network 2 - vMotion

variable "wld_network_pool_gw2" { default = "10.1.3.1" }
variable "wld_network_pool_subnetmask2" { default = "255.255.255.0" }
variable "wld_network_pool_mtu2" { default = "8000" }
variable "wld_network_pool_subnet2" { default = "10.1.3.0" }
variable "wld_network_pool_type2" { default = "vMotion" }
variable "wld_network_pool_vlan2" { default = "2103" }
variable "wld_network_pool_ip_start2" { default = "10.1.3.101" }
variable "wld_network_pool_ip_end2" { default = "10.1.3.200" }