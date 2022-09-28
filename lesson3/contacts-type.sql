CREATE TYPE contacts AS (phone VARCHAR(20), email VARCHAR(120));

ALTER TABLE users ADD COLUMN user_contacts contacts;

SELECT phone, email FROM users WHERE id = 21;

UPDATE users SET user_contacts = '(+7-962-744-5621,est.tempor.bibendum@yahoo.edu)' WHERE id = 21;

UPDATE users SET user_contacts.email = 'test@somemail.ru' WHERE id = 21;