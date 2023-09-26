#
# Copyright © 2023 inpyjama.com. All Rights Reserved.
# Author: Piyush Itankar <piyush@inpyjama.com>
#

set -e

echo "#1: Flushing docker cache"
docker builder prune

echo "#2: Build a linux base image"
docker build -t c-ninja-linux_base .

echo "#3: Mapping current host directory to guest's ~/Documents/ directory"

docker run -h "c-ninja-linux" -t -d -P -v `realpath .`:/home/c-ninja/Documents/ --name c-ninja-linux c-ninja-linux_base

echo "#4: Setting zsh as the default terminal on guest"

docker exec -it c-ninja-linux /bin/bash -c 'echo "c" | sudo -S usermod -s /usr/bin/zsh c-ninja'

USER_SHELL=bash

echo "#5: Populating the .bashrc file of the host with c-ninja alias"
echo "alias c-ninja=\"docker start c-ninja-linux; docker exec -it c-ninja-linux /bin/zsh -c 'cd /home/c-ninja/Documents/; zsh -i'\"" >> ~/.${USER_SHELL}rc

echo "#6: Sourcing local .bashrc file"
source ~/.${USER_SHELL}rc

echo "Setup Complete! Use the following two commands to login to the guest machine!"
echo "bash"
echo "c-ninja"
