resource "openstack_compute_instance_v2" "openstack_controller" {
  name            = "openstack-controller"
  image_name      = "centos7"
  flavor_name     = "m1.large"
  key_pair        = "my-key"
  security_groups = ["default"]

  network {
    name = "my-network"
  }
}

output "openstack_controller_ip" {
  value = openstack_compute_instance_v2.openstack_controller.access_ip_v4
}