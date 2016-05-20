#!/bin/bash

#enable job control in script
set -e
set -o pipefail

#####   variables  #####
VPN_TYPE=${VPN_TYPE:=openvpn}

#run sslvpn in background
if [[ $# -lt 1 ]] || [[ "$1" == "-"* ]]; then
	## check the required parameters
	
  ##### run scripts  #####
  echo "========================================================================"
  echo "startup: run expect                                                     "
  echo "========================================================================"
  confd -backend=rancher --prefix=/2015-07-25 
 
  exec consul agent -config-file=/etc/consul/server.json
else
  exec "$@"
fi
