#!/bin/bash
echo "Testing Monitoring..."
systemctl status prometheus
systemctl status grafana
if [ $? -eq 0 ]; then
  echo "Monitoring stack is running."
else
  echo "Monitoring stack is not running."
  exit 1
fi