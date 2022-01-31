#!/usr/bin/env python3
import sys

try:
    import requests, google_currency
except ModuleNotFoundError:
    print('Missing dependencies...')

#a function to retrieve ibov value
from google_currency import convert
import requests

def get_dollar():
    val = convert('usd', 'brl', 1)
    dol = val.split('"')[11]
    #return 'USD '+dol
    return 'USD '+dol

url = "http://www.google.com"
timetout = 5

try:
	request = requests.get(url, timeout=timetout)
	print(get_dollar())

except (requests.ConnectionError, requests.Timeout) as exception:
	print('No connection')
