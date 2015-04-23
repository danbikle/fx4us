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
  ,date_trunc('day',ttime)+ ROUND(date_part('hour',ttime)) ttime
  ,bid
  ,ask
  FROM stage1;

select * from stage1;
select ROUND(date_part('hour',ttime)) AS rround from stage1;
select * from stage2;
