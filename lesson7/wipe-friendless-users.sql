BEGIN;

CREATE TEMPORARY TABLE friendless_users (
  id INT
);

INSERT INTO friendless_users
  WITH users_with_friends AS (
    SELECT DISTINCT u.id
    FROM users u
    LEFT JOIN friendship f ON f.requested_by_user_id = u.id
    OR f.requested_to_user_id = u.id
    LEFT JOIN friendship_statuses fs ON fs.id = f.status_id
    WHERE fs.name = 'approved'
    ORDER BY id
  )
  SELECT DISTINCT id
  FROM users
  WHERE id NOT IN (
    SELECT id
    FROM users_with_friends
  );

DELETE FROM communities_users WHERE user_id IN (SELECT id FROM friendless_users);
DELETE FROM friendship WHERE requested_by_user_id IN (SELECT id FROM friendless_users)
OR requested_to_user_id IN (SELECT id FROM friendless_users);
DELETE FROM messages WHERE from_user_id IN (SELECT id FROM friendless_users)
OR to_user_id IN (SELECT id FROM friendless_users);
UPDATE users SET main_photo_id = NULL WHERE id IN (SELECT id FROM friendless_users);
DELETE FROM photo WHERE owner_id IN (SELECT id FROM friendless_users);
DELETE FROM video WHERE owner_id IN (SELECT id FROM friendless_users);
DELETE FROM users WHERE id IN (SELECT id FROM friendless_users);

COMMIT;
