#main.tf for VCF 5.1 creating a WLD hosts - last updated on 12-4-2023

terraform {
  required_providers {
    vcf = {
      source = "vmware/vcf"
	  version = "0.6.0"
    }
  }
}
provider "vcf" {
  sddc_manager_host = var.sddc_manager_host
  sddc_manager_username = var.sddc_manager_username
  sddc_manager_password = var.sddc_manager_password
  allow_unverified_tls = true
}

# Note: as of provider 0.6.0 there is no bulk host import.
# Each hoat is added as an individual operation, which are 
# executed in parallel. I believe this means that there is
# a limit of 10 hosts at a time, but have not tested. If 
# this is the case we need to add a concurrent operations
# loop here.

resource "vcf_network_pool" "wld_np01" {
  name = var.wld_network_pool_name
  network {
    gateway = var.wld_network_pool_gw1
    mask = var.wld_network_pool_subnetmask1
    mtu = var.wld_network_pool_mtu1
    subnet = var.wld_network_pool_subnet1
    type = var.wld_network_pool_type1
    vlan_id = var.wld_network_pool_vlan1
    ip_pools {
      start = var.wld_network_pool_ip_start1
      end = var.wld_network_pool_ip_end1
    }
  }
  network {
    gateway = var.wld_network_pool_gw2
    mask = var.wld_network_pool_subnetmask2
    mtu = var.wld_network_pool_mtu2
    subnet = var.wld_network_pool_subnet2
    type = var.wld_network_pool_type2
    vlan_id = var.wld_network_pool_vlan2
    ip_pools {
      start = var.wld_network_pool_ip_start2
      end = var.wld_network_pool_ip_end2
    }
  }
}

resource "vcf_host" "host1" {
 fqdn = var.esxi_host_list.host1.esxi_host_name
  username = "root"
  password = var.esxi_host_list.host1.esxi_host_password
  network_pool_id = vcf_network_pool.wld_np01.id
  storage_type = "VSAN"
 }
resource "vcf_host" "host2" {
  fqdn = var.esxi_host_list.host2.esxi_host_name
  username = "root"
  password = var.esxi_host_list.host2.esxi_host_password
  network_pool_id = vcf_network_pool.wld_np01.id
  storage_type = "VSAN"
 }
resource "vcf_host" "host3" {
  fqdn = var.esxi_host_list.host3.esxi_host_name
  username  = "root"
  password  = var.esxi_host_list.host3.esxi_host_password
  network_pool_id = vcf_network_pool.wld_np01.id
  storage_type = "VSAN"
 }

resource "vcf_domain" "wld_1" {
  name = var.wld_name
  vcenter_configuration {
    name = var.wld_vcenter_name
    datacenter_name = var.wld_datacenter_name
    root_password = var.vcenter_root_password
    vm_size = var.wld_vcenter_vm_size
    storage_size = var.wld_vcenter_storage_size
    ip_address = var.wld_vcenter_ip
    subnet_mask = var.wld_vcenter_subnet_mask
    gateway = var.wld_vcenter_gw
    fqdn = var.wld_vcenter_fqdn
  }
  nsx_configuration {
    vip = var.wld_nsx_vip_ip
    vip_fqdn = var.wld_nsx_vip_fqdn
    nsx_manager_admin_password	= var.nsx_manager_admin_password
    form_factor = var.wld_nsx_vm_size
    license_key = var.nsx_license_key
    nsx_manager_node {
      name = var.wld_nsx_vm_name1
      ip_address = var.wld_nsx_ip1
      fqdn = var.wld_nsx_fqdn1
      subnet_mask = var.wld_nsx_subnet_mask1
      gateway = var.wld_nsx_gw1
    }
    nsx_manager_node {
      name = var.wld_nsx_vm_name2
      ip_address = var.wld_nsx_ip2
      fqdn = var.wld_nsx_fqdn2
      subnet_mask = var.wld_nsx_subnet_mask2
      gateway = var.wld_nsx_gw2
    }
    nsx_manager_node {
      name = var.wld_nsx_vm_name3
      ip_address = var.wld_nsx_ip3
      fqdn = var.wld_nsx_fqdn3
      subnet_mask = var.wld_nsx_subnet_mask3
      gateway = var.wld_nsx_gw3
    }
  }
  cluster {
    name = var.wld_cl_name
    host {
      id = vcf_host.host1.id
      license_key = var.esx_license_key
      vmnic {
        id = var.esxi_host_list.host1.esxi_host_vmnic0
        vds_name = var.wld_cl_dvs_name
      }
      vmnic {
        id = var.esxi_host_list.host1.esxi_host_vmnic1
        vds_name = var.wld_cl_dvs_name
      }
    }
    host {
      id = vcf_host.host2.id
      license_key = var.esx_license_key
      vmnic {
        id = var.esxi_host_list.host2.esxi_host_vmnic0
        vds_name = var.wld_cl_dvs_name
      }
      vmnic {
        id = var.esxi_host_list.host2.esxi_host_vmnic1
        vds_name = var.wld_cl_dvs_name
      }
    }
    host {
      id = vcf_host.host3.id
      license_key = var.esx_license_key
      vmnic {
        id = var.esxi_host_list.host3.esxi_host_vmnic0
        vds_name = var.wld_cl_dvs_name
      }
      vmnic {
        id = var.esxi_host_list.host3.esxi_host_vmnic1
        vds_name = var.wld_cl_dvs_name
      }
    }
    vds {
      name = var.wld_cl_dvs_name
      portgroup {
        name = var.wld_cl_dvs_pg_mgmt
        transport_type = "MANAGEMENT"
      }
      portgroup {
        name = var.wld_cl_dvs_pg_vsan
        transport_type = "VSAN"
      }
      portgroup {
        name = var.wld_cl_dvs_pg_vmotion
        transport_type = "VMOTION"
      }
    }
    vsan_datastore {
      datastore_name = var.wld_cl_vsan_datastore_name
      failures_to_tolerate = var.wld_cl_vsan_ftt
      license_key = var.vsan_license_key
    }
    geneve_vlan_id = var.wld_nsx_geneve_vlan
  }
}