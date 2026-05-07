# variables.tf for VCF 5.1 host commission - last updated on 12-2-2023

#########################################################
############## Credentials Configuration ################
#########################################################

# This section contains details for the SDDC Manager configuration

##### SDDC Manager Credentials #####

variable "sddc_manager_host" { default = "sddc-manager-1.sddc.lab" }
variable "sddc_manager_username" { default = "administrator@vsphere.local" }
variable "sddc_manager_password" {
  default = "VMw@re1!1234"
  sensitive = true
}

variable "vcenter_root_password" {
  default = "VMw@re1!1234"
  sensitive = true
}

variable "nsx_manager_admin_password" {
  default = "VMw@re1!1234"
  sensitive = true
}
#########################################################
################## WLD Configuration ####################
#########################################################

variable "wld_name" { default = "pse-w01" }
variable "wld_storage_type" { default = "VSAN" }

# Note as of the provider version 0.6.0 - If you are not creating a new network
# pool, you must provide the GUID from SDDC Manager. There is no current method from
# terraform to get that from code.  Feature enhancement filed, as there is no way to 
# get the ID automatically from TF has to be manually done. The ID is only needed when 
# not creating a NEW network pool. When creating a new one, it is available as terraform
# created the pool and already knows it.  This work assumes the NP and the hosts are being
# added all at the same time.

variable "wld_network_pool_id" { default = "b2abe9ce-4868-473b-9982-1e7c90c2e886" }
variable "wld_network_pool_name" { default = "pse-w01-np01" }

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

variable "esxi_host_list" {
	type = map(object({
	esxi_host_name = string
	esxi_host_password = string
	esxi_host_id = string
	esxi_host_vmnic0 = string
	esxi_host_vmnic1 = string
	}))
	default = {
		host1 = {
		  esxi_host_name = "vcf-esxi-5.sddc.lab"
		  esxi_host_password = "VMw@re1!1234"
		  esxi_host_id = "d6c0fcf1-4266-4822-8a11-f30373aaa3f5"
		  esxi_host_vmnic0 = "vmnic0"
		  esxi_host_vmnic1 = "vmnic1"
		}
		host2 = {
		  esxi_host_name = "vcf-esxi-6.sddc.lab"
		  esxi_host_password = "VMw@re1!1234"
		  esxi_host_id = "2c5e1d7b-18f2-42fd-840d-3b8cb7227b68"
		  esxi_host_vmnic0 = "vmnic0"
		  esxi_host_vmnic1 = "vmnic1"
		},
		host3 = {
		  esxi_host_name = "vcf-esxi-7.sddc.lab"
		  esxi_host_password = "VMw@re1!1234"
		  esxi_host_id = "1e95d9be-a2e5-42f2-bf58-278b6e50912d"
		  esxi_host_vmnic0 = "vmnic0"
		  esxi_host_vmnic1 = "vmnic1"
		},
		host4 = {
		  esxi_host_name = "vcf-esxi-8.sddc.lab"
		  esxi_host_password = "VMw@re1!1234"
		  esxi_host_id = "db1dc16d-b7ae-4b70-bb97-0c499496422b"
		  esxi_host_vmnic0 = "vmnic0"
		  esxi_host_vmnic1 = "vmnic1"
		},
		host5 = {
		  esxi_host_name = "vcf-esxi-9.sddc.lab"
		  esxi_host_password = "VMw@re1!1234"
		  esxi_host_id = "69bc7362-9c83-4953-acdb-1b0a830df60b"
		  esxi_host_vmnic0 = "vmnic0"
		  esxi_host_vmnic1 = "vmnic1"
		},
		host6 = {
		  esxi_host_name = "vcf-esxi-10.sddc.lab"
		  esxi_host_password = "VMw@re1!1234"
		  esxi_host_id = "d1b3d2cae-d419-43a6-bb18-c4bd379dd71c"
		  esxi_host_vmnic0 = "vmnic0"
		  esxi_host_vmnic1 = "vmnic1"
		}
		# Add additional hosts as appropraite using the followwing syntax:
		#		hostX = {
		#		esxi_host_name = "<fqdn of host>"
		#		esxi_host_password = "<password for host>"
		#		esxi_host_id = "<GUID for HOST>"
		# 	 	esxi_host_vmnic0 = "<first nic id>"
		#  		esxi_host_vmnic1 = "<second nic id>"
		#		}
	}
}

