output "freeipa_ip" {
  value = openstack_compute_instance_v2.freeipa.access_ip_v4
}