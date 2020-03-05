
FROM ubuntu:16.04

RUN apt-get update && \
    apt-get install -y python && \
    apt-get install -y git && \
    apt-get install -y cmake && \
    apt-get install -y bzip2 xz-utils && \
    apt-get clean && \
    git clone https://github.com/emscripten-core/emsdk.git

RUN /emsdk/emsdk install  latest && \
    /emsdk/emsdk activate latest

RUN echo "source /emsdk/emsdk_env.sh" >> /root/.bashrc && \
    echo '#include <stdio.h>' > /home/hello.c && \
    echo 'int main(int argc, char ** argv) {' >> /home/hello.c && \
    echo '    printf("Hello, world!\\n");' >> /home/hello.c && \
    echo '    return 0;' >> /home/hello.c && \
    echo '}' >> /home/hello.c && \
    echo 'emcc hello.c -s WASM=1 -o hello.html' > /home/build.sh
    
CMD bash
