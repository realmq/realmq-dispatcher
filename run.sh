#!/usr/bin/env bash

# ensure env params set
: ${TLD?} ${TLS_CERT?} ${TLS_CERT_KEY?}

set -a
# use defaults
: ${TLS_CERT_ROOT=$TLS_CERT}
set +a

envsubst '$TLD $TLS_CERT $TLS_CERT_KEY $TLS_CERT_ROOT' \
  < /etc/nginx/conf.d/default.conf.tpl \
  > /etc/nginx/conf.d/default.conf
nginx -g "daemon off;"
