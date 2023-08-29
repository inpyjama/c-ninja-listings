#
# Copyright © 2023 inpyjama.com. All Rights Reserved.
# Author: Piyush Itankar <piyush@inpyjama.com>
#

FROM ubuntu:latest

# PLEASE CHANGE THESE TO SUIT YOUR CONFIG
ARG USER_NAME="c-ninja"
ARG USER_PASSWORD="c"
ARG GIT_NAME="C Ninja"
ARG GIT_EMAIL="c@ninja.com"

ENV USER_NAME $USER_NAME
ENV USER_PASSWORD $USER_PASSWORD
ENV CONTAINER_IMAGE_VER=v1.0.0
ENV DEBIAN_FRONTEND=noninteractive

RUN adduser --quiet --disabled-password --shell /bin/zsh --home /home/$USER_NAME --gecos "User" $USER_NAME
RUN echo "${USER_NAME}:${USER_PASSWORD}" | chpasswd && usermod -aG sudo $USER_NAME
RUN adduser $USER_NAME sudo

RUN apt-get update
RUN apt-get install --no-install-recommends -y \
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
  strace

# user specific configuration
USER $USER_NAME

# terminal colors with xterm
ENV TERM xterm

RUN git config --global user.email "$GIT_EMAIL"
RUN git config --global user.name "$GIT_NAME"
