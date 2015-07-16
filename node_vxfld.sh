#!/bin/bash

# download
git clone https://github.com/CumulusNetworks/vxfld.git /opt/stack/vxfld
cd /opt/stack/vxfld

# install
python setup.py install

# configure
sed -i 's/#local_addr/local_addr/' /opt/stack/vxfld/vxrd.conf

# run
vxrd -c /opt/stack/vxfld/vxrd.conf -d
