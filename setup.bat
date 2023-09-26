
@REM Copyright © 2023 inpyjama.com. All Rights Reserved.
@REM Author: Rajat Batra <rajat@inpyjama.com>
@echo off

set -e

echo "#1: Flushing docker cache"
docker builder prune -a -f

echo "#2: Build a linux base image"
docker build -t c-ninja-linux_base .

echo "#3: Mapping current host directory to guest's ~/Documents/ directory"

docker run -h "c-ninja-linux" -t -d -P -v "%cd%":/home/c-ninja/Documents/ --name c-ninja-linux c-ninja-linux_base

echo "#4: Setting zsh as the default terminal on guest"

docker exec -it c-ninja-linux sh -c "echo \"c\" | sudo -S usermod -s /usr/bin/zsh c-ninja"

echo "#5: Populating the .bashrc file of the host with c-ninja alias"
echo  echo off > c-ninja.bat
echo  docker start c-ninja-linux >> c-ninja.bat
echo  docker exec -it c-ninja-linux /bin/zsh -c "cd /home/c-ninja/Documents; zsh -i" >> c-ninja.bat

echo "Setup Complete! Run the c-ninja batch file to start the container"
