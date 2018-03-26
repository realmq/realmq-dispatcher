FROM nginx:latest

LABEL \
  Description="RealMQ dispatcher" \
  Vendor="RealMQ" \
  Version="0.6.0"

COPY index.html /usr/share/nginx/html/index.html
COPY default.conf.tpl /etc/nginx/conf.d/default.conf.tpl
COPY ssl.conf /etc/nginx/includes/ssl.conf
COPY dhparam.pem /etc/nginx/dhparam.pem
COPY run.sh /run.sh

CMD ["/run.sh"]
