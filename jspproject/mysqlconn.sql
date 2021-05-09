create table member(
num INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
name varchar(10) not null,
sex varchar(10) not null,
id varchar(50) not null,
passwd varchar(16) not null,
emailid varchar(50) not null,
emailadr varchar(50) not null,
phone varchar(10) not null,
midnum varchar(50) not null,
endnum varchar(50) not null,
reg_date datetime not null
);

create table admin(
num INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
id varchar(50) not null ,
passwd varchar(16) not null
);

create table book(
num INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
name varchar(50) not null,
writer varchar(10) not null,
genre varchar(50) not null
);

drop table member;
drop table admin;
drop table book;

select * from member;

select * from book;


Insert into member(name, sex, id, passwd, emailid, emailadr, phone, midnum, endnum, reg_date)
values('홍길동', '남자', 'hong', '1234', 'hong', 'naver.com', '010', '1111', '1111', now());

Insert into admin(id, passwd)
values('admin', 'admin');

Insert into book(name, writer, genre)
values('신데렐라', '샤를 페로', '로맨스');

Insert into book(name, writer, genre)
values('백설공주', '그림형제', '로맨스');

Insert into book(name, writer, genre)
values('그리고 아무도 없었다', '아가사 크리스티', '스릴러');

Insert into book(name, writer, genre)
values('원피스', '오다 에이치로', '액션');

Insert into book(name, writer, genre)
values('jsp', 'hong', '액션');