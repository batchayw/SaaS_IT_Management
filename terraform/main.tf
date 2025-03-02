provider "openstack" {
  user_name   = var.openstack_username
  tenant_name = var.openstack_tenant
  password    = var.openstack_password
  auth_url    = var.openstack_auth_url
}

module "freeipa" {
  source = "./modules/freeipa"
}

module "foreman_katello" {
  source = "./modules/foreman_katello"
}

module "openstack" {
  source = "./modules/openstack"
}

module "ovirt" {
  source = "./modules/ovirt"
}

module "okd" {
  source = "./modules/okd"
}