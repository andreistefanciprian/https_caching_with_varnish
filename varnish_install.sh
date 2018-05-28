#!/bin/bash

# Install Varnish on Centos 7

# Instal tools
sudo yum -y install net-tools
sudo yum -y install vim

# Disbale firewall
sudo systemctl disable firewalld
sudo systemctl stop firewalld
sudo systemctl status firewalld

# Install Varnish
sudo yum -y install varnish

# Configure Varnish to run after system reboot
sudo chkconfig varnish on
sudo systemctl enable varnish
sudo systemctl start varnish

# Disable Selinux to avoid 503 status code on https requests
# and reboot machine
sudo sed -i "s|SELINUX=enforcing|SELINUX=disabled|" /etc/sysconfig/selinux

# Configuration files /etc/sysconfig/varnish /etc/varnish/default.vcl /etc/varnish/varnish.params

# Varnish Statistics
varnishstat

# Varnish Interactive Logging
varnishlog

# Verify Varnish status
sudo systemctl status varnish

# Verify Varnish is running on configured ports
netstat -tapnl
