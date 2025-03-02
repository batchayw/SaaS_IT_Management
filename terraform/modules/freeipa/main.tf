resource "openstack_compute_instance_v2" "freeipa" {
  name            = "freeipa"
  image_name      = "centos7"
  flavor_name     = "m1.small"
  key_pair        = "my-key"
  security_groups = ["default"]

  network {
    name = "my-network"
  }
}

output "freeipa_ip" {
  value = openstack_compute_instance_v2.freeipa.access_ip_v4
}