#!/bin/bash

DIR="./output"


if test -d "$DIR"
then
	~/Telegram-History-Dump/telegram/Telegram_Machine_Learning/bin/telegram-cli --json -P 9009

else
	mkdir output && cd output
	mkdir JSON-dump JSONL-dump CSV-dump
	cd ..
	~/Telegram-History-Dump/telegram/Telegram_Machine_Learning/bin/telegram-cli --json -P 9009
fi


