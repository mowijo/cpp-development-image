FROM alpine:3.16.2

RUN apk update
RUN apk add --no-cache \
	g++ \
	ninja \
	cmake \
	m4 \
	git \
	wget \
	autoconf \
	automake \
	libtool \
	zlib-dev \
	clang-extra-tools \
	bash \
	make \
	curl

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

RUN ldconfig /etc/ld.so.conf.d
