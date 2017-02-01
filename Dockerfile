FROM ubuntu
COPY envconsul /usr/local/bin/envconsul
COPY runtest.sh /var/local/bin/runtest.sh
CMD chmod a+x /var/local/runtest.sh
ENTRYPOINT ["envconsul -consul 10.4.1.239:8500 -sanitize -prefix stu/one env"]
WORKDIR /var/local

