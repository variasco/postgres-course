-- Базы данных, уровень 2
-- Создание структуры базы данных, генерация тестовых данных

-- Построение реляционной базы данных
-- https://vk.com/geekbrainsru

-- Создание базы данных

-- Теперь у нас всё готово для создания таблиц, но сначала создадим базу данных vk:
$ sudo su - postgres
psql
postgres=# CREATE DATABASE vk;

-- Предоставим все права на базу данных test пользователю gb_user.
postgres=# GRANT ALL PRIVILEGES ON DATABASE vk to gb_user;

-- Проверим подключение созданным пользователем, по запросу вводим пароль пользователя gb_user:
psql -Ugb_user vk -h127.0.0.1

-- Также необходимо настроить подключение в приложении (графическом клиенте) pgAdmin.

-- Создание таблиц

-- На данном этапе у нас есть основа для создания структуры базы данных. Создаём таблицы с помощью команды CREATE TABLE. Для получения справочной информации по типам данных и ограничениям на столбцы PostgreSQL можно обратиться к официальной документации 

-- https://postgrespro.ru/docs/postgresql/13/ddl
-- https://postgrespro.ru/docs/postgresql/13/datatype

-- Таблица пользователей
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  email VARCHAR(120) NOT NULL UNIQUE,
  phone VARCHAR(15) UNIQUE,
  main_photo_id INT,
  created_at TIMESTAMP
);

-- Таблица сообщений
CREATE TABLE messages (
  id SERIAL PRIMARY KEY,
  from_user_id INT NOT NULL,
  to_user_id INT NOT NULL,
  body TEXT,
  is_important BOOLEAN,
  is_delivered BOOLEAN,
  created_at TIMESTAMP
);

-- Таблица дружбы
CREATE TABLE friendship (
  id SERIAL PRIMARY KEY,
  requested_by_user_id INT NOT NULL,
  requested_to_user_id INT NOT NULL,
  status_id INT NOT NULL,
  requested_at TIMESTAMP,
  confirmed_at TIMESTAMP
);

-- Таблица статусов дружбы
CREATE TABLE friendship_statuses (
  id SERIAL PRIMARY KEY,
  name VARCHAR(30) UNIQUE
);

-- Таблица сообществ
CREATE TABLE communities (
  id SERIAL PRIMARY KEY,
  name VARCHAR(120) UNIQUE,
  creator_id INT NOT NULL,
  created_at TIMESTAMP
);

-- Таблица связи сообщества - пользователи
CREATE TABLE communities_users (
  community_id INT NOT NULL,
  user_id INT NOT NULL,
  created_at TIMESTAMP,
  PRIMARY KEY (community_id, user_id)
);

-- Таблица фотографий
CREATE TABLE photo (
  id SERIAL PRIMARY KEY,
  url VARCHAR(250) NOT NULL UNIQUE,
  owner_id INT NOT NULL,
  description VARCHAR(250) NOT NULL,
  uploaded_at TIMESTAMP NOT NULL,
  size INT NOT NULL
);

-- Таблица видео
CREATE TABLE video (
  id SERIAL PRIMARY KEY,
  url VARCHAR(250) NOT NULL UNIQUE,
  owner_id INT NOT NULL,
  description VARCHAR(250) NOT NULL,
  uploaded_at TIMESTAMP NOT NULL,
  size INT NOT NULL
);


-- Создание тестовых данных
-- http://www.generatedata.com/


-- Создание резервной копии
postgres@vhost:~$ pg_dump vk > vk.dump.sql

-- Восстановление из резервной копии

postgres@vhost:~$ createdb vk_test

-- Загрузим данные в тестовую БД:
postgres@vhost:~$ psql vk_test < vk.dump.sql

-- Или используем команду pg_restore
postgres@vhost:~$ pg_restore -d vk_test -1 vk.dump.sql

-- Проверим успешность загрузки данных, сделаем выборку из любой таблицы:

postgres=# \c vk_test

vk_test=# SELECT * FROM users LIMIT 3;



