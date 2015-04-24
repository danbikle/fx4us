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

#  len(sys.argv) should == 4
if len(sys.argv) < 4:
  print('I need a proper command line.')
  print('Demo:')
  print('python '+sys.argv[0]+' /tmp/fx4us_aud_usd.csv aud_usd ~ann/fx_feat/aud_usd.csv')
  print('Try again. bye.')
  sys.exit()

csvf = sys.argv[1]
print(csvf)

# I should load the csv into a DataFrame
df1 = pd.read_csv(csvf)

# I should generate features from df1.
pdb.set_trace()

# All features come from cp column.
cp_l = [elm for elm in np.array(df1['cp'])]

# Noting that cp is sorted by date-ascending, I should get cplead_1.
# To get it, I should push from right:
# vis: [old, new] + [new]
cplead_l = cp_l + [cp_l[-1]]
