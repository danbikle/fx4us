--
-- copy_csv.sql
--

-- Demo:
-- /home/ann/fx4us/psql.bash -f copy_csv.sql

-- This script should copy CSV data into table: fxp

-- These tables contain temp data:
TRUNCATE TABLE stage1;
TRUNCATE TABLE stage2;

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
  ,date_trunc('hour',ttime) ttime
  ,bid
  ,ask
  FROM stage1 
  -- A spread > 10 pips is bad data:
  WHERE (ask-bid)/ask < 0.0010
  AND ROUND(date_part('hour',ttime))   = 0
  AND ROUND(date_part('minute',ttime)) = 0
  AND ROUND(date_part('second',ttime)) < 15
  ORDER BY pair,ttime;

INSERT INTO fxp(
  pair
  ,ttime
  ,bid
  ,ask
  )
  SELECT 
  pair
  ,ttime
  ,ROUND(AVG(bid)::NUMERIC,4) bid
  ,ROUND(AVG(ask)::NUMERIC,4) ask
  FROM stage2 GROUP BY pair,ttime ORDER BY pair,ttime;
