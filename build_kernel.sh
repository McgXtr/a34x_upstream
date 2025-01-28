#!/bin/bash

export CROSS_COMPILE=/home/xxxx/arm-gnu-toolchain-14.2.rel1-x86_64-aarch64-none-linux-gnu/bin/aarch64-none-linux-gnu-
export CC=/home/xxxx/clang-r383902/bin/clang
export CLANG_TRIPLE=aarch64-linux-gnu-
export ARCH=arm64
export ANDROID_MAJOR_VERSION=r
export PLATFORM_VERSION=14


export KCFLAGS=-w
export CONFIG_SECTION_MISMATCH_WARN_ONLY=y

make clean && make mrproper
make -C $(pwd) O=$(pwd)/out KCFLAGS=-w CONFIG_SECTION_MISMATCH_WARN_ONLY=y a34x_defconfig
make menuconfig
make -C $(pwd) O=$(pwd)/out KCFLAGS=-w CONFIG_SECTION_MISMATCH_WARN_ONLY=y -j$(nproc)

