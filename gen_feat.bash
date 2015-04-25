#!/bin/bash

# /home/ann/fx4us/gen_feat.bash

# This script should generate features from forex prices.

# I should assume the prices are in this CSV file:
# ~ann/fxp.csv
# I should assume the prices are sorted by pair-symbol then date

mkdir -p ~ann/fx_feat/
cd ~ann/fx4us/

for pair in aud_usd eur_usd eur_gbp gbp_usd nzd_usd usd_cad usd_jpy
do
  infile=/tmp/fx4us_${pair}.csv
  echo 'pair,ttime,cp'    >  $infile
  grep $pair ~ann/fxp.csv >> $infile
  python gen_feat.py $infile ~ann/fx_feat/${pair}.csv
done

exit
