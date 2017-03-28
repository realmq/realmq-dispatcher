upstream api {
  server api:8080;
}

upstream broker-websocket {
  server broker:8080;
}

server {
  listen 80 default_server;
  sendfile off;
  resolver_timeout 5s;
  index index.html;
  root /usr/share/nginx/html/;
}

server {
  listen 443;

  server_name ${TLD};

  ssl on;
  ssl_certificate ${TLD_SSL_CERT};
  ssl_certificate_key ${TLD_SSL_CERT_KEY};

  index index.html;
  root /usr/share/nginx/html/;

  location /mqtt {
    proxy_pass http://broker-websocket/mqtt;
    proxy_http_version 1.1;
    proxy_set_header Upgrade $http_upgrade;
    proxy_set_header Connection "upgrade";
  }
}

server {
  listen 443;
  server_name api.${TLD};

  ssl on;
  ssl_certificate ${WILDCARD_SSL_CERT};
  ssl_certificate_key ${WILDCARD_SSL_CERT_KEY};

  location / {
    proxy_pass http://api;
    proxy_set_header Host            $host;
    proxy_set_header X-Forwarded-For $remote_addr;
  }
}
