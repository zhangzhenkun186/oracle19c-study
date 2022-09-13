create table student_score(
   name varchar2(20),
   subject varchar2(20),
   score number(4,1)
);
insert into student_score values('����','����','78.0');
insert into student_score values('����','��ѧ','88.0');
insert into student_score values('����','Ӣ��','98.0');
insert into student_score values('����','����','89.0');
insert into student_score values('����','��ѧ','76.0');
insert into student_score values('����','Ӣ��','90.0');
insert into student_score values('����','����','99.0');
insert into student_score values('����','��ѧ','66.0');
insert into student_score values('����','Ӣ��','91.0');

/**
�����
����   ����   ��ѧ  Ӣ��
����   89     76    90
*/

--decode 
select ss.name ����,
       max(decode(ss.subject, '����', ss.score)) ����,
       max(decode(ss.subject, '��ѧ', ss.score)) ��ѧ,
       max(decode(ss.subject, 'Ӣ��', ss.score)) Ӣ��
  from student_score ss
 group by ss.name;

--case when then end

select ss.name ����,
       max(case ss.subject
             when '����' then
              ss.score
           end) ����,
       max(case ss.subject
             when '��ѧ' then
              ss.score
           end) ��ѧ,
       max(case ss.subject
             when 'Ӣ��' then
              ss.score
           end) Ӣ��
  from student_score ss
 group by ss.name;
 
--join on
--��һ��
select ss.name,ss.score from student_score ss where ss.subject='����';
select ss.name,ss.score from student_score ss where ss.subject='��ѧ';
select ss.name,ss.score from student_score ss where ss.subject='Ӣ��';
--�ڶ���
select ss01.name, ss01.score ����, ss02.score ��ѧ, ss03.score Ӣ��
  from (select ss.name, ss.score
          from student_score ss
         where ss.subject = '����') ss01
  join (select ss.name, ss.score
          from student_score ss
         where ss.subject = '��ѧ') ss02
    on ss01.name = ss02.name
  join (select ss.name, ss.score
          from student_score ss
         where ss.subject = 'Ӣ��') ss03
    on ss01.name = ss03.name;

--union all
select t.name, sum(t.yw) ����, sum(t.sx) ��ѧ, sum(t.yy) Ӣ��
  from (select ss.name, sum(ss.score) yw, sum(0) sx, sum(0) yy
          from student_score ss
         where ss.subject = '����'
         group by ss.name
        union all
        select ss.name, sum(0) yw��sum(ss.score) sx, sum(0) yy
          from student_score ss
         where ss.subject = '��ѧ'
         group by ss.name
        union all
        select ss.name, sum(0) yw, sum(0) sx, sum(ss.score) yy
          from student_score ss
         where ss.subject = 'Ӣ��'
         group by ss.name) t
 group by t.name;
