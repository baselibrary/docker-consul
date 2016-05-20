#!/bin/bash

#enable job control in script
set -e
set -o pipefail

#####   variables  #####
VPN_TYPE=${VPN_TYPE:=openvpn}

#run sslvpn in background
if [[ $# -lt 1 ]] || [[ "$1" == "-"* ]]; then
	## check the required parameters
	if [ -z "$VPN_TYPE" -o -z "$VPN_HOST" -o -z "$VPN_PORT" -o -z "$VPN_USER" ]; then
		echo >&2 'Error: vpn option is not specified'
		exit 1
	fi
  ##### run scripts  #####
  echo "========================================================================"
  echo "startup: run expect                                                     "
  echo "========================================================================"
  confd -backend=rancher --prefix=/2015-07-25 
 
  exec consul agent -config-file=/etc/consul/config/server.json
else
  exec "$@"
fi
