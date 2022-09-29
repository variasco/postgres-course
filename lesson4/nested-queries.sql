SELECT id "video id",
  ( SELECT first_name || ' ' || last_name FROM users WHERE video.owner_id = users.id ) "owner name",
  ( SELECT 
    ( SELECT url FROM photo WHERE photo.id = users.main_photo_id )
  FROM users WHERE video.owner_id = users.id ) "owner photo url",
  url "video url",
  size
FROM video
ORDER BY size DESC
LIMIT 10;