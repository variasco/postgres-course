CREATE FUNCTION find_most_sociable_user_by_id(toUserId INTEGER)
RETURNS INTEGER AS 
$$
  SELECT from_user_id
  FROM messages
  WHERE to_user_id = toUserId
  GROUP BY from_user_id
  ORDER BY COUNT(*) DESC
  LIMIT 1;
$$
LANGUAGE SQL;

SELECT find_most_sociable_user_by_id(5);
--  find_most_sociable_user_by_id 
-- -------------------------------
--                             35
-- (1 row)