#!/bin/bash
echo "Testing Security..."
firewall-cmd --list-all
if [ $? -eq 0 ]; then
  echo "Security policies are applied."
else
  echo "Security policies are not applied."
  exit 1
fi