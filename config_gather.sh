#!/bin/sh
# Required on some older containers
rm -f /etc/config/network

# Set up our fake device
rm /etc/board.d/99-default_network
cp /repo/tools/02_network.${1} /etc/board.d/02_network

# Actually generate the config
. /bin/config_generate
. /etc/init.d/boot
uci_apply_defaults

# Collect the config
cd /repo/${1}
cp /etc/config/* .
sed -i \
  -e "s/option dhcp_default_duid .*/option dhcp_default_duid '[expunged]'/" \
  -e "s/option ula_prefix .*/option ula_prefix '[expunged]'/" \
  network

# Collect version number and build date
pwd
cp -p /etc/os-release ..

# We will not be root outside the container. Make config readable by others.
chmod a+r *
