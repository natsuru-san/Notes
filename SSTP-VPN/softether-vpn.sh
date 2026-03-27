#!/bin/sh
cd /opt
mkdir vpn
cd vpn
wget https://github.com/SoftEtherVPN/SoftEtherVPN_Stable/releases/download/v4.44-9807-rtm/softether-vpnserver-v4.44-9807-rtm-2025.04.16-linux-x64-64bit.tar.gz
tar xzf softether-vpnserver-*.tar.gz
cd vpnserver
make
cd /opt
chown -R root:root vpn
chmod -R 755 vpn
setcap 'cap_net_bind_service=+ep' /opt/vpn/vpnserver/vpnserver

