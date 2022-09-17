-- Создание таблиц подписек пользователей на сообщества и других пользователей
-- Две одинаковые в сущности таблицы. Для того чтобы не было NULL ячеек
CREATE TABLE subscriptions_communities (
  id SERIAL PRIMARY KEY,
  subscriber_id INT NOT NULL,
  to_community_id INT NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE subscriptions_users (
  id SERIAL PRIMARY KEY,
  subscriber_id INT NOT NULL,
  to_user_id INT NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);