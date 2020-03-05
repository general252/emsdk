
FROM ubuntu:16.04

RUN apt-get update
RUN apt-get install -y python && \
    apt-get install -y git && \
    apt-get install -y cmake && \
    apt-get install -y bzip2 xz-utils && \
    apt-get clean

RUN git clone https://github.com/emscripten-core/emsdk.git

RUN cd emsdk
RUN /emsdk/emsdk install latest
RUN /emsdk/emsdk activate latest

WORKDIR /home

# source /emsdk/emsdk_env.sh
CMD bash
