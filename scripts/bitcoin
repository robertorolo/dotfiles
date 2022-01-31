#!/usr/bin/env python3
import sys

try:
    import requests, yahoo_fin
except ModuleNotFoundError:
    print('Missing dependencies...')

#a function to retrieve ibov value
import requests
from yahoo_fin import stock_info as si

def get_btc():
    val = si.get_live_price('BTC-USD')
    round_val = (val).round(2)
    #return 'IBOV '+str(round_val)+'K'
    return 'BTC '+str(round_val)

url = "http://www.google.com"
timetout = 5

try:
	request = requests.get(url, timeout=timetout)
	print(get_btc())

except (requests.ConnectionError, requests.Timeout) as exception:
	print('No connection')
