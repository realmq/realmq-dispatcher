#!/usr/bin/env bash

envsubst < /etc/nginx/conf.d/default.conf.tpl > /etc/nginx/conf.d/default.conf
nginx -g "daemon off;"
