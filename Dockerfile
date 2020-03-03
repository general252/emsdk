
FROM centos:7

RUN yum install -y gcc && \
    yum install -y gcc-c++
RUN yum install -y python && \
    yum install -y git && \
    yum install -y cmake
RUN git clone https://github.com/emscripten-core/emsdk.git

RUN cd emsdk
RUN /emsdk/emsdk install latest
RUN /emsdk/emsdk activate latest

WORKDIR /home

CMD python
