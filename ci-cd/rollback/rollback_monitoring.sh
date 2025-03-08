#!/bin/bash
echo "Rolling back Monitoring..."
systemctl stop prometheus grafana
yum remove -y prometheus grafana