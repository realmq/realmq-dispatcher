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
}
