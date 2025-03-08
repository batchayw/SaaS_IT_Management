# Outputs for oVirt module
output "ovirt_manager_ip" {
  value = openstack_compute_instance_v2.ovirt_manager.access_ip_v4
}