#!/bin/bash

# /home/ann/fx4us/gen_feat.bash

# This script should generate features from forex prices.

# I should assume the prices are in this CSV file:
# ~ann/fxp.csv
# I should assume the prices are sorted by pair-symbol then date

mkdir -p ~ann/fx_feat/
cd ~ann/fx4us/fx4us/

for pair in aud_usd eur_usd
do
  grep $pair ~ann/fxp.csv > /tmp/fx4us_${pair}.csv
  echo ' python gen_feat.bash /tmp/fx4us_${pair}.csv $pair ~ann/fx_feat/${pair}.csv'
done

exit
