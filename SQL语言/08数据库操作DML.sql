--���ݿ�����ɾ���Ĳ���
--�������������ʽ
--���Ʊ�ṹ�����ݣ����Ḵ��Լ��������������ȣ�
create table emp2 as  select * from emp;
--ֻ���Ʊ�ṹ�����Ḵ��Լ��������������ȣ�
create table emp3 as  select * from emp where 1=2;

--ɾ��,ͬ���ύ����
delete from  emp2 e where e.empno=11111;
--��ձ�
--truncate����Ҫ��������һ��ɾ��������ɾ�������ɻظ�������
truncate table emp2;


--�޸�
update emp2 e set e.ename='����' ,e.sal=10000.00 where e.empno=1111;

--������Ϊ�˱�������һ����
