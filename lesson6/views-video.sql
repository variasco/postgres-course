-- неизменяемое представление, так как в запросе участвует 2 таблицы и есть LIMIT.
CREATE VIEW last_added_videos AS
SELECT 
  video.id,
  (users.first_name || ' ' || users.last_name) author,
  video.url,
  video.size
FROM video
JOIN users ON users.id = video.owner_id
ORDER BY video.uploaded_at DESC
LIMIT 5;

SELECT * FROM last_added_videos;
--  id |     author     |                 url                  | size 
-- ----+----------------+--------------------------------------+------
--  32 | Eliana Mckee   | http://wikipedia.org/asf?id=98796546 |  904
--  89 | Trevor Walters | http://facebook.com/rec?search=1     | 1220
--  51 | Iris Carr      | https://bbc.co.uk/video?p=8          | 1924
--  61 | Iris Carr      | http://google.com/video?q=11         |  781
--  33 | Thane Sandoval | https://yahoo.com/mov?gi=100         | 1519
-- (5 rows)

UPDATE last_added_videos SET size = 100 WHERE id = 32;
-- ERROR:  cannot update view "last_added_videos"
-- DETAIL:  Views containing LIMIT or OFFSET are not automatically updatable.
-- HINT:  To enable updating the view, provide an INSTEAD OF UPDATE trigger or an unconditional ON UPDATE DO INSTEAD rule.


-- изменяемое представление
CREATE VIEW recently_added_videos AS
SELECT
  id,
  url,
  size
FROM video
WHERE uploaded_at > (current_timestamp - interval '1 month');

UPDATE recently_added_videos SET size = 100 WHERE id = 32;
SELECT * FROM recently_added_videos WHERE id = 32;
--  id |                 url                  | size 
-- ----+--------------------------------------+------
--  32 | http://wikipedia.org/asf?id=98796546 |  100
-- (1 row)