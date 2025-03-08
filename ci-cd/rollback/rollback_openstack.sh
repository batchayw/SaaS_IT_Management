#!/bin/bash
echo "Rolling back OpenStack..."
systemctl stop openstack-*
yum remove -y openstack-tripleo