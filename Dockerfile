FROM debian:11.4
SHELL ["/bin/bash", "-c"]
RUN  apt-get update && apt-get upgrade -y && \
apt-get install postgresql-client  -y && \
apt-get install awscli -y && \
apt-get install curl -y && \
rm -rf /var/lib/apt/lists/*
ADD *.sh /
CMD ["bash", "daemon.sh"]