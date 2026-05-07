#main.tf for VCF 5.0 Bringup - last updated on 12-1-2023.

terraform {
  required_providers {
    vcf = {
      source = "vmware/vcf"
	  version = "0.6.0"
    }
  }
}
provider "vcf" {
  cloud_builder_host = var.cloud_builder_host
  cloud_builder_username = var.cloud_builder_username
  cloud_builder_password = var.cloud_builder_password
  allow_unverified_tls = true
}

resource "vcf_instance" "sddc_1" {
  instance_id = var.sddc_instance_id
  dv_switch_version = var.dvs_ver
  skip_esx_thumbprint_validation = true
  management_pool_name = var.mgmt_network_pool_name
  ceip_enabled = var.esxi_ceip_enabled
  esx_license = var.esx_license_key
  task_name = "workflowconfig/workflowspec-ems.json"
  sddc_manager {
    ip_address = var.sddc_manager_ip
    hostname = var.sddc_manager_name
    root_user_credentials {
      username = "root"
      password = var.sddc_manager_root_user_password
    }
    second_user_credentials {
      username = "vcf"
      password = var.sddc_manager_vcf_user_password
    }
  }
  ntp_servers = [ 
	var.ntp1, 
#	var.ntp2
  ]
  
  dns {
    domain = var.domain_suffix
    name_server = var.dns1
    secondary_name_server = var.dns2
  }
  network {
    subnet = var.management_subnet
    vlan_id = var.management_vlan
    mtu = var.management_mtu
    network_type = "MANAGEMENT"
    gateway = var.management_gw
	port_group_key = var.management_portgroup
  }
  network {
    subnet = var.vmotion_subnet
    include_ip_address_ranges {
      start_ip_address = var.vmotion_ip_range_start
      end_ip_address = var.vmotion_ip_range_end
    }
    vlan_id = var.vmotion_vlan
    mtu = var.vmotion_mtu
    network_type = "VMOTION"
    gateway = var.vmotion_gw
	port_group_key = var.vmotion_portgroup
  }
    network {
    subnet = var.vsan_subnet
    include_ip_address_ranges {
      start_ip_address = var.vsan_ip_range_start
      end_ip_address = var.vsan_ip_range_end
    }
    vlan_id = var.vsan_vlan
    mtu = var.vsan_mtu
    network_type = "VSAN"
    gateway = var.vsan_gw
	port_group_key = var.vsan_portgroup
  }
  
  nsx {
    nsx_manager_size = var.nsx_manager_size
    nsx_manager {
      hostname = var.nsx_manager_name1
      ip = var.nsx_manager_ip1
    }
	nsx_manager {
      hostname = var.nsx_manager_name2
      ip = var.nsx_manager_ip2
    }
	nsx_manager {
      hostname = var.nsx_manager_name3
      ip = var.nsx_manager_ip3
    }
    root_nsx_manager_password = var.nsx_manager_root_password
    nsx_admin_password = var.nsx_manager_admin_password
    nsx_audit_password = var.nsx_manager_audit_password
    overlay_transport_zone {
      zone_name = var.nsx_overlay_tz_name
      network_name = var.nsx_overlay_network
    }
    vip = var.nsx_manager_ip_vip
    vip_fqdn = var.nsx_manager_name_vip
    license = var.nsx_license_key
    transport_vlan_id = var.nsx_host_overlay_vlan
  }
  vsan {
    license = var.vsan_license_key
    datastore_name = var.vsan_datastore_name
  }
  dvs {
    mtu = var.dvs_mtu
    dvs_name = var.dvs_name
    vmnics = [
      "vmnic0",
      "vmnic1"
    ]
    networks = [
      "MANAGEMENT",
      "VSAN",
      "VMOTION"
    ]
    nioc {
      traffic_type = "VSAN"
      value = "HIGH"
    }
    nioc {
      traffic_type = "VMOTION"
      value = "LOW"
    }
    nioc {
      traffic_type = "VDP"
      value = "LOW"
    }
    nioc {
      traffic_type = "VIRTUALMACHINE"
      value = "HIGH"
    }
    nioc {
      traffic_type = "MANAGEMENT"
      value = "NORMAL"
    }
    nioc {
      traffic_type = "NFS"
      value = "LOW"
    }
    nioc {
      traffic_type = "HBR"
      value = "LOW"
    }
    nioc {
      traffic_type = "FAULTTOLERANCE"
      value = "LOW"
    }
    nioc {
      traffic_type = "ISCSI"
      value = "LOW"
    }
  }
  cluster {
    cluster_name = var.vc_cluster_name
    cluster_evc_mode = ""
    resource_pool {
      name = var.mgmt_respool
      type = "management"
    }
    resource_pool {
      name = var.net_respool
      type = "network"
    }
    resource_pool {
      name = var.compute_respool
      type = "compute"
    }
    resource_pool {
      name = var.user_respool
      type = "compute"
    }
  }
  psc {
    psc_sso_domain = var.psc_domain
    admin_user_sso_password = var.psc_admin_password
  }
  vcenter {
    vcenter_ip = var.vcenter_ip
    vcenter_hostname = var.vcenter_name
    license = var.vcenter_license_key
    root_vcenter_password = var.vcenter_root_password
    vm_size = var.vcenter_size
  }
  host {
    credentials {
      username = "root"
      password = var.esxi_host1_pass
    }
    ip_address_private {
      subnet = var.esxi_subnet1
      cidr = ""
      ip_address = var.esxi_ip1
      gateway = var.esxi_gw1
    }
    hostname = var.esxi_name1
    vswitch = var.esxi_standard_switch_name
    association = var.vc_datacenter_name
  }
  host {
    credentials {
      username = "root"
      password = var.esxi_host2_pass
    }
    ip_address_private {
      subnet = var.esxi_subnet2
      cidr = ""
      ip_address = var.esxi_ip2
      gateway = var.esxi_gw2
    }
    hostname = var.esxi_name2
    vswitch = var.esxi_standard_switch_name
    association = var.vc_datacenter_name
  }
  host {
    credentials {
      username = "root"
      password = var.esxi_host3_pass
    }
    ip_address_private {
      subnet = var.esxi_subnet3
      cidr = ""
      ip_address = var.esxi_ip3
      gateway = var.esxi_gw3
    }
    hostname = var.esxi_name3
    vswitch = var.esxi_standard_switch_name
    association = var.vc_datacenter_name
  }
  host {
    credentials {
      username = "root"
      password = var.esxi_host4_pass
    }
    ip_address_private {
      subnet = var.esxi_subnet4
      cidr = ""
      ip_address = var.esxi_ip4
      gateway = var.esxi_gw4
    }
    hostname = var.esxi_name4
    vswitch = var.esxi_standard_switch_name
    association = var.vc_datacenter_name
  }
}