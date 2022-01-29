#!/usr/bin/python
import Adafruit_DHT
import time
from time import sleep
# Messdaten holen
# (22 steht fuer die Sensornummer
# und die 27 fuer die GPIO Nummer)
# erste Auslesung meist fehlerhaft, daher nicht ausgeben
#luftfeuchtigkeit, temperatur = Adafruit_DHT.read_retry(22, 27)

#DHT22 kann nur alle 2s ausgelesen werden
#time.sleep(2)

luftfeuchtigkeit, temperatur = Adafruit_DHT.read_retry(22, 27)
#Messdaten ausgeben und auf eine Stelle runden
print("Temperatur: {:.1f}*C".format(temperatur))
print("Luftfeuchtigkeit: {:.1f}%".format(luftfeuchtigkeit))
