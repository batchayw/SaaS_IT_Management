#!/bin/bash
yum install -y docker openshift
systemctl start docker
systemctl enable docker
openshift-install create cluster --dir=/opt/okd