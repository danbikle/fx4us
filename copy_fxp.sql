--
-- copy_fxp.sql
--

-- This script should fxp table to /tmp/fxp.csv
-- fxp.csv should be sorted by pair then date
-- The pair-symbols should be of the form: aud_usd, eur_usd, ...

SELECT COUNT(*) FROM fxp;

