#!/bin/bash
yum install -y openstack-tripleo
openstack undercloud install
systemctl start openstack-*
systemctl enable openstack-*