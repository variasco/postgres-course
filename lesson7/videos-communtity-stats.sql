WITH videos_by_communities AS (
  SELECT
    communities.id community_id,
    communities.name community_name,
    communities_users.user_id,
    video.size
  FROM communities
    JOIN communities_users ON communities_users.community_id = communities.id
    JOIN video ON video.owner_id = communities_users.user_id
)
SELECT DISTINCT
  vc.community_id,
  vc.community_name,
  ROUND(AVG(vc.size) OVER (PARTITION BY vc.community_id), 2) average_video_size,
  FIRST_VALUE(vc.user_id) OVER (PARTITION BY vc.community_id ORDER BY vc.size DESC) user_id,
  FIRST_VALUE(u.first_name || ' ' || u.last_name) OVER (PARTITION BY vc.community_id ORDER BY vc.size DESC) user_name
FROM videos_by_communities vc
JOIN users u ON u.id = vc.user_id
ORDER BY community_id;