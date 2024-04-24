FROM ubuntu:22.04
WORKDIR /opt
RUN apt update \
	&& apt install ssh -y \
	&& apt install vim -y \
	&& apt install wget -y \
	&& apt install zlib1g zlib1g-dev -y \
	&& apt install libssl-dev libffi-dev openssl make gcc -y \
	&& wget https://www.python.org/ftp/python/3.8.10/Python-3.8.10.tgz \
	&& tar xzvf Python-3.8.10.tgz
WORKDIR /opt/Python-3.8.10
RUN ./configure
RUN make
RUN make install
RUN wget https://bootstrap.pypa.io/get-pip.py \
	&& apt-get install build-essential libpython3-dev -y
RUN python3.8 get-pip.py
RUN pip3 install pyparsing \
	&& pip3 install appdirs \
	&& pip3 install setuptools==40.1.0 \
	&& pip3 install cryptography==2.8 \
	&& pip3 install bcrypt==3.1.7 \
	&& pip3 install PyNaCl==1.3.0 \
	&& pip3 install Fabric3==1.14.post1
RUN rm /opt/Python-3.8.10.tgz
WORKDIR /root
