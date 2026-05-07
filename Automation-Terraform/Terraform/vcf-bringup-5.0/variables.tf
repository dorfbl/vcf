# variables.tf for VCF 5.0 Bringup - last updated on 12-1-2023

#########################################################
################ USERNAMES AND PASSWORDS ################
#########################################################

# This section contains details for the required usernames and passwords that are used for the bringup process.

##### Cloud Builder Usernames and Passwords #####

variable "cloud_builder_username" { default = "admin" }
variable "cloud_builder_password" {
	default = "VMw@re1!1234"
	sensitive = true
}

##### SDDC Manager Passwords #####

variable "sddc_manager_root_user_password" {
  default = "VMw@re1!1234"
  sensitive = true
}
variable "sddc_manager_vcf_user_password" {
  default = "VMw@re1!1234"
  sensitive = true
}

##### vCenter Server Passwords #####

variable "vcenter_root_password" {
  default = "VMw@re1!1234"
  sensitive = true
}
variable "psc_admin_password" {
  default = "VMw@re1!1234"
  sensitive = true
}

##### NSX Passwords #####

variable "nsx_manager_admin_password" {
  default = "VMw@re1!1234!"
  sensitive = true
}
variable "nsx_manager_audit_password" {
  default = "VMw@re1!1234"
  sensitive = true
}

variable "nsx_manager_root_password" {
  default = "VMw@re1!1234"
  sensitive = true
}

##### ESXi Host Passwords #####

variable "esxi_host1_pass" {
  default = "VMw@re1!1234"
  sensitive = true
}
variable "esxi_host2_pass" {
  default = "VMw@re1!1234"
  sensitive = true
}
variable "esxi_host3_pass" {
  default = "VMw@re1!1234"
  sensitive = true
}

variable "esxi_host4_pass" {
  default = "VMw@re1!1234"
  sensitive = true
}
#########################################################
#################### LICENSE KEYS #######################
#########################################################
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

#########################################################
################# Network Configuration #################
#########################################################


##### MANAGEMENT Network Details #####

variable "management_subnet" { default = "10.0.2.0/24" }
variable "management_gw" { default = "10.0.2.1" }
variable "management_vlan" { default = "2002" }
variable "management_mtu" { default = "1500" }
variable "management_portgroup" { default = "pse-m01-dv01-pg-mgmt" }

##### VMOTION Network Details #####

variable "vmotion_subnet" { default = "10.0.3.0/24" }
variable "vmotion_gw" { default = "10.0.3.1" }
variable "vmotion_vlan" { default = "2003" }
variable "vmotion_mtu" { default = "8000" }
variable "vmotion_portgroup" { default = "pse-m01-dv01-pg-vmotion" }
variable "vmotion_ip_range_start" { default = "10.0.3.101" }
variable "vmotion_ip_range_end" { default = "10.0.3.200" }

##### vSAN Network Details #####

variable "vsan_subnet" { default = "10.0.4.0/24" }
variable "vsan_gw" { default = "10.0.4.1" }
variable "vsan_vlan" { default = "2004" }
variable "vsan_mtu" { default = "8000" }
variable "vsan_portgroup" { default = "pse-m01-dv01-pg-vsan" }
variable "vsan_ip_range_start" { default = "10.0.4.101" }
variable "vsan_ip_range_end" { default = "10.0.4.200" }

##### NSX HOST OVERLAY Network Details #####
# Note: At this time, DHCP is the only supported option in the Terraform API for the NSX 
#       Host Overlay. Static Pool configration will be added as soon as it is available.

variable "nsx_host_overlay_vlan" { default = "2005" }
variable "nsx_overlay_tz_name" { default = "pse-m01-overlay-tz" }
variable "nsx_overlay_network" { default = "pse-m01-overlay" }

########################################################################
################ Sizing, DNS, IP, and NTP Configuration ################
########################################################################

##### Cloud Builder #####

