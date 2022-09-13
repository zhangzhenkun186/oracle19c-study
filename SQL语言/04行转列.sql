create table student_score(
   name varchar2(20),
   subject varchar2(20),
   score number(4,1)
);
insert into student_score values('张三','语文','78.0');
insert into student_score values('张三','数学','88.0');
insert into student_score values('张三','英语','98.0');
insert into student_score values('李四','语文','89.0');
insert into student_score values('李四','数学','76.0');
insert into student_score values('李四','英语','90.0');
insert into student_score values('王五','语文','99.0');
insert into student_score values('王五','数学','66.0');
insert into student_score values('王五','英语','91.0');

/**
输出：
名字   语文   数学  英语
李四   89     76    90
*/

--decode 
select ss.name 姓名,
       max(decode(ss.subject, '语文', ss.score)) 语文,
       max(decode(ss.subject, '数学', ss.score)) 数学,
       max(decode(ss.subject, '英语', ss.score)) 英语
  from student_score ss
 group by ss.name;

--case when then end

select ss.name 姓名,
       max(case ss.subject
             when '语文' then
              ss.score
           end) 语文,
       max(case ss.subject
             when '数学' then
              ss.score
           end) 数学,
       max(case ss.subject
             when '英语' then
              ss.score
           end) 英语
  from student_score ss
 group by ss.name;
 
--join on
--第一步
select ss.name,ss.score from student_score ss where ss.subject='语文';
select ss.name,ss.score from student_score ss where ss.subject='数学';
select ss.name,ss.score from student_score ss where ss.subject='英语';
--第二步
select ss01.name, ss01.score 语文, ss02.score 数学, ss03.score 英语
  from (select ss.name, ss.score
          from student_score ss
         where ss.subject = '语文') ss01
  join (select ss.name, ss.score
          from student_score ss
         where ss.subject = '数学') ss02
    on ss01.name = ss02.name
  join (select ss.name, ss.score
          from student_score ss
         where ss.subject = '英语') ss03
    on ss01.name = ss03.name;

--union all
select t.name, sum(t.yw) 语文, sum(t.sx) 数学, sum(t.yy) 英语
  from (select ss.name, sum(ss.score) yw, sum(0) sx, sum(0) yy
          from student_score ss
         where ss.subject = '语文'
         group by ss.name
        union all
        select ss.name, sum(0) yw，sum(ss.score) sx, sum(0) yy
          from student_score ss
         where ss.subject = '数学'
         group by ss.name
        union all
        select ss.name, sum(0) yw, sum(0) sx, sum(ss.score) yy
          from student_score ss
         where ss.subject = '英语'
         group by ss.name) t
 group by t.name;
