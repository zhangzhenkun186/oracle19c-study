--创建视图
create view v_emp as select * from emp where deptno=30;
--查询视图
select * from v_emp;
--因为创建的视图不是只读视图，所以可以向视图中添加数据，执行成功之后，需要手动提交事务-同时数据也会存储到基础表中
--如果不提交事务，也能查询到数据，但是只是在当前会话框中生效，换一个对话框就查询不到数据了，并没有永久生效
insert into v_emp (empno,ename) values(1111,'zhangsan');

--创建只读视图
create view v_emp2 as select * from emp where deptno=30 with read only;
--只读视图不能修改、插入数据，会报错
insert into v_emp2 (empno,ename) values(1111,'zhangsan');--报错

--删除视图
drop view v_emp2;
