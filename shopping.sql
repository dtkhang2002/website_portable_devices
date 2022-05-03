create database Shopping
use Shopping

create table Account
(
user_mail varchar(100) not null primary key,
password varchar(64) not null,
account_role int not null,
user_name nvarchar(50) not null,
user_address nvarchar(255) not null,
user_phone varchar(10) not null
)

create table Orders
(
user_mail varchar(100) not null foreign key references Account(user_mail),
order_id int not null primary key,
order_status int not null,
order_date date not null,
order_discount_code varchar(8) null,
order_address nvarchar(255) not null
)

create table Products
(
product_id int not null primary key,
product_name nvarchar(100) not null,
product_des nvarchar(255) not null,
product_price float not null,
product_img_source varchar(255) not null,
product_type varchar(100) not null,
product_brand varchar(100) not null
)

create table Orders_detail
(
order_id int not null,
product_id int not null,
amount_product int not null,
price_product money not null,
Constraint PK_OP primary key (order_id, product_id),
Constraint FK_O foreign key (order_id) references Orders(order_id),
Constraint FK_P foreign key (product_id) references Products(product_id)
)

