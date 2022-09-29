SELECT
  video.id "video id",
  (users.first_name || ' ' || users.last_name) "owner name",
  photo.url "owner photo url",
  video.url "video url",
  video.size "size"
FROM users
JOIN video ON video.owner_id = users.id
JOIN photo ON photo.id = users.main_photo_id
ORDER BY size DESC
LIMIT 10;