FROM debian:bookworm

RUN apt-get update
RUN apt-get install -y\
    build-essential \
    cmake \
    git \
    autotools-dev \
    automake libtool \
    m4 \
    libssl-dev\ 
    wget\
    zlib1g-dev\
    ninja-build \
    clang-format

RUN ( \
    cd /tmp && \
    git clone --depth 1 --branch release-1.12.1 https://github.com/google/googletest.git && \
    cd googletest && \
    mkdir build && \
    cd build && \ 
    cmake -GNinja .. && \
    ninja && \
    ninja install && \
    rm -rf /tmp/googletest \
)

RUN ldconfig
