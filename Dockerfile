# Build Stage
FROM ubuntu:20.04 as builder

## Install build dependencies.
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y cmake clang

## Add source code to the build stage.
ADD . /mayhem-cmake-example
WORKDIR /mayhem-cmake-example

## TODO: ADD YOUR BUILD INSTRUCTIONS HERE.
RUN mkdir build
WORKDIR build
<<<<<<< HEAD
RUN CC=clang CXX=clang++ cmake ..
=======
ENV CC=clang
ENV CXX=clang++
RUN cmake .. 
>>>>>>> b1971fec9d7009d91dc6c1c3ce0365d56525bdad
RUN make

# Package Stage
FROM ubuntu:20.04

## TODO: Change <Path in Builder Stage>
COPY --from=builder /mayhem-cmake-example/build/fuzzme /

