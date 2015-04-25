#!/bin/bash

# /home/ann/fx4us/fx4us.bash

# This script should download data and then calculate predictions.

cd /home/ann/fx4us/

# I should install postgres and create/setup postges-ann account
echo ./install_postgres.bash

# I should get fx prices
echo ./wget10.bash

# I should fill fxp
echo ./copy_csv.bash

# I should copy fxp table to ~ann/fxp.csv
# fxp.csv should be sorted by pair then date
# The pair-symbols should be of the form: aud_usd, eur_usd, ...
echo ./copy_fxp.bash

# I should generate features from fxp.csv
echo ./gen_feat.bash

# I should fit/predict:
echo ./fit_predict.bash

# I should plotem:
echo ./plotem.bash

exit


