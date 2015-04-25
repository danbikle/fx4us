#!/bin/bash

# /home/ann/fx4us/fx4us.bash

# This script should download data and then calculate predictions.

# This script depends on install_postgres.bash
# Before I run this script,
# I should login as root and run this script:
# ./install_postgres.bash

cd /home/ann/fx4us/

# I should get fx prices
./wget10.bash

# I should fill fxp
./copy_csv.bash

# I should copy fxp table to ~ann/fxp.csv
# fxp.csv should be sorted by pair then date
# The pair-symbols should be of the form: aud_usd, eur_usd, ...
./copy_fxp.bash

# I should generate features from fxp.csv
./gen_feat.bash

# I should fit and predict then plot:
./fit_predict.bash

exit


