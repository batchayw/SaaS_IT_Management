#!/bin/bash
yum install -y freeipa-server
ipa-server-install --domain=example.com --realm=EXAMPLE.COM --ds-password=password --admin-password=password --hostname=freeipa.example.com --setup-dns --no-forwarders --no-ntp --unattended
systemctl start ipa
systemctl enable ipa