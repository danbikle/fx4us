#!/bin/bash

# /home/ann/fx4us/fit_predict.bash

# This script should fit (learn/train) and then predict.

# I should assume the features are in a file like this:
# ~ann/fx_feat/${pair}.csv
# I should assume the rows are sorted by date

cd ~ann/fx4us/
mkdir -p ~ann/fit_predict/
for pair in aud_usd
do
  # onum is number of observations to learn from:
  for onum in 1000 5000 10000
  do
    infile=/home/ann/fx_feat/${pair}.csv
    pnum=35555    # number of predictions
    pnum=99
    outfile=/home/ann/fit_predict/${pair}_${onum}_${pnum}.csv
    python fit_predict.py $infile $onum $pnum $outfile
    python plotem.py $outfile
  done
done

exit
