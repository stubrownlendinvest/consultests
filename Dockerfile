FROM ubuntu
RUN apt-get update -y
RUN apt-get install iputils-ping -y
COPY envconsul /usr/local/bin/envconsul
COPY runtest.sh /var/local/bin/runtest.sh
