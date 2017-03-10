#!/usr/bin/env bash

envsubst '$TLD $TLD_SSL_CERT $TLD_SSL_CERT_KEY $TLD_SSL_CERT_ROOT $WILDCARD_SSL_CERT $WILDCARD_SSL_CERT_KEY $WILDCARD_SSL_CERT_ROOT' < /etc/nginx/conf.d/default.conf.tpl > /etc/nginx/conf.d/default.conf
nginx -g "daemon off;"
