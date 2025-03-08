#!/bin/bash
echo "Testing OpenStack..."
openstack server list
if [ $? -eq 0 ]; then
  echo "OpenStack is operational."
else
  echo "OpenStack is not operational."
  exit 1
fi