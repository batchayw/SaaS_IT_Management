#!/bin/bash
uptime
systemctl status ipa
systemctl status foreman
systemctl status openstack-*
systemctl status ovirt-engine
systemctl status prometheus
systemctl status grafana
systemctl status elasticsearch
systemctl status td-agent
systemctl status kibana