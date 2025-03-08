#!/bin/bash
echo "Rolling back FreeIPA..."
systemctl stop ipa
yum remove -y freeipa-server