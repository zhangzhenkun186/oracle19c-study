/**
*组函数，又称聚合函数，输入多个值，最终返回一个值
*单行函数，输入一个值，最终返回一个值
*/
--查询雇员的薪资综合
select sum(e.sal) from emp e;
--查询记录总条数
select count(*) from emp e;

--concat:字符函数，等同于||
select 'my name is '||e.ename name from emp e;
select concat('my name is ',e.ename) name from emp e;

--initcap:将字符的首字母大写
select initcap(e.ename) from emp e;
--upper:将字符串转化为全部大写
select upper(e.ename) from emp e;
--lower:将字符串转化为全部小写
select lower(e.ename) from emp e;

--lpad:填充字符串,总共10位，字符不够，前面补星
select lpad(e.ename,10,'*') from emp e;
--rpad:填充字符串,总共10位，字符不够，后面补星
select rpad(e.ename,10,'*') from emp e;

--trim:去除左右两边的空格
select trim(e.ename) from emp e;
--trim:去除左边的空格
select ltrim(e.ename) from emp e;
--trim:去除右边的空格
select rtrim(e.ename) from emp e;

--instr:查找指定字符串的位置
select instr(e.ename,'A') from emp e;
--length:查看字符串的长度
select length(e.ename) from emp e;

--截取字符串
select substr(e.ename,0,2) from emp e;
--替换字符串
select replace(e.ename,'A','HH') from emp e;


/**
*数字函数
*/
--round(num,n) 四舍五入
select round(23.652) from dual;--24
select round(23.652,2) from dual;--23.65
select round(23.652,-1) from dual;--20
select round(25.652,-1) from dual;--30
--trunc(num,n) 截取,按位数进行截取，不进行四舍五入
select trunc(23.652) from dual;--23
select trunc(23.652,2) from dual;--23.65
select trunc(23.652,-1) from dual;--20
select trunc(25.652,-1) from dual;--20
--mod(x,y)求余数
select mod(13,5) from dual;--3
select mod(14.36,5) from dual;--4.36
--ceil向上取整
select ceil(19.2) from dual;--20
--floor向下取整
select floor(19.2) from dual;--19
--abs:绝对值
select abs(100),abs(-100) from dual;
--获取正负值--若为正值返回1，负值返回-1，0返回0
select sign(100),sign(-100),sign(0) from dual;
--x的Y次幂
select power(2,3) from dual;

--日期函数
--返回当前日期
select sysdate from dual;
select current_date from dual;
--返回在日期d1基础上再加n1个月后新的日期
select sysdate,add_months(sysdate,3) from dual;
--返回日期d1所在月份最后一天的日期
select sysdate,last_day(sysdate) from dual;
--返回日期d1到日期d2之间的月数
select months_between(sysdate,to_date('2021-09-08','YYYY-MM-dd')) from dual;
--给出日期d1按期间(参数c1)四舍五入后的期间的第一天日期
select sysdate 当时日期,
round(sysdate) 最近0点日期,
round(sysdate,'day') 最近星期日,
round(sysdate,'month') 最近月初,
round(sysdate,'q') 最近季初日期, 
round(sysdate,'year') 最近年初日期 from dual;
--日期/时间d1中，参数(c1)的值
select 
extract(hour from timestamp '2001-2-16 2:38:40 ' ) 小时,
extract(minute from timestamp '2001-2-16 2:38:40 ' ) 分钟,
extract(second from timestamp '2001-2-16 2:38:40 ' ) 秒,
extract(DAY from timestamp '2001-2-16 2:38:40 ' ) 日,
extract(MONTH from timestamp '2001-2-16 2:38:40 ' ) 月,
extract(YEAR from timestamp '2001-2-16 2:38:40 ' ) 年
 from dual;

--返回日期d1在下周，星期几(参数c1)的日期
select next_day(sysdate,'星期一') from dual;
--变动日期时间数值
select
trunc(sysdate)+(interval '1' second), --加1秒(1/24/60/60)
trunc(sysdate)+(interval '1' minute), --加1分钟(1/24/60)
trunc(sysdate)+(interval '1' hour), --加1小时(1/24)
trunc(sysdate)+(INTERVAL '1' DAY),  --加1天(1)
trunc(sysdate)+(INTERVAL '1' MONTH), --加1月
trunc(sysdate)+(INTERVAL '1' YEAR), --加1年
trunc(sysdate)+(interval '01:02:03' hour to second), --加指定小时到秒
trunc(sysdate)+(interval '01:02' minute to second), --加指定分钟到秒
trunc(sysdate)+(interval '01:02' hour to minute), --加指定小时到分钟
trunc(sysdate)+(interval '2 01:02' day to minute) --加指定天数到分钟
from dual;


--转换函数
--隐式转换：在oracle中字符串可以隐式转换为数值或者日期
select '990'+10 from dual;
--date to char
select to_char(sysdate,'YYYY-MM-dd HH24:MI:SS') from dual;
--将字符串X转化为日期型
select to_date('199912','yyyymm'),
to_date('2000.05.20','yyyy.mm.dd'),
(date '2008-12-31') XXdate, 
to_date('2008-12-31 12:31:30','yyyy-mm-dd hh24:mi:ss'),
(timestamp '2008-12-31 12:31:30') XXtimestamp
from dual;
--将字符串X转化为数字型
select TO_NUMBER('199912'),TO_NUMBER('450.05') from dual;


--条件函数  decode ,case  when
drop table test;
create table test(
  id number(10) primary key,
  type number(10),
  t_id number(10),
  value varchar2(10)
);
insert into test values(100,1,1,'张三');
insert into test values(200,2,1,'男');
insert into test values(300,3,1,'50');
insert into test values(101,1,2,'刘二');
insert into test values(201,2,2,'男');
insert into test values(301,3,2,'30');
insert into test values(102,1,3,'刘三');
insert into test values(202,2,3,'女');
insert into test values(302,3,3,'10');


--decode 根据条件返回相应值
--给不同部门的人员涨薪 10部门的涨10%，20部门涨20%，30部门的涨30%,其他部门50%
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
写出一条查询语句，结果如下：
姓名   性别   年龄
----   ----   ----
张三    男     50
*/
select decode(t.type, 1, t.value) as 姓名,
       decode(t.type, 2, t.value) as 性别,
       decode(t.type, 3, t.value) as 年龄
  from test t;
  
select max(decode(t.type, 1, t.value)) as 姓名,
       max(decode(t.type, 2, t.value)) as 性别,
       max(decode(t.type, 3, t.value)) as 年龄
  from test t group by t.t_id;
  
-----组函数
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
--求平均薪水大于2000的部门
--使用group by时，可以指定一个列或者多个列，但select的字段，只能是group by的字段或者是组函数
--group by  必须在where 子句之后，order by之前
select e.deptno,avg(e.sal) from emp e group by e.deptno having avg(e.sal)>2000;
--求部门下雇员工资大于2000的人数
select e.deptno,count(1) from emp e where e.sal>2000 group by e.deptno;
-
