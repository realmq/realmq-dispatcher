FROM nginx:latest

COPY index.html /usr/share/nginx/html/index.html
COPY default.conf.tpl /etc/nginx/conf.d/default.conf.tpl
COPY run.sh /run.sh

CMD ["/run.sh"]