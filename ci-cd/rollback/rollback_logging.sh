#!/bin/bash
echo "Rolling back Logging..."
systemctl stop elasticsearch kibana
yum remove -y elasticsearch kibana