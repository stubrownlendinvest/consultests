FROM ubuntu
COPY envconsul /usr/local/bin/envconsul
COPY runtest.sh /var/local/bin/runtest.sh
CMD chmod a+x /var/local/runtest.sh

