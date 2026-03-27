#!/bin/sh
apt update && apt upgrade && apt install build-essential wget socat ufw -y
ufw default deny incoming
ufw default allow outgoing
ufw allow 22
ufw allow 11443
ufw enable
