FROM ubuntu
COPY envconsul /usr/local/bin/envconsul
RUN envconsul -consul 10.4.1.239:8500 -sanitize -prefix stu env

