
FROM centos:latest

RUN apt-get install -y gcc && \
	apt-get install -y gcc-c++ && \
	apt-get install -y groupinstall development  && \
	apt-get install -y autoconf automake libtool  && \
	apt-get install -y python && \
	apt-get install -y git && \
	apt-get install -y cmake && \
	cd /home && \
	git clone https://github.com/emscripten-core/emsdk.git

RUN cd /home/emsdk && \
	./emsdk install latest && \
    ./emsdk activate latest && \
    ./emsdk construct_env && \
    echo ". /emsdk/emsdk_set_env.sh" >> ~/.bashrc && \
    . ~/.bashrc && \
    em++ --version


WORKDIR /home/emsdk

CMD python
