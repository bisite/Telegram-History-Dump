#!/bin/bash

DIR="./output"


if test -d "$DIR"
then
	~/Telegram-History-Dump/telegram/Telegram_Machine_Learning/bin/telegram-cli --json -P 9009 &
        sh dump.sh
        echo "Dump End"
        pkill -f telegram-cl*
        echo "Telegram-cli End"
else
	mkdir output && cd output
	mkdir JSON-dump JSONL-dump CSV-dump
	cd ..
	~/Telegram-History-Dump/telegram/Telegram_Machine_Learning/bin/telegram-cli --json -P 9009 &
        sh dump.sh
        echo "Dump End"
        pkill -f telegram-cl*
        echo "Telegram-cli End"
fi


