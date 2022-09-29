ALTER TABLE users
  ADD CONSTRAINT users_main_photo_id_fk
  FOREIGN KEY (main_photo_id)
  REFERENCES photo (id);

ALTER TABLE messages
  ADD CONSTRAINT messages_from_user_id_fk
  FOREIGN KEY (from_user_id)
  REFERENCES users (id);

ALTER TABLE messages
  ADD CONSTRAINT messages_to_user_id_fk
  FOREIGN KEY (to_user_id)
  REFERENCES users (id);

ALTER TABLE friendship
  ADD CONSTRAINT messages_requested_by_user_id_fk
  FOREIGN KEY (requested_by_user_id)
  REFERENCES users (id);

ALTER TABLE friendship
  ADD CONSTRAINT messages_requested_to_user_id_fk
  FOREIGN KEY (requested_to_user_id)
  REFERENCES users (id);

ALTER TABLE friendship
  ADD CONSTRAINT messages_status_id_fk
  FOREIGN KEY (status_id)
  REFERENCES friendship_statuses (id);

ALTER TABLE communities
  ADD CONSTRAINT communities_creator_id_fk
  FOREIGN KEY (creator_id)
  REFERENCES users (id);

ALTER TABLE communities_users
  ADD CONSTRAINT communities_users_community_id_fk
  FOREIGN KEY (community_id)
  REFERENCES communities (id);

ALTER TABLE communities_users
  ADD CONSTRAINT communities_users_user_id_fk
  FOREIGN KEY (user_id)
  REFERENCES users (id);

ALTER TABLE photo
  ADD CONSTRAINT photo_owner_id_fk
  FOREIGN KEY (owner_id)
  REFERENCES users (id);

ALTER TABLE video
  ADD CONSTRAINT video_owner_id_fk
  FOREIGN KEY (owner_id)
  REFERENCES users (id);

ALTER TABLE subscriptions_communities
  ADD CONSTRAINT subscriptions_communities_subscriber_id_fk
  FOREIGN KEY (subscriber_id)
  REFERENCES users (id);

ALTER TABLE subscriptions_communities
  ADD CONSTRAINT subscriptions_communities_to_community_id_fk
  FOREIGN KEY (to_community_id)
  REFERENCES communities (id);

ALTER TABLE subscriptions_users
  ADD CONSTRAINT subscriptions_users_subscriber_id_fk
  FOREIGN KEY (subscriber_id)
  REFERENCES users (id);

ALTER TABLE subscriptions_users
  ADD CONSTRAINT subscriptions_users_to_user_id_fk
  FOREIGN KEY (to_user_id)
  REFERENCES users (id);

