#!/bin/bash

apt-get install -y git python-setuptools
mkdir /opt/stack
git clone https://github.com/openstack-dev/devstack.git /opt/stack/devstack
cd /opt/stack/devstack && git checkout stable/juno
cp /vagrant/compute_local.conf /opt/stack/devstack/local.conf
ipaddress=$(ip addr show eth0 | grep 'inet ' | awk '{print $2}' | cut -d'/' -f1)
sed -i "s/HOST_IP=x.x.x.x/HOST_IP=$ipaddress/" /opt/stack/devstack/local.conf
ssh-keygen -f /home/dhc-user/.ssh/id_rsa -N ""
