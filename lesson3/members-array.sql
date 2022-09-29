AlTER TABLE communities ADD COLUMN members INT[];

SELECT user_id FROM communities_users WHERE community_id = 3;

UPDATE communities SET members = '{78, 42}' WHERE id = 3;