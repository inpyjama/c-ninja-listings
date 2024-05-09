#
# Copyright © 2023 inpyjama.com. All Rights Reserved.
# Author: Piyush Itankar <piyush@inpyjama.com>
#

FROM ubuntu:latest

# PLEASE CHANGE THESE TO SUIT YOUR CONFIG
ARG USER_NAME="guest_new"
ARG USER_PASSWORD="ghost"
ARG GIT_NAME="vibraniumSwaleh"
ARG GIT_EMAIL="hus.swaleh@yahoo.com"

ENV USER_NAME $USER_NAME
ENV USER_PASSWORD $USER_PASSWORD
ENV CONTAINER_IMAGE_VER=v1.0.0
ENV DEBIAN_FRONTEND=noninteractive

# RUN adduser --quiet --disabled-password --shell /bin/zsh --home /home/$USER_NAME --gecos "User" $USER_NAME -> command failed in my system [win 11], used the one below [line 20]
RUN useradd -m -s /bin/zsh -c "User" $USER_NAME 
  #[ RUN useradd --quiet --home /home/$USER_NAME --create-home --shell /bin/zsh --comment "User" $USER_NAME ] -> above command [line 20] with all options as adduser [line 19]

RUN echo "${USER_NAME}:${USER_PASSWORD}" | chpasswd && usermod -aG sudo $USER_NAME
# RUN adduser $USER_NAME sudo -> command failed in my system [win 11], used the one below [line 25]
RUN usermod -aG sudo $USER_NAME

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
  strace \
  man

RUN yes | unminimize

# user specific configuration
USER $USER_NAME

# terminal colors with xterm
ENV TERM xterm

RUN git config --global user.email "$GIT_EMAIL"
RUN git config --global user.name "$GIT_NAME"
