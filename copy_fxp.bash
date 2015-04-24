#!/bin/bash

# /home/ann/fx4us/copy_fxp.bash

# This script should copy fxp table to ~ann/fxp.csv
# fxp.csv should be sorted by pair then date
# The pair-symbols should be of the form: aud_usd, eur_usd, ...

cd /home/ann/fx4us/
./psql.bash -f copy_fxp.sql
cp /tmp/fxp.csv ~/ann/

exit

