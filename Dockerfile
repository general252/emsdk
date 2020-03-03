
FROM ubuntu:16.04

RUN apt-get update
RUN apt-get install -y python && \
    apt-get install -y git && \
    apt-get install -y cmake

RUN apt-get install -y bzip2 xz-utils

RUN git clone https://github.com/emscripten-core/emsdk.git

RUN cd emsdk
RUN /emsdk/emsdk install latest
RUN /emsdk/emsdk activate latest
RUN /emsdk/emsdk construct_env

WORKDIR /home

CMD bash
