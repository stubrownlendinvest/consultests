FROM nginx
COPY default.conf /etc/nginx/conf.d/default.conf
COPY envconsul /usr/local/bin/consul
CMD ls
CMD ./envconsul -consul 10.4.1.239:8500 -sanitize -prefix stu env
