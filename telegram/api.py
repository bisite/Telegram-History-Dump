import os
import sys
from flask import Flask

app = Flask(__name__)

@app.route('/')
def init():
  return "/start_dump_stop || /img_ocr || /start || /stop || /dump || /newuser || /dialog_list || /channel_list || /contact_list"

@app.route('/start_dump_stop')
def start_dump_stop():
  os.system("sh start_dump_stop.sh")
  return "Finalizada la descarga"

@app.route('/img_ocr')
def img_ocr():
  os.system("python3 img_ocr.py")
  return "Imagenes analizadas"

@app.route('/start')
def start():
  os.system("sh start.sh")
  return "Conectado"

@app.route('/new_user')
def newuser():
  os.system("pkill telegram-cli")
  os.system("./Telegram_Machine_Learning/bin/telegram-cli -q --json -P 9009")
  return "Conectado"

@app.route('/stop')
def stop():
  os.system("pkill telegram-cli")
  return "Desconectado"

@app.route('/dump')
def dump():
  os.system("sh dump.sh")
  return "Dumped"

@app.route('/dialog_list')
def dialogList():
  os.system("python comandos.py 1")
  return "Dialog_list"

@app.route('/channel_list')
def channelList():
  os.system("python comandos.py 2")
  return "Channel_list"


@app.route('/contact_list')
def contactList():
  os.system("python comandos.py 3")
  return "Contact_list"

if __name__ == '__main__':
  app.run()
