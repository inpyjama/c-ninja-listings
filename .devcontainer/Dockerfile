#
# Copyright © 2023 inpyjama.com. All Rights Reserved.
# Author: Piyush Itankar <piyush@inpyjama.com>
#

FROM mcr.microsoft.com/vscode/devcontainers/base:ubuntu

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
  python3-pip \
  binutils \
  make \
  binutils-riscv64-linux-gnu \
  qemu-system-riscv32 \
  zsh \
  xxd \
  strace \
  man

RUN yes | unminimize

# install pygments package
RUN pip install pygments

RUN wget -P ~ https://git.io/.gdbinit

# terminal colors with xterm
ENV TERM xterm
