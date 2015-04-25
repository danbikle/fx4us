#
# /home/ann/fx4us/plotem.py
#

# This script should plot data in a CSV file

# Demo:
# python /home/ann/fx4us/plotem.py /home/ann/fit_predict/aud_usd_1000_9.csv

import pandas as pd
import numpy  as np
import pdb
import datetime

# I should check cmd line arg
import sys

print('hello, from '+ sys.argv[0])

#  len(sys.argv) should == 2
if len(sys.argv) == 1:
  print('I need a command line arg.')
  print('Demo:')
  print('python '+sys.argv[0]+' /home/ann/fit_predict/aud_usd_1000_9.csv')
  print('Try again. bye.')
  sys.exit()

csvf = sys.argv[1]
print(csvf)

# I should load the csv into a DataFrame
df1 = pd.read_csv(csvf)

# matplotlib likes dates:
ttime_l = [datetime.datetime.strptime(row, "%Y-%m-%d %H:%M:%S") for row in np.array(df1['ttime'])]

cp_l     = [row for row in df1['cp']] 
cplead_l = cp_l + cp_l[-1:]
cplead_l = cplead_l[1:]

delta_a = np.array(cplead_l) - np.array(cp_l)
delta_l = [elm for elm in delta_a]
# I should avoid most recent delta_l since I dont know it yet.
delta_l   = delta_l[:-1]
cp_mirror = [cp_l[0]]
green_l   = [cp_l[0]]
pdb.set_trace()
# I should get my predictions
prediction_l = [(row-0.5) for row in df1['upprop']]
# I should now have a list full of predictions centered on 0.0

