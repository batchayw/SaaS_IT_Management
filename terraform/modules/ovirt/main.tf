resource "openstack_compute_instance_v2" "ovirt_manager" {
  name            = "ovirt-manager"
  image_name      = "centos7"
  flavor_name     = "m1.medium"
  key_pair        = "my-key"
  security_groups = ["default"]

  network {
    name = "my-network"
  }
}

output "ovirt_manager_ip" {
  value = openstack_compute_instance_v2.ovirt_manager.access_ip_v4
}