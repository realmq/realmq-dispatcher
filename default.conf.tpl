server {
  listen 80 default_server;
  sendfile off;
  resolver_timeout 5s;
  index index.html;
  root /usr/share/nginx/html/;
}
