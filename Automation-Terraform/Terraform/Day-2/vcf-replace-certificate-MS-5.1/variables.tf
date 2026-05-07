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
############## Microsoft CA Configuration ###############
#########################################################

variable "microsoft_ca_server" {  default = "https://dc01.sddc.lab/certsrv"  }
variable "microsoft_ca_user" { default = "administrator" }
variable "microsoft_ca_password" {
  default = "VMware1!"
  sensitive = true
}
variable "microsoft_ca_template" { default = "vmware" }