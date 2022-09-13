--在oracle中如果需要完成一个列的自动增长，必须使用序列
/**
  语法：
  create sequence seq_name
  increment by n 每次增长多少
  start with n  从多少开始
  maxvalue n ||no maxvalue  最大值
  minvalue n ||no minvalue  最小值
  cycle||nocycle 是否有循环
  cache n|| nocache 是否有缓存
*/
--创建序列
create sequence my_sequence
increment by 1
start with 1;

--使用，如果创建好序列之后，没有任何的使用，那么必须先获取nextval，才能获取currval当前值
select my_sequence.nextval from dual;
select my_sequence.currval from dual;

--例子：insert into tablename (id,name) values(my_sequence.nextval,'张三')；
