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
  ,date_trunc('hour',ttime+interval '30 minutes') ttime
  ,bid
  ,ask
  FROM stage1 ORDER BY pair,ttime;

INSERT INTO stage3(
  pair
  ,ttime
  ,bid
  ,ask
  )
  SELECT 
  pair
  ,ttime
  ,AVG(bid) bid
  ,AVG(ask) ask
  FROM stage2 GROUP BY pair,ttime ORDER BY pair,ttime;

select * from stage1;
select * from stage2;
select * from stage3;
