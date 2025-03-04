#!/bin/bash
yum install -y elasticsearch td-agent kibana
systemctl start elasticsearch
systemctl enable elasticsearch
systemctl start td-agent
systemctl enable td-agent
systemctl start kibana
systemctl enable kibana