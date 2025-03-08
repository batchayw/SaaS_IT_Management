#!/bin/bash
echo "Testing OKD..."
oc get nodes
if [ $? -eq 0 ]; then
  echo "OKD is operational."
else
  echo "OKD is not operational."
  exit 1
fi