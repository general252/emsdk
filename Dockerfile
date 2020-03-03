
FROM centos:latest

RUN yum install -y gcc && \
    yum install -y gcc-c++ && \
    yum install -y groupinstall development  && \
    yum install -y autoconf automake libtool
RUN yum install -y python && \
    yum install -y git && \
    yum install -y cmake
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
