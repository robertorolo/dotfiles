#!/home/void/anaconda3/envs/drh/bin/python

#a function to retrieve ibov value
from yahoo_fin import stock_info as si

def get_ibov():
    val = si.get_live_price('^BVSP')
    round_val = (val/1000).round(2)
    return ' IBOV '+str(round_val)+'K '

print(get_ibov())
