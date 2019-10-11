#!/bin/bash

#sudo
ruby ./Telegram_Machine_Learning/telegram-history-dump/telegram-history-dump.rb

DIR="~/telegram/output/json"

cd ~/Telegram-History-Dump/telegram/output/json

for fichero in $(ls|grep .jsonl)
do
  echo $fichero
  file=$(echo $fichero|cut -f1 -d ".")
  echo $file
  jq -s '.' $fichero > $file.json

  python ~/Telegram-History-Dump/telegram/j_to_c.py $file.json $file.csv
  mv $file.json ../JSON-dump
  mv $fichero ../JSONL-dump
  mv $file.csv ../CSV-dump
done

rm -r ~/Telegram-History-Dump/telegram/output/json
rm -r ~/Telegram-History-Dump/telegram/output/progress.json

