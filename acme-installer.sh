#!/bin/bash
DOMAIN="%domain_name%"
SERVER_PW="%vpn_cli_admin_password%"
EMAIL="%mail%"
curl https://get.acme.sh | sh -s email=$EMAIL
ACME="/root/.acme.sh/acme.sh"

$ACME --issue -d $DOMAIN --standalone \
--server letsencrypt \
--pre-hook "ufw allow 80/tcp" \
--post-hook "ufw delete allow 80/tcp"

mkdir -p /opt/vpn/vpnserver/certs
$ACME --install-cert -d $DOMAIN \
--cert-file /opt/vpn/vpnserver/certs/server.crt \
--key-file /opt/vpn/vpnserver/certs/server.key \
--fullchain-file /opt/vpn/vpnserver/certs/fullchain.cer \
--reloadcmd "/opt/vpn/vpnserver/vpncmd /server localhost:11443 /password:$SERVER_PW /cmd ServerCertSet /LOADCERT:/opt/vpn/vpnserver/certs/fullchain.cer /LOADKEY:/opt/vpn/vpnserver/certs/server.key"
