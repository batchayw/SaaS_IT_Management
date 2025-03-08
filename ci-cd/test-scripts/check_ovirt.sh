#!/bin/bash
echo "Testing oVirt..."
systemctl status ovirt-engine
if [ $? -eq 0 ]; then
  echo "oVirt is running."
else
  echo "oVirt is not running."
  exit 1
fi