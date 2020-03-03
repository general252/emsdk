
FROM ubuntu:16.04

RUN apt-get install -y python && \
    apt-get install -y git && \
    apt-get install -y cmake

RUN apt-get install -y bzip2

RUN git clone https://github.com/emscripten-core/emsdk.git

RUN cd emsdk
RUN /emsdk/emsdk install latest
RUN /emsdk/emsdk activate latest
RUN /emsdk/emsdk construct_env
RUN /emsdk/emsdk/emsdk_set_env.sh

WORKDIR /home

CMD bash
