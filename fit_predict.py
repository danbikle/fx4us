#
# /home/ann/fx4us/fit_predict.py
#

# This script should fit (learn/train) and then predict.

# I should assume the features are in a file like this:
# ~ann/fx_feat/${pair}.csv
# I should assume the rows are sorted by date

# Demo:
# cd ~ann/fx4us/
# mkdir -p ~ann/fit_predict/
# for pair in aud_usd
# do
#   infile=/home/ann/fx_feat/${pair}.csv
#   onum=1000 # number of observations to learn from
#   pnum=9
#   outfile=/home/ann/fit_predict/${pair}_${onum}_${pnum}.csv
#   python fit_predict.py $infile $onum $pnum $outfile
# done

import pandas as pd
import numpy  as np
import pdb
import datetime

# I should check cmd line arg
import sys

print('hello, from '+ sys.argv[0])

#  len(sys.argv) should == 4
if len(sys.argv) < 4:
  print('I need a proper command line.')
  print('Demo:')
  print('python '+sys.argv[0]+' /home/ann/fx_feat/aud_usd.csv 1000 100 /home/ann/fit_predict/aud_usd_1000_100.csv')
  print('Try again. bye.')
  sys.exit()

# I should read the commandline:
infile  =     sys.argv[1]
onum    = int(sys.argv[2])
pnum    = int(sys.argv[3])
outfile =     sys.argv[4]
# I should load the csv into a DataFrame
df1 = pd.read_csv(infile)
a1_a = np.array(df1)
# sklearn cannot use columns 0,1,2
y_a  = a1_a[:,3 ]
# I should have structured input CSV so all x-columns on right-hand-side.
# That should be convenient now:
x_a  = a1_a[:,4:]

# I should specify gap between oos-data and train-data:
is_oos_gap = 1

# setup the prediction loop:
pend   = len(y_a)
pstart = pend - pnum

for oos_start in range(pstart,pend):
  print(a1_a[oos_start,0])
  y_oos = y_a[oos_start]


