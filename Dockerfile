FROM ubuntu
COPY envconsul /usr/local/bin/envconsul
COPY runtest.sh /var/local/runtest.sh
CMD chmod a+x /var/local/runtest.sh
CMD ['envconsul -consul 10.4.1.239:8500 -sanitize -prefix stu/one /var/local/runtest.sh']
WORKDIR /var/local

