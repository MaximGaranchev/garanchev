DROP database if exists `MAGAZIN`;
create database `MAGAZIN`;
use `MAGAZIN`;
create table `pokypatel`(
FIO VARCHAR(50)not null,
ID_PASPORT INT,
VIBRANII_TOVAR VARCHAR(50)not null,
DENGI INT
);
create table `MAGAZINE`(
NAZVANIE VARCHAR(50)not null,
TOVAR VARCHAR(50)not null,
SOTRYDNIK VARCHAR(50)not null,
DIRECTOR VARCHAR(50)not null,
foreign key (SOTRYDNIK) references SOTRYDNIK (ID),
foreign key (TOVAR) references TOVAR (id)
);
create table `SOTRYDNIK`(
FIO VARCHAR(50)NOT null,
ID INT primary key,
DOLJNOST VARCHAR(50)not null
);
create table `TOVAR`(
nazvanie varchar(50),
id int primary key,
srok int,
cena int,
xaracter varchar(50)
);
create table `DIRECTOR`(
FIO varchar(50),
id int
);