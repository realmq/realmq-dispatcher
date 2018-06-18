FROM nginx:latest

LABEL \
  Description="RealMQ dispatcher" \
  Vendor="RealMQ" \
  Version="0.7.0"

COPY default.conf.tpl /etc/nginx/conf.d/default.conf.tpl
COPY ssl.conf /etc/nginx/includes/ssl.conf
COPY dhparam.pem /etc/nginx/dhparam.pem
COPY run.sh /run.sh

CMD ["/run.sh"]
