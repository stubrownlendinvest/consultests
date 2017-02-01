FROM ubuntu
RUN apt-get install ping
COPY envconsul /usr/local/bin/envconsul
COPY runtest.sh /var/local/bin/runtest.sh
