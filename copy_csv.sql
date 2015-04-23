--
-- copy_csv.sql
--

-- Demo:
-- /home/ann/fx4us/psql.bash -f copy_csv.sql

-- This script should copy CSV data into table: pprices

COPY stage1(
  pair
  ,ttime
  ,bid
  ,ask
  ) FROM '/tmp/fx.csv' WITH csv;

INSERT INTO stage2(
  pair
  ,ttime
  ,bid
  ,ask
  )
  SELECT 
  pair
  ,ttime
  ,bid
  ,ask
  FROM stage1;

