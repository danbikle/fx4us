--
-- /home/ann/fx4us/crtrunc.sql
--

-- This script should CREATE   stage1 if it not exists.
-- This script should TRUNCATE stage1.

CREATE TABLE IF NOT EXISTS stage1(
  pair   VARCHAR
  ,ttime TIMESTAMP
  ,bid   float8
  ,ask   float8);

CREATE TABLE IF NOT EXISTS stage2(
  pair   VARCHAR
  ,ttime TIMESTAMP
  ,bid   float8
  ,ask   float8);

TRUNCATE TABLE stage1;
TRUNCATE TABLE stage2;
