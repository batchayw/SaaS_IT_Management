# Outputs for Foreman/Katello module
output "foreman_ip" {
  value = openstack_compute_instance_v2.foreman.access_ip_v4
}