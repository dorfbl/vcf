# variables.tf for VCF 5.1 host commission - last updated on 12-2-2023

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
################ ESXi Host Configuration ################
#########################################################

variable "wld_storage_type" { default = "VSAN" }

# Note as of the provider version 0.6.0 - this value is not the name but the ID.  
# Feature enhancement filed, as there is no way to get the ID automatically from 
# TF has to be manually done. https://github.com/vmware/terraform-provider-vcf/issues/91

variable "wld_network_pool_name" { default = "b2abe9ce-4868-473b-9982-1e7c90c2e886" }

variable "esxi_host_list" {
	type = map(object({
	esxi_host_name = string
	esxi_host_password = string
	}))
	default = {
		host1 = {
		  esxi_host_name = "vcf-esxi-5.sddc.lab"
		  esxi_host_password = "VMw@re1!1234"
		}
		host2 = {
		  esxi_host_name = "vcf-esxi-6.sddc.lab"
		  esxi_host_password = "VMw@re1!1234"
		},
		host3 = {
		  esxi_host_name = "vcf-esxi-7.sddc.lab"
		  esxi_host_password = "VMw@re1!1234"
		},
		host4 = {
		  esxi_host_name = "vcf-esxi-8.sddc.lab"
		  esxi_host_password = "VMw@re1!1234"
		},
		host5 = {
		  esxi_host_name = "vcf-esxi-9.sddc.lab"
		  esxi_host_password = "VMw@re1!1234"
		},
		host6 = {
		  esxi_host_name = "vcf-esxi-10.sddc.lab"
		  esxi_host_password = "VMw@re1!1234"
		}
		# Add additional hosts as appropraite using the followwing syntax:
		#		hostX = {
		#		esxi_host_name = "<fqdn of host>"
		#		esxi_host_password = "<password for host>"
		#		}
	}
}
