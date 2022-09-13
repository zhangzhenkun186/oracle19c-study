--关联查询
--查询雇员名称和所属部门名称--等值链接
select e.ename,d.dname from emp e,dept d where e.deptno=d.deptno;
--查询雇员的名称和薪水等级，非等值链接
select e.ename,s.grade from emp e,salgrade s where e.sal between s.losal and s.hisal;
--外连接：左外连接,不带(+)的全显示
select e.ename,d.dname from emp e,dept d where e.deptno=d.deptno(+);
select e.ename,d.dname from emp e left join dept d on e.deptno=d.deptno;
--右外链接
select e.ename,d.dname from emp e,dept d where e.deptno(+)=d.deptno;
select e.ename,d.dname from emp e right join dept d on e.deptno=d.deptno;
--完全外连接
select e.ename,d.dname from emp e full join dept d on e.deptno=d.deptno;
--内连接,查询雇员和他经理的名称
select e.ename,m.ename from emp e inner join emp m on e.mgr=m.empno;

--99语法
--cross join  相当于笛卡尔积--54条记录 14*4
select * from emp cross join dept;
--natural join 等值链接，需要注意的是，不需要写连接条件，会从两张表里自动获取相同的列
--如果找不到相同的列，相当于笛卡尔积
select * from emp natural join dept;
select * from emp natural join salgrade;--笛卡尔积

--on子句，等值连接
select * from emp e join dept d on e.deptno=d.deptno;
--on子句，非等值连接
select * from emp e join salgrade s on e.sal between s.losal and s.hisal;

--left outer join 左外连接
--92 语法
select * from emp e,dept d where e.deptno=d.deptno(+);
--99 语法
select * from emp e left outer join dept d on e.deptno=d.deptno;

--right outer join 左外连接
--92 语法
select * from emp e,dept d where e.deptno(+)=d.deptno;
--99 语法
select * from emp e right outer join dept d on e.deptno=d.deptno;

--full outer join全连接
select * from emp e full outer join dept d on e.deptno=d.deptno;
--inner join 相当于等值连接
select * from emp e inner join dept d on e.deptno=d.deptno;
--inner join 内连接
select * from emp e inner join emp m on e.mgr=m.empno;

--using,除了可以使用on表示连接条件外，还可以使用using标识连接条件
--但是using中的列不在属于任何表，只是作为连接列
select * from emp e join dept d using(deptno);--只有一列deptno
select e.deptno from emp e join dept d using(deptno);--报错，因为deptno,不在属于任何表
select deptno from emp e join dept d using(deptno);--正确
select * from emp e join dept d on e.deptno=d.deptno; --有两列deptno

--子查询
--哪些人的薪水在整个雇员的平均薪水之上
select * from emp e where e.sal>(select avg(sal) from emp);
--查询雇员中哪些是经理人
select * from emp p where p.empno in( select distinct e.mgr from emp e);

--查询部门平均薪水的等级
--先查出部门的平均薪水
select e.deptno,avg(e.sal) from emp e group by e.deptno;
--查询平均薪水的等级
select da.deptno, da.avgsal, s.grade
  from salgrade s,
       (select e.deptno, avg(e.sal) avgsal from emp e group by e.deptno) da
 where da.avgsal between s.losal and s.hisal;
 
select da.deptno, da.avgsal, s.grade
  from salgrade s join 
       (select e.deptno, avg(e.sal) avgsal from emp e group by e.deptno) da
 on da.avgsal between s.losal and s.hisal;
 
--求平均薪水最高的部门
 select p.deptno
   from (select e.deptno, avg(e.sal) vsal from emp e group by e.deptno) p
  where p.vsal = (select max(t.vsal)
                    from (select e.deptno, avg(e.sal) vsal
                            from emp e
                           group by e.deptno) t);
                           
--限制输出、分页，mysql中可以使用limit，但oracle中不支出，可以使用rownum，
--但rownum不能直接使用
--查询薪水最高的前5名
--报错,使用rownum时，必须使用嵌套
select *,rownum from emp e order by e.sal desc where rownum<=5;
--正确,使用rownum时，必须使用嵌套
select t.*,rownum from (select * from emp e order by e.sal desc) t where rownum<=5;
--查询薪水最高的6到10名
select *
  from (select t.*, rownum rn
          from (select * from emp e order by e.sal desc) t
         where rownum <= 10) t1
 where t1.rn > 5
   and t1.rn <= 10;


select *
  from (select t.*, rownum rn
          from (select * from emp e order by e.sal desc) t
        ) t1
 where t1.rn > 5
   and t1.rn <= 10;
