# Start from the latest Swift nightly main toolchain
FROM swiftlang/swift:nightly-6.2-jammy
USER root

ARG CMAKE_VERSION=3.29.9
ARG PICO_SDK_VERSION=2.1.1
ARG ARM_GNU_TOOLCHAIN_VERSION=14.3.rel1

RUN apt update
RUN apt -y install python3 git tar build-essential ninja-build wget

# CMAKE
RUN wget https://github.com/Kitware/CMake/releases/download/v${CMAKE_VERSION}/cmake-${CMAKE_VERSION}-linux-aarch64.tar.gz
RUN tar -xzf cmake-${CMAKE_VERSION}-linux-aarch64.tar.gz -C /opt
RUN rm cmake-${CMAKE_VERSION}-linux-aarch64.tar.gz

# PICO SDK
RUN git clone -b ${PICO_SDK_VERSION} https://github.com/raspberrypi/pico-sdk
RUN git -C pico-sdk submodule update --init --recursive

# ARM
RUN wget https://developer.arm.com/-/media/Files/downloads/gnu/${ARM_GNU_TOOLCHAIN_VERSION}/binrel/arm-gnu-toolchain-${ARM_GNU_TOOLCHAIN_VERSION}-aarch64-arm-none-eabi.tar.xz
RUN mkdir -p /arm-gnu-toolchain
RUN tar -xf arm-gnu-toolchain-${ARM_GNU_TOOLCHAIN_VERSION}-aarch64-arm-none-eabi.tar.xz -C /arm-gnu-toolchain
RUN rm arm-gnu-toolchain-${ARM_GNU_TOOLCHAIN_VERSION}-aarch64-arm-none-eabi.tar.xz

# ENV
ENV PICO_BOARD="pico_w"
ENV PICO_SDK_PATH="/pico-sdk"
ENV PICO_TOOLCHAIN_PATH="/arm-gnu-toolchain/arm-gnu-toolchain-${ARM_GNU_TOOLCHAIN_VERSION}-aarch64-arm-none-eabi"
ENV PATH="/opt/cmake-${CMAKE_VERSION}-linux-aarch64/bin:${PATH}"

ENTRYPOINT ["/bin/bash"]