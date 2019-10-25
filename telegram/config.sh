#!/bin/bash

cd ./Telegram_Machine_Learning
sudo ./configure --disable-openssl --prefix=/usr CFLAGS="$CFLAGS -w"
sudo make
