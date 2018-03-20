
upstream api {
  server api:8080;
}

upstream broker-websocket {
  server broker:8080;
}

server {
  listen 80 default_server;
  listen [::]:80 default_server;

  # Redirect all HTTP requests to HTTPS with a 301 Moved Permanently response.
  return 301 https://$host$request_uri;
}

server {
  listen 443 ssl http default_server;
  listen [::]:443 ssl http default_server;

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
  index index.html;
  root /usr/share/nginx/html/;

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
  location / {
    proxy_pass http://api;
    proxy_set_header Host            $host;
    proxy_set_header X-Forwarded-For $remote_addr;
  }
}
