#
# Copyright © 2023 inpyjama.com. All Rights Reserved.
# Author: Piyush Itankar <piyush@inpyjama.com>
#

FROM ubuntu:latest

ENV USER_NAME $USER_NAME
ENV USER_PASSWORD $USER_PASSWORD
ENV CONTAINER_IMAGE_VER=v1.0.0
ENV DEBIAN_FRONTEND=noninteractive

RUN sudo apt-get update
RUN sudo apt-get install --no-install-recommends -y \
  ca-certificates \
  sudo \
  gdb-multiarch \
  gcc-riscv64-unknown-elf \
  binutils-common \
  make \
  curl \
  git-core \
  wget \
  nano \
  ssh \
  tree \
  less \
  build-essential \
  python3 \
  python3-dev \
  binutils \
  make \
  binutils-riscv64-linux-gnu \
  qemu-system-riscv32 \
  zsh \
  xxd \
  strace \
  man

RUN yes | unminimize

# terminal colors with xterm
ENV TERM xterm
