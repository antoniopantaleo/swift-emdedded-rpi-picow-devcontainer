# Start from the latest Swift nightly main toolchain
FROM swiftlang/swift:nightly-6.2-jammy
USER root

ARG WIFI_SSID
ARG WIFI_PASSWORD
ARG PICOTOOL_VERSION=2.2.0
ARG PICO_BOARD=pico2_w
ARG CMAKE_VERSION=3.29.9
ARG PICO_SDK_VERSION=2.1.1
ARG ARM_GNU_TOOLCHAIN_VERSION=14.3.rel1

RUN apt update
RUN apt -y install python3 git tar build-essential ninja-build wget libusb-1.0-0-dev

# CMAKE
RUN wget https://github.com/Kitware/CMake/releases/download/v${CMAKE_VERSION}/cmake-${CMAKE_VERSION}-linux-aarch64.tar.gz
RUN tar -xzf cmake-${CMAKE_VERSION}-linux-aarch64.tar.gz -C /opt
RUN rm cmake-${CMAKE_VERSION}-linux-aarch64.tar.gz

# PICO SDK
RUN git clone -b ${PICO_SDK_VERSION} https://github.com/raspberrypi/pico-sdk
RUN git -C pico-sdk submodule update --init --recursive

# PICOTOOL
RUN wget https://github.com/raspberrypi/pico-sdk-tools/releases/download/v${PICOTOOL_VERSION}-0/picotool-${PICOTOOL_VERSION}-aarch64-lin.tar.gz
RUN mkdir -p /picotool
RUN tar -xf picotool-${PICOTOOL_VERSION}-aarch64-lin.tar.gz -C /picotool
RUN rm picotool-${PICOTOOL_VERSION}-aarch64-lin.tar.gz

# ARM
RUN wget https://developer.arm.com/-/media/Files/downloads/gnu/${ARM_GNU_TOOLCHAIN_VERSION}/binrel/arm-gnu-toolchain-${ARM_GNU_TOOLCHAIN_VERSION}-aarch64-arm-none-eabi.tar.xz
RUN mkdir -p /arm-gnu-toolchain
RUN tar -xf arm-gnu-toolchain-${ARM_GNU_TOOLCHAIN_VERSION}-aarch64-arm-none-eabi.tar.xz -C /arm-gnu-toolchain
RUN rm arm-gnu-toolchain-${ARM_GNU_TOOLCHAIN_VERSION}-aarch64-arm-none-eabi.tar.xz

# ENV
ENV WIFI_SSID=$WIFI_SSID
ENV WIFI_PASSWORD=$WIFI_PASSWORD
ENV PICO_BOARD=$PICO_BOARD
ENV picotool_DIR="/picotool/picotool"
ENV PICO_SDK_PATH="/pico-sdk"
ENV PICO_TOOLCHAIN_PATH="/arm-gnu-toolchain/arm-gnu-toolchain-${ARM_GNU_TOOLCHAIN_VERSION}-aarch64-arm-none-eabi"
ENV CMAKE_GENERATOR="Ninja"

ENV PATH="/opt/cmake-${CMAKE_VERSION}-linux-aarch64/bin:${PATH}"
ENV PATH="${picotool_DIR}:${PATH}"

ENTRYPOINT ["/bin/bash"]
