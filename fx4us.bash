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

# I should generate features from fxp
echo ./gen_feat.bash

exit


