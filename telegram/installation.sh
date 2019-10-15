#!/bin/bash

echo "|----------------------------------------------------------------------------> Update"
sudo apt-get update -y

echo "|----------------------------------------------------------------------------> Upgrade"
sudo apt-get upgrade -y

echo "|----------------------------------------------------------------------------> Install libreadline-dev 1/20"
sudo apt-get install libreadline-dev -y

echo "|----------------------------------------------------------------------------> Install libconfig-dev 2/20"
sudo apt-get install libconfig-dev -y

echo "|----------------------------------------------------------------------------> Install libssl-dev 3/20"
sudo apt-get install libssl-dev -y

echo "|----------------------------------------------------------------------------> Install lua5.2 4/20"
sudo apt-get install lua5.2 -y

echo "|----------------------------------------------------------------------------> Install liblua5.2-dev 5/20"
sudo apt-get install liblua5.2-dev -y

echo "|----------------------------------------------------------------------------> Install libevent-dev 6/20"
sudo apt-get install libevent-dev -y

echo "|----------------------------------------------------------------------------> Install libjansson-dev 7/20"
sudo apt-get install libjansson-dev -y

echo "|----------------------------------------------------------------------------> Install libpython-dev 8/20"
sudo apt-get install libpython-dev -y

echo "|----------------------------------------------------------------------------> Install make 9/20"
sudo apt-get install make -y

echo "|----------------------------------------------------------------------------> Install  git 10/20"
sudo apt-get install  git git-core -y

echo "|----------------------------------------------------------------------------> Install openssl 11/20"
sudo apt-get install openssl -y

echo "|----------------------------------------------------------------------------> Install gcc-c++ 12/20"
sudo apt-get install gcc -y

echo "|----------------------------------------------------------------------------> Install ruby 13/20"
sudo apt install ruby -y

echo "|----------------------------------------------------------------------------> Install jq 14/20"
sudo apt-get install jq -y

echo "|----------------------------------------------------------------------------> Install git 15/20"
sudo apt-get install git git-core -y

echo "|----------------------------------------------------------------------------> Install python-pip 16/20"
sudo apt install python-pip -y

echo "|----------------------------------------------------------------------------> Install upgrade pip 17/20"
sudo pip install --upgrade pip

echo "|----------------------------------------------------------------------------> Install Flask 18/20"
sudo pip install Flask

echo "|----------------------------------------------------------------------------> Install emoji --upgrade 19/20"
sudo pip install emoji --upgrade

echo "|----------------------------------------------------------------------------> Install webp 20/20"
sudo apt install webp -y

unzip Telegram_Machine_Learning.zip && rm Telegram_Machine_Learning.zip && cd Telegram_Machine_Learning

cd ~/Telegram-History-Dump/telegram/Telegram_Machine_Learning
./configure
make

