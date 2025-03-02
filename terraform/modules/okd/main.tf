resource "openstack_compute_instance_v2" "okd_master" {
  name            = "okd-master"
  image_name      = "centos7"
  flavor_name     = "m1.large"
  key_pair        = "my-key"
  security_groups = ["default"]

  network {
    name = "my-network"
  }
}

output "okd_master_ip" {
  value = openstack_compute_instance_v2.okd_master.access_ip_v4
}