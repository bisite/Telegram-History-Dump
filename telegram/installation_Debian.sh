#!/bin/bash

echo "|----------------------------------------------------------------------------> Update"
sudo apt-get update -y

echo "|----------------------------------------------------------------------------> Upgrade"
sudo apt-get upgrade -y

echo "|----------------------------------------------------------------------------> Install libreadline-dev 1/22"
sudo apt-get install libreadline-dev -y

echo "|----------------------------------------------------------------------------> Install libconfig-dev 2/22"
sudo apt-get install libconfig-dev -y

echo "|----------------------------------------------------------------------------> Install libssl-dev 3/22"
sudo apt-get install libssl-dev -y

echo "|----------------------------------------------------------------------------> Install lua5.2 4/22"
sudo apt-get install lua5.2 -y

echo "|----------------------------------------------------------------------------> Install liblua5.2-dev 5/22"
sudo apt-get install liblua5.2-dev -y

echo "|----------------------------------------------------------------------------> Install libevent-dev 6/22"
sudo apt-get install libevent-dev -y

echo "|----------------------------------------------------------------------------> Install libjansson-dev 7/22"
sudo apt-get install libjansson-dev -y

echo "|----------------------------------------------------------------------------> Install libpython-dev 8/22"
sudo apt-get install libpython-dev -y

echo "|----------------------------------------------------------------------------> Install make 9/22"
sudo apt-get install make -y

echo "|----------------------------------------------------------------------------> Install  git 10/22"
sudo apt-get install  git git-core -y

echo "|----------------------------------------------------------------------------> Install openssl 11/22"
sudo apt-get install openssl -y

echo "|----------------------------------------------------------------------------> Install gcc-c++ 12/22"
sudo apt-get install gcc -y

echo "|----------------------------------------------------------------------------> Install ruby 13/22"
sudo apt install ruby -y

echo "|----------------------------------------------------------------------------> Install jq 14/22"
sudo apt-get install jq -y

echo "|----------------------------------------------------------------------------> Install git 15/22"
sudo apt-get install git git-core -y

echo "|----------------------------------------------------------------------------> Install python-pip 16/22"
sudo apt install python-pip -y

echo "|----------------------------------------------------------------------------> Install upgrade pip 17/22"
sudo pip install --upgrade pip

echo "|----------------------------------------------------------------------------> Install Flask 18/22"
sudo pip install Flask

echo "|----------------------------------------------------------------------------> Install emoji --upgrade 19/22"
sudo pip install emoji --upgrade

echo "|----------------------------------------------------------------------------> Install webp 20/22"
sudo apt install webp -y

echo "|----------------------------------------------------------------------------> Install libgcrypt 21/22"
sudo apt-get install -y libgcrypt-dev

echo "|----------------------------------------------------------------------------> Install zlib1g 22/22"
sudo apt-get install -y zlib1g-dev

sh config.sh
