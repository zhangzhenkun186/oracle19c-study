/**
*�麯�����ֳƾۺϺ�����������ֵ�����շ���һ��ֵ
*���к���������һ��ֵ�����շ���һ��ֵ
*/
--��ѯ��Ա��н���ۺ�
select sum(e.sal) from emp e;
--��ѯ��¼������
select count(*) from emp e;

--concat:�ַ���������ͬ��||
select 'my name is '||e.ename name from emp e;
select concat('my name is ',e.ename) name from emp e;

--initcap:���ַ�������ĸ��д
select initcap(e.ename) from emp e;
--upper:���ַ���ת��Ϊȫ����д
select upper(e.ename) from emp e;
--lower:���ַ���ת��Ϊȫ��Сд
select lower(e.ename) from emp e;

--lpad:����ַ���,�ܹ�10λ���ַ�������ǰ�油��
select lpad(e.ename,10,'*') from emp e;
--rpad:����ַ���,�ܹ�10λ���ַ����������油��
select rpad(e.ename,10,'*') from emp e;

--trim:ȥ���������ߵĿո�
select trim(e.ename) from emp e;
--trim:ȥ����ߵĿո�
select ltrim(e.ename) from emp e;
--trim:ȥ���ұߵĿո�
select rtrim(e.ename) from emp e;

--instr:����ָ���ַ�����λ��
select instr(e.ename,'A') from emp e;
--length:�鿴�ַ����ĳ���
select length(e.ename) from emp e;

--��ȡ�ַ���
select substr(e.ename,0,2) from emp e;
--�滻�ַ���
select replace(e.ename,'A','HH') from emp e;


/**
*���ֺ���
*/
--round(num,n) ��������
select round(23.652) from dual;--24
select round(23.652,2) from dual;--23.65
select round(23.652,-1) from dual;--20
select round(25.652,-1) from dual;--30
--trunc(num,n) ��ȡ,��λ�����н�ȡ����������������
select trunc(23.652) from dual;--23
select trunc(23.652,2) from dual;--23.65
select trunc(23.652,-1) from dual;--20
select trunc(25.652,-1) from dual;--20
--mod(x,y)������
select mod(13,5) from dual;--3
select mod(14.36,5) from dual;--4.36
--ceil����ȡ��
select ceil(19.2) from dual;--20
--floor����ȡ��
select floor(19.2) from dual;--19
--abs:����ֵ
select abs(100),abs(-100) from dual;
--��ȡ����ֵ--��Ϊ��ֵ����1����ֵ����-1��0����0
select sign(100),sign(-100),sign(0) from dual;
--x��Y����
select power(2,3) from dual;

--���ں���
--���ص�ǰ����
select sysdate from dual;
select current_date from dual;
--����������d1�������ټ�n1���º��µ�����
select sysdate,add_months(sysdate,3) from dual;
--��������d1�����·����һ�������
select sysdate,last_day(sysdate) from dual;
--��������d1������d2֮�������
select months_between(sysdate,to_date('2021-09-08','YYYY-MM-dd')) from dual;
--��������d1���ڼ�(����c1)�����������ڼ�ĵ�һ������
select sysdate ��ʱ����,
round(sysdate) ���0������,
round(sysdate,'day') ���������,
round(sysdate,'month') ����³�,
round(sysdate,'q') �����������, 
round(sysdate,'year') ���������� from dual;
--����/ʱ��d1�У�����(c1)��ֵ
select 
extract(hour from timestamp '2001-2-16 2:38:40 ' ) Сʱ,
extract(minute from timestamp '2001-2-16 2:38:40 ' ) ����,
extract(second from timestamp '2001-2-16 2:38:40 ' ) ��,
extract(DAY from timestamp '2001-2-16 2:38:40 ' ) ��,
extract(MONTH from timestamp '2001-2-16 2:38:40 ' ) ��,
extract(YEAR from timestamp '2001-2-16 2:38:40 ' ) ��
 from dual;

