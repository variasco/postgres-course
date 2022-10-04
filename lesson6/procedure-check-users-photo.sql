SELECT profiles.main_photo_id
FROM profiles
  LEFT JOIN photo ON photo.id = profiles.main_photo_id
WHERE photo.owner_id != profiles.user_id;

CREATE OR REPLACE PROCEDURE check_users_photo()
LANGUAGE PLPGSQL AS
$$
  DECLARE row RECORD;
  BEGIN 
    FOR row IN (
      SELECT *
      FROM profiles
        LEFT JOIN photo ON photo.id = profiles.main_photo_id
      WHERE photo.owner_id != profiles.user_id
    )
    LOOP
      UPDATE profiles SET main_photo_id = NULL WHERE profiles.user_id = row.user_id;
    END LOOP;
    COMMIT;
  END;
$$;

CALL check_users_photo();

SELECT * FROM profiles LIMIT 3;
--  user_id | main_photo_id |     created_at      |           user_contacts            
-- ---------+---------------+---------------------+------------------------------------
--       55 |            14 | 2021-10-02 08:46:58 | 
--       21 |               | 2022-05-25 07:22:55 | (+7-962-744-5621,test@somemail.ru)
--        1 |               | 2022-01-07 02:32:04 | 
-- (3 rows)

-- Единственный пользователь с собственной фотографией id = 55