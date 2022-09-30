CREATE TABLE profiles (
  user_id SERIAL PRIMARY KEY,
  main_photo_id INT,
  created_at TIMESTAMP,
  user_contacts contacts
);

ALTER TABLE profiles
  ADD CONSTRAINT profiles_main_photo_id_fk
  FOREIGN KEY (main_photo_id)
  REFERENCES photo (id);

ALTER TABLE profiles
  ADD CONSTRAINT profiles_user_id_fk
  FOREIGN KEY (user_id)
  REFERENCES users (id);

INSERT INTO profiles (SELECT users.id, users.main_photo_id, users.created_at, users.user_contacts FROM users);

ALTER TABLE users DROP COLUMN main_photo_id;
ALTER TABLE users DROP COLUMN created_at;
ALTER TABLE users DROP COLUMN user_contacts;

SELECT * FROM users LIMIT 3;
--  id | first_name | last_name |              email              |      phone      
-- ----+------------+-----------+---------------------------------+-----------------
--  21 | Meghan     | Zamora    | est.tempor.bibendum@yahoo.edu   | +7-962-744-5621
--   1 | Dante      | Wiggins   | pede.ac@yahoo.net               | +7-960-394-0036
--   2 | Vielka     | Gonzalez  | erat.volutpat.nulla@outlook.com | +7-970-772-3401
-- (3 rows)

SELECT * FROM profiles LIMIT 3;
--  user_id | main_photo_id |     created_at      |           user_contacts            
-- ---------+---------------+---------------------+------------------------------------
--       21 |            36 | 2022-05-25 07:22:55 | (+7-962-744-5621,test@somemail.ru)
--        1 |            93 | 2022-01-07 02:32:04 | 
--        2 |             8 | 2022-06-22 09:18:04 | 
-- (3 rows)