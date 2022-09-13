select * from emp;
--查询雇员表中部门编号为10的员工
select empno,ename,job from emp where deptno=10;
--distinct 去除重复数据
select distinct deptno from emp;
--去重也可以针对多个字段，只要有一个不匹配，都算作不同的数据
select distinct deptno,sal from emp;
--在查询过程中，可以给查询列添加别名，也可以给表添加别名
select e.empno 雇员编号,e.ename 雇员名称,e.job 雇员工作 from emp e where e.deptno=10;
--给列添加别名，可以使用as,也可以不使用
select e.empno as 雇员编号,e.ename as 雇员名称,e.job as 雇员工作 from emp e where e.deptno=10;
--给列起别名，如果别名中包含空格，需要使用""整体括起来
select e.empno as "雇员 编号",e.ename as "雇员 名称",e.job as "雇员 工作" from emp e where e.deptno=10;
--查询表中所有字段，不要使用*,容易造成两级IO
select e.empno,e.ename,e.job,e.mgr,e.hiredate,e.sal,e.comm,e.deptno from emp e;


--=
select e.empno,e.ename,e.job,e.deptno from emp e where e.deptno=10;
--!=
select e.empno,e.ename,e.job,e.deptno  from emp e where e.deptno !=10;
--<>,数据库层面的不等于
select e.empno,e.ename,e.job,e.deptno  from emp e where e.deptno <>10;
--<
select e.empno,e.ename,e.job,e.deptno  from emp e where e.deptno <30;
--<=
select e.empno,e.ename,e.job,e.deptno  from emp e where e.deptno <=30;
-->
select e.empno,e.ename,e.job,e.deptno  from emp e where e.deptno >10;
-->=
select e.empno,e.ename,e.job,e.deptno  from emp e where e.deptno >=10;
--any,只要有一个符合条件就算
select * from emp e where e.sal > any(1000,1500,3000);
--some,只要有一个符合条件就算,和any是一样的效果
select * from emp e where e.sal > some(1000,1500,3000);
--all,大于最大的，小于最小的才成了
select * from emp e where e.sal > all(1000,1500,3000);


--is null,is not null
--数据库不能使用=，来判断null
select * from emp e where e.comm=null;
--使用is判断null
select * from emp e where e.comm is null;
select * from emp e where e.comm is not null;
--between x and y，包含头尾
select * from emp e where e.sal between 1500 and 3000;
select * from emp e where e.sal >= 1500 and e.sal<=3000;

--in
select * from emp e where e.deptno in(10,20);
select * from emp e where e.deptno=10 or e.deptno=20;
--not in
select * from emp e where e.deptno not in(10,20);

--exists(sub--query)-子查询
--查询雇员表中部门是10和20的所有雇员信息，使用exists实现
/**
*这里需要注意，exists相当于双重for循环，不管select d.deptno from dept d where d.deptno=10 or d.deptno=20
*查到什么结果，只要能查到结果，条件就成立，所以这里把部门是30的雇员信息也查出来了
*/
select *
  from emp e
 where exists (select d.deptno
          from dept d
         where d.deptno = 10
            or d.deptno = 20);
--对上面的语句进行修改调整，添加筛选条件and e.deptno = d.deptno
select *
  from emp e
 where exists (select d.deptno
          from dept d
         where (d.deptno = 10 or d.deptno = 20)
           and e.deptno = d.deptno);


/**
*like
*_:表示任意字符，只出现一次
*%：任意字符出现在任意位置，任意次数
*escape:转义，转义规则可以任意定义，但不能是%
*/
--查询名字以S开头的雇员信息
select * from emp e where e.ename like ('S%');
--查询名字以K开头，倒数第二个字母是N的雇员信息
select * from emp e where e.ename like ('K%N_');
--模糊查询名字中有%的雇员信息
select * from emp e where e.ename like ('%\%%') escape('\');
select * from emp e where e.ename like ('%a%%') escape('a');


--order by   asc:升序，desc:降序
--数字是自然排序；字符是按字典排序
select * from emp e order by e.sal asc;
select * from emp e order by e.sal desc;
--多个列可以使用不同的排序方式
select * from emp e order by e.sal desc,e.ename desc;


--字符串连接符
select 'my name is '||e.ename name from emp e;
select concat('my name is ',e.ename) name from emp e;
--计算所有雇员的年薪
--为了避免null，引起空计算，使用nvl(arg1,arg2)函数
--nvl(arg1,arg2)函数，如果arg1为null,则返回arg2，如果arg1不为空，则返回arg1
select e.ename, (nvl(e.sal, 0) + nvl(e.comm, 0)) * 12 annualsal from emp e;

--集合A
select * from emp e where e.deptno=30;
--集合B
select * from emp e where e.sal>1000;

--全集:将两个集合中的数据全部展示，不会去重
select *
  from emp e
 where e.deptno = 30
union all
select *
  from emp e
 where e.sal > 1000;
--并集：将两个集合中的数据全部展示，去除重复的
select *
  from emp e
 where e.deptno = 30
union 
select *
  from emp e
 where e.sal > 1000;
--交集：显示两个集合中交叉的数据
 select *
  from emp e
 where e.deptno = 30
intersect
select *
  from emp e
 where e.sal > 1000;
--差集：显示在A集合中存在，在B集合中不存在的数据
--差集和集合顺序有关
 select *
  from emp e
 where e.deptno = 30
minus
select *
  from emp e
 where e.sal > 1000;






