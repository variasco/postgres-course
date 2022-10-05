CREATE OR REPLACE FUNCTION check_main_photo_owner()
RETURNS TRIGGER AS
$$
DECLARE not_owner BOOLEAN;
BEGIN
  not_owner := EXISTS(
    SELECT *
    FROM photo
    WHERE NEW.main_photo_id = photo.id
      AND NEW.user_id != photo.owner_id
  );

  IF (not_owner) THEN
    NEW.main_photo_id := NULL;
  END IF;

  RETURN NEW;
END
$$
LANGUAGE PLPGSQL;

CREATE TRIGGER check_main_photo_owner_on_insert
BEFORE INSERT ON profiles
FOR EACH ROW EXECUTE FUNCTION check_main_photo_owner();

CREATE TRIGGER check_main_photo_owner_on_update
BEFORE UPDATE ON profiles
FOR EACH ROW EXECUTE FUNCTION check_main_photo_owner();

UPDATE profiles SET main_photo_id = 3 WHERE user_id = 21;
SELECT * FROM profiles WHERE user_id = 21;
--  user_id | main_photo_id |     created_at      |           user_contacts            
-- ---------+---------------+---------------------+------------------------------------
--       21 |               | 2022-05-25 07:22:55 | (+7-962-744-5621,test@somemail.ru)
-- (1 row)

INSERT INTO users (first_name, last_name, email, phone)
VALUES ('Oliver', 'Twist', 'oivert@gmail.com', '+7951-738-7986');
INSERT INTO profiles (user_id, main_photo_id) VALUES (101, 3);
SELECT * FROM profiles WHERE user_id = 101;
--  user_id | main_photo_id | created_at | user_contacts 
-- ---------+---------------+------------+---------------
--      101 |               |            | 
-- (1 row)