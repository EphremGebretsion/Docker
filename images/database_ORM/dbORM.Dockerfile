FROM ubuntu:latest
WORKDIR /root/
RUN apt update \
	&& apt install curl wget -y\
	&& apt install mysql-server -y\
	&& apt install sudo -y\
	&& apt install python3 -y \
	&& pip install SQLAlchemy
