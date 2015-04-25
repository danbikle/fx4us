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
# for pair in aud_usd
# do
#   infile=/tmp/fx4us_${pair}.csv
#   echo 'pair,ttime,cp'    >  $infile
#   grep $pair ~ann/fxp.csv >> $infile
#   python gen_feat.py $infile ~ann/fx_feat/${pair}.csv
# done

import pandas as pd
import numpy  as np
import pdb
import datetime

# I should check cmd line arg
import sys

print('hello, from '+ sys.argv[0])

#  len(sys.argv) should == 3
if len(sys.argv) < 3:
  print('I need a proper command line.')
  print('Demo:')
  print('python '+sys.argv[0]+' /tmp/fx4us_aud_usd.csv ~ann/fx_feat/aud_usd.csv')
  print('Try again. bye.')
  sys.exit()

# I should read the input csv:
csvf = sys.argv[1]
print(csvf)

# I should load the csv into a DataFrame
df1 = pd.read_csv(csvf)

# I should generate features from df1.

# All features come from cp column.
cp_l = [elm for elm in np.array(df1['cp'])]

# Noting that cp is sorted by date-ascending, I should get cplead_1.
# To get it, I should push from right:
# vis: [old:new] + [new]
cplead_l = cp_l  + cp_l[-1:]

# I should get cplag_1 by pushing from left:
#          [   old] + [old:new]
cplag1_l  = cp_l[:1] + cp_l
# I should get cplag_x:
cplag2_l  = cp_l[:2]  + cp_l
cplag4_l  = cp_l[:4]  + cp_l
cplag8_l  = cp_l[:8]  + cp_l
cplag16_l = cp_l[:16] + cp_l
# I should snip off ends so new columns as long as cp column:
cplead_l  = cplead_l[1:]
cplag1_l  = cplag1_l[:-1]
cplag2_l  = cplag2_l[:-2]
cplag4_l  = cplag4_l[:-4]
cplag8_l  = cplag8_l[:-8]
cplag16_l = cplag16_l[:-16]
# NumPy allows me to do arithmetic on its Arrays.
# I should convert my lists to Arrays:
cp_a      = np.array(cp_l)
cplead_a  = np.array(cplead_l)
cplag1_a  = np.array(cplag1_l)
cplag2_a  = np.array(cplag2_l)
cplag4_a  = np.array(cplag4_l)
cplag8_a  = np.array(cplag8_l)
cplag16_a = np.array(cplag16l)
# I should calculate pip-deltas:
piplead_a  = 100.0 * 100.0 * (cplead_a - cp_a) /cp_a
piplag1_a  = 100.0 * 100.0 * (cp_a - cplag1_a) /cplag1_a
piplag2_a  = 100.0 * 100.0 * (cp_a - cplag2_a) /cplag2_a
piplag4_a  = 100.0 * 100.0 * (cp_a - cplag4_a) /cplag4_a
piplag8_a  = 100.0 * 100.0 * (cp_a - cplag8_a) /cplag8_a
piplag16_a = 100.0 * 100.0 * (cp_a - cplag16_a)/cplag16_a
# I am done doing calculations.
# I should put my 5 new columns into my DataFrame.
df1['piplead']  = piplead_a
df1['piplag1']  = piplag1_a
df1['piplag2']  = piplag2_a
df1['piplag4']  = piplag4_a
df1['piplag8']  = piplag8_a
df1['piplag16'] = piplag16_a
# I should save my work into a CSV file.
df1.to_csv(sys.argv[2], float_format='%4.1f', index=False)
print('The features are in this file:')
print(sys.argv[2])
print('Now the machine can learn.')
# done
