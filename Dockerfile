FROM nginx:latest

LABEL Description="Greenfield dispatcher" Vendor="GFCC" Version="0.3.0"

COPY index.html /usr/share/nginx/html/index.html
COPY default.conf.tpl /etc/nginx/conf.d/default.conf.tpl
COPY run.sh /run.sh

CMD ["/run.sh"]