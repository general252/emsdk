
FROM centos:latest

RUN apt-get install -y gcc && \
    apt-get install -y gcc-c++ && \
    apt-get install -y groupinstall development  && \
    apt-get install -y autoconf automake libtool
RUN apt-get install -y python && \
    apt-get install -y git && \
    apt-get install -y cmake
RUN cd /home && \
    git clone https://github.com/emscripten-core/emsdk.git

RUN cd /home/emsdk
RUN ./emsdk install latest
RUN ./emsdk activate latest
RUN ./emsdk construct_env
RUN echo ". /emsdk/emsdk_set_env.sh" >> ~/.bashrc && . ~/.bashrc
RUN em++ --version


WORKDIR /home/emsdk

CMD python
