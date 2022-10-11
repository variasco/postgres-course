WITH photo_and_video_from_users AS (
  SELECT DISTINCT
    users.id,
    users.first_name,
    users.last_name,
    COUNT(photo.id) OVER (PARTITION BY photo.owner_id) photo_count,
    COUNT(video.id) OVER (PARTITION BY video.owner_id) video_count
  FROM users
    LEFT JOIN photo ON photo.owner_id = users.id
    LEFT JOIN video ON video.owner_id = users.id
)
SELECT
  id,
  first_name,
  last_name,
  photo_count,
  DENSE_RANK() OVER (ORDER BY photo_count DESC) photo_rank,
  video_count,
  DENSE_RANK() OVER (ORDER BY video_count DESC) video_rank
FROM photo_and_video_from_users
ORDER BY id;