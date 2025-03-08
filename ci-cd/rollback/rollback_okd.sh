#!/bin/bash
echo "Rolling back OKD..."
oc cluster down
yum remove -y openshift