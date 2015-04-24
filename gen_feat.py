#
# /home/ann/fx4us/gen_feat.py
#

# This script should generate features from forex prices.

# I should assume the prices are in a CSV file like this:
# /tmp/fx4us_aud_usd.csv
# I should assume the prices are ordered by ascending date.

# Demo:
# mkdir -p ~ann/fx_feat/
# cd ~ann/fx4us/
# 
# for pair in aud_usd eur_usd
# do
#   grep $pair ~ann/fxp.csv > /tmp/fx4us_${pair}.csv
#   python gen_feat.py /tmp/fx4us_${pair}.csv $pair ~ann/fx_feat/${pair}.csv
# done


# I should read /tmp/fx4us_${pair}.csv
# which is listed on the command line.

import pandas as pd
import numpy  as np
import pdb
import datetime

# I should check cmd line arg
import sys

print('hello, from '+ sys.argv[0])
pdb.set_trace()
#  len(sys.argv) should == 2
if len(sys.argv) == 1:
  print('I need a command line arg.')
  print('Demo:')
  print('python '+sys.argv[0]+' /tmp/spy4us/ff1.csv')
  print('Try again. bye.')
  sys.exit()

csvf = sys.argv[1]
print(csvf)

# I should load the csv into a DataFrame
df1 = pd.read_csv(csvf).sort(['cdate'])
