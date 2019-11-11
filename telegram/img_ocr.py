# Importamos Pillow
from PIL import Image
import glob

# Importamos Pandas
import pandas as pd
import csv

# TIME
import time
import datetime
from time import gmtime, strftime

# Importamos Pytesseract
import pytesseract

import os

path = "./output/media"

for root,dirs,files in os.walk(path):
    for infile in [f for f in files if f.lower().endswith('.jpg')]:
        file, ext = os.path.splitext(infile)
        full_path = os.path.join(root,infile)

        a = root[15:]
        b = full_path[full_path.rfind("/")+1:]

        print ("-------------------------------------------------------")

        try:
            img = Image.open(full_path)
            texto = pytesseract.image_to_string(img)

            if len(texto) is 0:
               c = 'none'
            else:
              txt =  texto.replace("\n"," ")
              c = txt

            row = [a,b,c]

        except:
            print ("Lo siento, no es una imagen legible")
            c = 'No legible'
            row = [a,b,c]
            
        with open('./output/media/data_ocr.csv', 'a') as csvFile:
            writer = csv.writer(csvFile)
            print (row)
            writer.writerow(row)
        csvFile.close()

df = pd.read_csv("./output/media/data_ocr.csv", sep=',')
print (df)