#!/bin/bash

# /home/ann/fx4us/copy_csv.bash

cd /home/ann/fx4us/

# I should create some empty tables
./psql.bash -f crtrunc.sql

for pair in AUDUSD
do
  unzip -p ~/fxcsv/AUDUSD-2009-05.zip | head > /tmp/fx.csv
  ./psql.bash -f copy_csv.sql
done


exit
