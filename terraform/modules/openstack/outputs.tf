# Outputs for OpenStack module
output "openstack_controller_ip" {
  value = openstack_compute_instance_v2.openstack_controller.access_ip_v4
}