CREATE TEMPORARY TABLE big_video (
  id INT,
  owner_id INT,
  url VARCHAR(250),
  size INT
);

INSERT INTO big_video
  SELECT id, owner_id, url, size
  FROM video
  ORDER BY size DESC
  LIMIT 10;

SELECT
  big_video.id "video id",
  (users.first_name || ' ' || users.last_name) "owner name",
  photo.url "owner photo url",
  big_video.url "video url",
  big_video.size "size"
FROM users
JOIN big_video ON big_video.owner_id = users.id
JOIN photo ON photo.id = users.main_photo_id;