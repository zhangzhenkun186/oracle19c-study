--������ͼ
create view v_emp as select * from emp where deptno=30;
--��ѯ��ͼ
select * from v_emp;
--��Ϊ��������ͼ����ֻ����ͼ�����Կ�������ͼ��������ݣ�ִ�гɹ�֮����Ҫ�ֶ��ύ����-ͬʱ����Ҳ��洢����������
--������ύ����Ҳ�ܲ�ѯ�����ݣ�����ֻ���ڵ�ǰ�Ự������Ч����һ���Ի���Ͳ�ѯ���������ˣ���û��������Ч
insert into v_emp (empno,ename) values(1111,'zhangsan');

--����ֻ����ͼ
create view v_emp2 as select * from emp where deptno=30 with read only;
--ֻ����ͼ�����޸ġ��������ݣ��ᱨ��
insert into v_emp2 (empno,ename) values(1111,'zhangsan');--����

--ɾ����ͼ
drop view v_emp2;
