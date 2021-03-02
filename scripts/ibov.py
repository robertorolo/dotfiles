#!/usr/bin/env python3
import sys

try:
    import requests, yahoo_fin
except ModuleNotFoundError:
    print('Missing dependencies...')

#a function to retrieve ibov value
import requests
from yahoo_fin import stock_info as si

def get_ibov():
    val = si.get_live_price('^BVSP')
    round_val = (val/1000).round(2)
    return 'IBOV '+str(round_val)+'K'

url = "http://www.google.com"
timetout = 5

try:
	request = requests.get(url, timeout=timetout)
	print(get_ibov())

except (requests.ConnectionError, requests.Timeout) as exception:
	print('No connection')
