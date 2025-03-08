#!/bin/bash
echo "Testing FreeIPA..."
systemctl status ipa
if [ $? -eq 0 ]; then
  echo "FreeIPA is running."
else
  echo "FreeIPA is not running."
  exit 1
fi