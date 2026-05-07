# variables.tf for VCF 5.1 create cluster - last updated on 12-11-2023

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
############## Network Pool Configuration ###############
#########################################################

# Note as of the provider version 0.6.0 - If you are not creating a new network
# pool, you must provide the GUID from SDDC Manager. There is no current method from
# terraform to get that from code.  Feature enhancement filed, as there is no way to 
# get the ID automatically from TF has to be manually done. The ID is only needed when 
# not creating a NEW network pool. When creating a new one, it is available as terraform
# created the pool and already knows it.  This code assumes the network pool has already
# been added and thus you need the ID for the pool.

variable "wld_network_pool_id" { default = "82a031a2-205f-4cfb-aee5-1e3ffb311f97" }

#########################################################
############### ESXi Host Configuration #################
#########################################################

variable "esxi_host_list" {
	type = map(object({
	esxi_host_name = string
	esxi_host_password = string
	esxi_host_id = string
	esxi_host_vmnic0 = string
	esxi_host_vmnic1 = string
	}))
	default = {
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
		#		esxi_host_id = "<GUID for HOST>" ## not needed for hosts which are being newly added. If alredady commissioned fill this in.
		# 	 	esxi_host_vmnic0 = "<first nic id>"
		#  		esxi_host_vmnic1 = "<second nic id>"
		#		}
	}
}
#########################################################
############## Cluster WLD Configuration ################
#########################################################

variable "wld_id" { default = "3d53de24-747f-43b3-83ae-6807871ab1c4" }
variable "wld_nsx_geneve_vlan" { default = "2005" }
variable "wld_cl_name" { default = "pse-w01-dc01-cl02" }
variable "wld_cl_dvs_name" { default = "pse-w01-cl02-vds01" }
variable "wld_cl_dvs_pg_mgmt" { default = "pse-w01-cl02-vds01-pg-mgmt" }
variable "wld_cl_dvs_pg_vsan" { default = "pse-w01-cl02-vds01-pg-vsan" }
variable "wld_cl_dvs_pg_vmotion" { default = "pse-w01-cl01-vds02-pg-vmotion" }
variable "wld_cl_vsan_datastore_name" { default = "pse-w01-cl02-ds-vsan01" }
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