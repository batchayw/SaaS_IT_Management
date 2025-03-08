#!/bin/bash
echo "Rolling back oVirt..."
systemctl stop ovirt-engine
yum remove -y ovirt-engine