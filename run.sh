#!/usr/bin/env bash

# ensure env params set
: ${TLD?} ${TLS_CERT?} ${TLS_CERT_KEY?}

set -a
# use defaults
: ${TLS_CERT_ROOT=$TLS_CERT}
: ${PLATFORM_HOST="platform"}
: ${PLATFORM_PORT="8080"}
: ${BROKER_HOST="broker"}
: ${BROKER_PORT="8080"}
set +a

envsubst '$TLD $TLS_CERT $TLS_CERT_KEY $TLS_CERT_ROOT $PLATFORM_HOST $PLATFORM_PORT $BROKER_HOST $BROKER_PORT' \
  < /etc/nginx/conf.d/default.conf.tpl \
  > /etc/nginx/conf.d/default.conf
nginx -g "daemon off;"
