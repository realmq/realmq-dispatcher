upstream platform {
  server ${PLATFORM_HOST}:${PLATFORM_PORT};
}

upstream broker-websocket {
  server ${BROKER_HOST}:${BROKER_PORT};
}

upstream dashboard {
  server ${DASHBOARD_HOST}:${DASHBOARD_PORT};
}

server {
  listen 80 default_server;
  listen [::]:80 default_server;

  # Redirect all HTTP requests to HTTPS with a 301 Moved Permanently response.
  return 301 https://$host$request_uri;
}

server {
  listen 443 ssl http2 default_server;
  listen [::]:443 ssl http2 default_server;

  # certs sent to the client in SERVER HELLO are concatenated in ssl_certificate
  ssl_certificate ${TLS_CERT};
  ssl_certificate_key ${TLS_CERT_KEY};

  # verify chain of trust of OCSP response using Root CA and Intermediate certs
  ssl_trusted_certificate ${TLS_CERT_ROOT};

  # rest of ssl config
  include includes/ssl.conf;

  # redirect all traffic for unknown subdomains to main domain
  return 301 https://${TLD};
}

# api.${TLD}
server {
  listen 443 ssl http2;
  listen [::]:443 ssl http2;

  # certs sent to the client in SERVER HELLO are concatenated in ssl_certificate
  ssl_certificate ${TLS_CERT};
  ssl_certificate_key ${TLS_CERT_KEY};

  # verify chain of trust of OCSP response using Root CA and Intermediate certs
  ssl_trusted_certificate ${TLS_CERT_ROOT};

  # rest of ssl config
  include includes/ssl.conf;

  server_name api.${TLD};
  root /var/www;

  location / {
    proxy_pass http://platform;
    proxy_set_header Host            $host;
    proxy_set_header X-Forwarded-For $remote_addr;
  }
  location /broker {
    return 403;
  }
}

# dash.${TLD}
server {
  listen 443 ssl http2;
  listen [::]:443 ssl http2;

  # certs sent to the client in SERVER HELLO are concatenated in ssl_certificate
  ssl_certificate ${TLS_CERT};
  ssl_certificate_key ${TLS_CERT_KEY};

  # verify chain of trust of OCSP response using Root CA and Intermediate certs
  ssl_trusted_certificate ${TLS_CERT_ROOT};

  # rest of ssl config
  include includes/ssl.conf;

  server_name dash.${TLD};
  root /var/www;

  location / {
    proxy_pass http://dashboard;
    proxy_set_header Host            $host;
    proxy_set_header X-Forwarded-For $remote_addr;
  }
}

# rtm.${TLD}
server {
  listen 443 ssl http2;
  listen [::]:443 ssl http2;

  # certs sent to the client in SERVER HELLO are concatenated in ssl_certificate
  ssl_certificate ${TLS_CERT};
  ssl_certificate_key ${TLS_CERT_KEY};

  # verify chain of trust of OCSP response using Root CA and Intermediate certs
  ssl_trusted_certificate ${TLS_CERT_ROOT};

  # rest of ssl config
  include includes/ssl.conf;

  server_name rtm.${TLD};
  root /var/www;

  location /mqtt {
    proxy_pass http://broker-websocket/mqtt;
    proxy_http_version 1.1;
    proxy_set_header Upgrade $http_upgrade;
    proxy_set_header Connection "upgrade";
  }

  location / {
    return 301 https://${TLD};
  }
}
