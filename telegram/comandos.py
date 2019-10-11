#! /usr/bin/python3

import subprocess
import time
import sys
import argparse
import sys

mode = int(sys.argv[1])

def switch_command(mode):
    switcher = {
        1:'dialog_list\n',
        2:'channel_list\n',
        3:'contact_list\n',
        4:'channel_get_admins\n',
        5:'channel_get_members\n',
        6:'chat_info\n',
        7:'channel_info\n',
    }

    telegram_script = subprocess.Popen("./Telegram_Machine_Learning/bin/telegram-cli", stdin=subprocess.PIPE)
    time.sleep(1)
    com = switcher.get(mode, "safe_quit\n")
    telegram_script.stdin.write(str.encode(com))

switch_command(mode)
