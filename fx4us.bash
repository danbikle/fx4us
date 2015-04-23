#!/bin/bash

# /home/ann/fx4us/fx4us.bash

# This script should download data and then calculate predictions.

cd /home/ann/fx4us/

echo ./wget10.bash

echo ./install_postgres.bash

./psql.bash -f copy_csv.sql