--��������d1�����ܣ����ڼ�(����c1)������
select next_day(sysdate,'����һ') from dual;
--�䶯����ʱ����ֵ
select
trunc(sysdate)+(interval '1' second), --��1��(1/24/60/60)
trunc(sysdate)+(interval '1' minute), --��1����(1/24/60)
trunc(sysdate)+(interval '1' hour), --��1Сʱ(1/24)
trunc(sysdate)+(INTERVAL '1' DAY),  --��1��(1)
trunc(sysdate)+(INTERVAL '1' MONTH), --��1��
trunc(sysdate)+(INTERVAL '1' YEAR), --��1��
trunc(sysdate)+(interval '01:02:03' hour to second), --��ָ��Сʱ����
trunc(sysdate)+(interval '01:02' minute to second), --��ָ�����ӵ���
trunc(sysdate)+(interval '01:02' hour to minute), --��ָ��Сʱ������
trunc(sysdate)+(interval '2 01:02' day to minute) --��ָ������������
from dual;


--ת������
--��ʽת������oracle���ַ���������ʽת��Ϊ��ֵ��������
select '990'+10 from dual;
--date to char
select to_char(sysdate,'YYYY-MM-dd HH24:MI:SS') from dual;
--���ַ���Xת��Ϊ������
select to_date('199912','yyyymm'),
to_date('2000.05.20','yyyy.mm.dd'),
(date '2008-12-31') XXdate, 
to_date('2008-12-31 12:31:30','yyyy-mm-dd hh24:mi:ss'),
(timestamp '2008-12-31 12:31:30') XXtimestamp
from dual;
--���ַ���Xת��Ϊ������
select TO_NUMBER('199912'),TO_NUMBER('450.05') from dual;


--��������  decode ,case  when
drop table test;
create table test(
  id number(10) primary key,
  type number(10),
  t_id number(10),
  value varchar2(10)
);
insert into test values(100,1,1,'����');
insert into test values(200,2,1,'��');
insert into test values(300,3,1,'50');
insert into test values(101,1,2,'����');
insert into test values(201,2,2,'��');
insert into test values(301,3,2,'30');
insert into test values(102,1,3,'����');
insert into test values(202,2,3,'Ů');
insert into test values(302,3,3,'10');


--decode ��������������Ӧֵ
--����ͬ���ŵ���Ա��н 10���ŵ���10%��20������20%��30���ŵ���30%,��������50%
select e.ename,e.sal,e.deptno,decode(e.deptno,10,e.sal*1.1,20,e.sal*1.2,30,e.sal*1.3,e.sal*1.5) zxz from emp e;
--case when then
select e.ename,
       e.sal,
       e.deptno,
       case     e.deptno 
       when     10 then e.sal * 1.1
       when     20 then e.sal * 1.2
       when     30 then e.sal * 1.3 
       end
  from emp e;
  
select * from test;
/*
д��һ����ѯ��䣬������£�
����   �Ա�   ����
----   ----   ----
����    ��     50
*/
select decode(t.type, 1, t.value) as ����,
       decode(t.type, 2, t.value) as �Ա�,
       decode(t.type, 3, t.value) as ����
  from test t;
  
select max(decode(t.type, 1, t.value)) as ����,
       max(decode(t.type, 2, t.value)) as �Ա�,
       max(decode(t.type, 3, t.value)) as ����
  from test t group by t.t_id;
  
-----�麯��
--avg()
select e.deptno,avg(e.sal) from emp e group by e.deptno;
select e.deptno,avg(nvl(e.sal,0)) from emp e group by e.deptno;
--sum()
select e.deptno,sum(e.sal) from emp e group by e.deptno;
--min()
select e.deptno,min(e.sal) from emp e group by e.deptno;
--max()
select e.deptno,max(e.sal) from emp e group by e.deptno;
--count()
select e.deptno,count(e.sal) from emp e group by e.deptno;
--having
--��ƽ��нˮ����2000�Ĳ���
--ʹ��group byʱ������ָ��һ���л��߶���У���select���ֶΣ�ֻ����group by���ֶλ������麯��
--group by  ������where �Ӿ�֮��order by֮ǰ
select e.deptno,avg(e.sal) from emp e group by e.deptno having avg(e.sal)>2000;
--�����¹�Ա���ʴ���2000������
select e.deptno,count(1) from emp e where e.sal>2000 group by e.deptno;
-
