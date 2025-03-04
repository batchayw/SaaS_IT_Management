#!/bin/bash
yum install -y prometheus grafana
systemctl start prometheus
systemctl enable prometheus
systemctl start grafana
systemctl enable grafana