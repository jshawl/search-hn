create table stories (
  id serial primary key,
  hn_id integer not null,
  title varchar(100),
  url varchar(100),
  text varchar(100)
);