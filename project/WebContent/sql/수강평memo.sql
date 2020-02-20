select * from memo;

create table memo(
userid varchar2(50) not null,
memo varchar2(300),
post_date date default sysdate
);

insert into memo(userid, memo) values('kim','수강평입니다.');

commit;