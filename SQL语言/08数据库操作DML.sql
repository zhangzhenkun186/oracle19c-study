--数据库增、删、改操作
--创建表的其他方式
--复制表结构和数据，不会复制约束（主键、外键等）
create table emp2 as  select * from emp;
--只复制表结构，不会复制约束（主键、外键等）
create table emp3 as  select * from emp where 1=2;

--删除,同样提交数据
delete from  emp2 e where e.empno=11111;
--清空表
--truncate不需要经过事务，一旦删除，永久删除，不可回复，慎用
truncate table emp2;


--修改
update emp2 e set e.ename='李四' ,e.sal=10000.00 where e.empno=1111;

--事务是为了保持数据一致性
