select * from member2;

create table member2(
userid varchar2(50) not null primary key,
pwd varchar2(50) not null,
name varchar2(50) not null,
course varchar2(50),
counsel_time varchar2(50),
campus varchar2(20),
email varchar2(50),
hp varchar2(50),
text varchar2(4000),
join_date date default sysdate
);


insert into member2 (userid,pwd,name,course,counsel_time,campus,email,hp,text) 
 values ('kim','1111','김길동','초급한국어','오전9~12시','강동','kim@gmail.com','010-123-4567','안녕하세요!');

insert into member2 (userid,pwd,name,course,counsel_time,campus,email,hp,text) 
 values ('hong','1234','홍길동','중급한국어','오전9~12시','강동','hong@gmail.com','010-111-4567','안녕하세요!');

insert into member2 (userid,pwd,name,course,counsel_time,campus,email,hp,text) 
 values ('choi','2222','최길동','고급한국어','오후2~6시','강동','choi@yahoo.com','010-222-4567','안녕하세요!');

insert into member2 (userid,pwd,name,course,counsel_time,campus,email,hp,text) 
 values ('park','3333','박길동','초급한국어','주말오전9~12시','강동','park@gmail.com','010-333-4567','안녕하세요!');

insert into member2 (userid,pwd,name,course,counsel_time,campus,email,hp,text) 
 values ('lee','8888','이길동','한국어능력시험','저녁7~10시','강동','lee@gmail.com','010-888-4567','안녕하세요!');

 
commit;

