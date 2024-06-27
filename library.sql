create database sales;

use sales;

create table user(
id int primary key auto_increment not null,
name varchar(50),
role enum('seller', 'buyer') default 'buyer',
is_active boolean default true,
email varchar(60) unique not null,
phone int
);

create table articles(
id int primary key auto_increment not null,
user_id int,
foreign key (user_id) references user(id),
name varchar(50) not null,
description text,
price bigint not null
);

create table transactions (
user_id int,
foreign key (user_id) references user(id),
articles_id int,
foreign key (articles_id) references articles(id),
primary key (user_id, articles_id),
created_at datetime default current_timestamp,
status enum ('pending', 'confirmed', 'completed')
);

create table reviews (
id int primary key auto_increment not null,
user_id int,
foreign key (user_id) references user(id),
articles_id int,
foreign key (articles_id) references articles(id),
review text,
created_at datetime default current_timestamp
);