#########################################################
################# vCenter  Configuration #################
#########################################################

variable "wld_vcenter_name" { default = "vc02" }
variable "wld_vcenter_vm_size" { default = "medium" }  ## One of xlarge,large, medium, small, tiny
variable "wld_vcenter_storage_size" { default = "lstorage" }  ## one of lstorage, xlstorage
variable "wld_vcenter_ip" { default = "10.0.0.30" }
variable "wld_vcenter_subnet_mask" { default = "255.255.255.0" }
variable "wld_vcenter_gw" { default = "10.0.0.1" }
variable "wld_vcenter_fqdn" { default = "vc02.sddc.lab" }

#########################################################
################## NSX Configuration ####################
#########################################################

variable "wld_nsx_vip_ip" { default = "10.0.0.31" }
variable "wld_nsx_vip_fqdn" { default = "nsx02.sddc.lab" }
variable "wld_nsx_vm_size" { default = "small" }  ## One of large, medium, small

variable "wld_nsx_ip1" { default = "10.0.0.32" }
variable "wld_nsx_subnet_mask1" { default = "255.255.255.0" }
variable "wld_nsx_gw1" { default = "10.0.0.1" }
variable "wld_nsx_fqdn1" { default = "nsx02a.sddc.lab" }
variable "wld_nsx_vm_name1" { default = "nsx02a" }

variable "wld_nsx_ip2" { default = "10.0.0.33" }
variable "wld_nsx_subnet_mask2" { default = "255.255.255.0" }
variable "wld_nsx_gw2" { default = "10.0.0.1" }
variable "wld_nsx_fqdn2" { default = "nsx02b.sddc.lab" }
variable "wld_nsx_vm_name2" { default = "nsx02b" }

variable "wld_nsx_ip3" { default = "10.0.0.34" }
variable "wld_nsx_subnet_mask3" { default = "255.255.255.0" }
variable "wld_nsx_gw3" { default = "10.0.0.1" }
variable "wld_nsx_fqdn3" { default = "nsx02c.sddc.lab" }
variable "wld_nsx_vm_name3" { default = "nsx02c" }

variable "wld_nsx_geneve_vlan" { default = "2005" }

#########################################################
############### Datacenter Configuration ################
#########################################################

variable "wld_datacenter_name" { default = "pse-w01-dc01" }
variable "wld_cl_name" { default = "pse-w01-dc01-cl01" }
variable "wld_cl_dvs_name" { default = "pse-w01-cl01-vds01" }
variable "wld_cl_dvs_pg_mgmt" { default = "pse-w01-cl01-vds01-pg-mgmt" }
variable "wld_cl_dvs_pg_vsan" { default = "pse-w01-cl01-vds01-pg-vsan" }
variable "wld_cl_dvs_pg_vmotion" { default = "pse-w01-cl01-vds01-pg-vmotion" }
variable "wld_cl_vsan_datastore_name" { default = "pse-w01-cl01-ds-vsan01" }
variable "wld_cl_vsan_ftt" { default = "1" }

variable "nsx_license_key" {
  default = "#####-#####-#####-#####-#####"
  sensitive = true
}
variable "vcenter_license_key" {
  default = "#####-#####-#####-#####-#####"
  sensitive = true
}
variable "vsan_license_key" {
  default = "#####-#####-#####-#####-#####"
  sensitive = true
}
variable "esx_license_key" {
  default = "#####-#####-#####-#####-#####"
  sensitive = true
}