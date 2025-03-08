#!/bin/bash
echo "Rolling back Foreman..."
systemctl stop foreman
yum remove -y foreman-installer