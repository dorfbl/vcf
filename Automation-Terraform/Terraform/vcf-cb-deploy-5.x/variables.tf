# variables.tf for Cloud Builder Deployment - last updated on 12-1-2023

#########################################################
############vSphere Deployment Credentials ##############
#########################################################


variable vsphere_user { default = "administrator@vsphere.local" }
variable vsphere_password { default = "pseVMware1!" }

##########################################################
###########vSphere Infrastructure Details ################
##########################################################
 
variable "data_center" { default = "psoe-w01-DC" }
variable "cluster" { default = "psoe-wld-cl01" }
variable "vds" { default = "psoe-w01-psoe-w01-vc01-psoe-wld-cl01-vds01" }
variable "datastore" { default = "psoe-w01-psoe-w01-vc01-psoe-wld-cl01-vsan01" }
variable "compute_pool" { default = "psoe-wld-cl01" }
variable "compute_host" { default = "w4-hs3-i0717.eng.vmware.com" }
variable "vsphere_server" { default = "psoe-w01-vc01.eng.vmware.com" }
variable "resource_pool" { default = "JM-VCF-LAB" }

##########################################################
###############Cloud Biilder Details #####################
##########################################################

variable "cb_net" { default = "psoe-nsx-int04-vcf-main" }
variable "vm_name" { default = "cb.sddc.lab" }
variable "local_ovf_path" { default = "E:\\Terraform\\Binaries\\VMware-Cloud-Builder-5.1.0.0-22688368_OVF10.ova" }
#variable "local_ovf_path" { default = "E:\\Terraform\\binaries\\VMware-Cloud-Builder-5.0.0.0-21822418_OVF10.ova" }
variable "fips" { default = "False" }
variable "ip0" { default = "10.0.1.10" }
variable "netmask0" { default = "255.255.255.0" }
variable "gateway" { default = "10.0.1.1" }
variable "dns" { default = "10.0.1.2,10.0.1.3" }
variable "domain" { default = "sddc.lab" }
variable "ntp" { default = "10.0.1.2" }
variable "searchpath" { default = "sddc.lab" }
variable "ADMIN_PASSWORD" { default = "VMw@re1!1234" }
variable "ROOT_PASSWORD" { default = "VMw@re1!1234" }
variable "hostname" { default = "cb.sddc.lab" }