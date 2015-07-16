#!/bin/bash

# download
git clone https://github.com/CumulusNetworks/vxfld.git /opt/stack/vxfld
cd /opt/stack/vxfld

# install
python setup.py install

# run
vxsnd -c /opt/stack/vxfld/vxsnd.conf -d
