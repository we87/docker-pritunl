#!/usr/bin/env bash

set -e

# Link with mongo
if [ ! -z "$MONGO_PORT_27017_TCP_ADDR" ]; then
  MONGO_URI="mongodb://${MONGO_PORT_27017_TCP_ADDR}:${MONGO_PORT_27017_TCP_PORT}/pritunl"
fi

# Set MONGO URI
if [ ! -z "$MONGO_URI" ]; then
  PRITNUL_SERVER_PORT=${PRITNUL_SERVER_PORT:-443}
  cat << EOF >/etc/pritunl.conf
{
    "mongodb_uri": "$MONGO_URI",
    "log_path": "/var/log/pritunl.log",
    "static_cache": true,
    "temp_path": "/tmp/pritunl_%r",
    "bind_addr": "0.0.0.0",
    "debug": false,
    "www_path": "/usr/share/pritunl/www",
    "local_address_interface": "auto",
    "port": ${PRITNUL_SERVER_PORT}
}
EOF
fi

# Set Server state
if [ ! -z "$PRITNUL_UUID" ]; then
  echo -n "$PRITNUL_UUID" >/var/lib/pritunl/pritunl.uuid
fi

if [ ! -z "$PRITNUL_SETUP_KEY" ]; then
  echo -n "$PRITNUL_SETUP_KEY" >/var/lib/pritunl/setup_key
fi

# Start
pritunl start
