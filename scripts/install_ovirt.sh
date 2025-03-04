#!/bin/bash
yum install -y ovirt-engine
engine-setup --accept-defaults
systemctl start ovirt-engine
systemctl enable ovirt-engine