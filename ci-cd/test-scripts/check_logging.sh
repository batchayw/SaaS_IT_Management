#!/bin/bash
echo "Testing Logging..."
systemctl status elasticsearch
systemctl status kibana
if [ $? -eq 0 ]; then
  echo "Logging stack is running."
else
  echo "Logging stack is not running."
  exit 1
fi