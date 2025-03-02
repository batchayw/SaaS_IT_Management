resource "openstack_compute_instance_v2" "foreman" {
  name            = "foreman"
  image_name      = "centos7"
  flavor_name     = "m1.medium"
  key_pair        = "my-key"
  security_groups = ["default"]

  network {
    name = "my-network"
  }
}

output "foreman_ip" {
  value = openstack_compute_instance_v2.foreman.access_ip_v4
}