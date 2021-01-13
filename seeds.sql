create table users (
  id integer primary key,
  name text,
  age integer,
  created_at,
  updated_at
);

create table posts (
  id integer primary key,
  user_id integer,
  message text,
  created_at,
  updated_at
);
