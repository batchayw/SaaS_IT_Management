#!/bin/bash
echo "Testing Foreman..."
systemctl status foreman
if [ $? -eq 0 ]; then
  echo "Foreman is running."
else
  echo "Foreman is not running."
  exit 1
fi