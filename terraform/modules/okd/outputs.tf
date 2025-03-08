# Outputs for OKD module
output "okd_master_ip" {
  value = openstack_compute_instance_v2.okd_master.access_ip_v4
}