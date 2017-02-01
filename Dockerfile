FROM ubuntu
RUN apt-get update
RUN apt-get install iputils-ping
COPY envconsul /usr/local/bin/envconsul
COPY runtest.sh /var/local/bin/runtest.sh
