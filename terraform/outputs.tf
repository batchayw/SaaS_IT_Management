output "freeipa_ip" {
  value = module.freeipa.freeipa_ip
}

output "foreman_ip" {
  value = module.foreman_katello.foreman_ip
}

output "openstack_controller_ip" {
  value = module.openstack.openstack_controller_ip
}

output "ovirt_manager_ip" {
  value = module.ovirt.ovirt_manager_ip
}

output "okd_master_ip" {
  value = module.okd.okd_master_ip
}