variable "cloud_builder_host" {
# Note:  Please specify the full DNS name for the appliance here, or the IP address.
  default = "cb.sddc.lab"
}

##### Environmental DNS #####

variable "domain_suffix" { default = "sddc.lab" }
variable "dns1" { default = "10.0.1.2" }
variable "dns2" { default = "10.0.1.3" }
variable "ntp1" { default = "10.0.1.2" }
#variable "ntp2" { default = "10.0.1.3" }

##### vCenter Server #####

variable "vcenter_size" { default = "tiny" }
variable "vcenter_name" { default = "vc01" }
variable "vcenter_ip" { default = "10.0.2.10" }


##### NSX #####

variable "nsx_manager_size" { default = "medium" }
variable "nsx_manager_name_vip" { default = "nsx01" }
variable "nsx_manager_ip_vip" { default = "10.0.2.11" }
variable "nsx_manager_name1" { default = "nsx01a" }
variable "nsx_manager_ip1" { default = "10.0.2.12" }
variable "nsx_manager_name2" { default = "nsx01b" }
variable "nsx_manager_ip2" { default = "10.0.2.13" }
variable "nsx_manager_name3" { default = "nsx01c" }
variable "nsx_manager_ip3" { default = "10.0.2.14" }

##### SDDC Manager #####

variable "sddc_manager_name" { default = "sddc-manager-1" }
variable "sddc_manager_ip" { default = "10.0.2.5" }

##### ESXi Hosts #####

##### ESXi Host 1 #####
variable "esxi_name1" { default = "vcf-esxi-1" }
variable "esxi_ip1" { default = "10.0.2.101" }
variable "esxi_subnet1" { default = "255.255.255.0" }
variable "esxi_gw1" { default = "10.0.2.1" }

##### ESXi Host 2 #####
variable "esxi_name2" { default = "vcf-esxi-2" }
variable "esxi_ip2" { default = "10.0.2.102" }
variable "esxi_subnet2" { default = "255.255.255.0" }
variable "esxi_gw2" { default = "10.0.2.1" }

##### ESXi Host 3 #####
variable "esxi_name3" { default = "vcf-esxi-3" }
variable "esxi_ip3" { default = "10.0.2.103" }
variable "esxi_subnet3" { default = "255.255.255.0" }
variable "esxi_gw3" { default = "10.0.2.1" }

##### ESXi Host 4 #####
variable "esxi_name4" { default = "vcf-esxi-4" }
variable "esxi_ip4" { default = "10.0.2.104" }
variable "esxi_subnet4" { default = "255.255.255.0" }
variable "esxi_gw4" { default = "10.0.2.1" }

##############################################################
################ Other Configuration Elements ################
##############################################################

##### SDDC Manager #####
variable "sddc_instance_id" { default = "pse-m01" }
variable "mgmt_network_pool_name" { default = "pse-m01-np01" }

##### vCenter #####
variable "psc_domain" { default = "vsphere.local" }
variable "vc_datacenter_name" { default = "pse-m01-dc01" }
variable "vc_cluster_name" { default = "pse-m01-dc01-cl01" }
variable "dvs_name" { default = "pse-m01-dv01" }
variable "dvs_ver" { default = "7.0.3" }
variable "dvs_mtu" { default = "8000" }

##### ESXi Host Global #####
variable "esxi_standard_switch_name" { default = "vSwitch0" }
variable "esxi_ceip_enabled" { default = "false" }

##### vSAN #####
variable "vsan_datastore_name" { default = "pse-m01-cl01-ds-vsan01" }

##### Resource Pools #####
variable "mgmt_respool" { default = "pse-m01-dc01-cl01-rp-mgmt" }
variable "net_respool" { default = "pse-m01-dc01-cl01-rp-net" }
variable "compute_respool" { default = "pse-m01-dc01-cl01-rp-compute" }
variable "user_respool" { default = "pse-m01-dc01-cl01-rp-user" }