CREATE EXTENSION moddatetime;
SELECT * FROM pg_extension;

--   oid  |   extname   | extowner | extnamespace | extrelocatable | extversion | extconfig | extcondition 
-- -------+-------------+----------+--------------+----------------+------------+-----------+--------------
--  13451 | plpgsql     |       10 |           11 | f              | 1.0        |           | 
--  49360 | moddatetime |       10 |         2200 | t              | 1.0        |           | 
-- (2 rows)
