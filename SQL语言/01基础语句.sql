select * from emp;
--��ѯ��Ա���в��ű��Ϊ10��Ա��
select empno,ename,job from emp where deptno=10;
--distinct ȥ���ظ�����
select distinct deptno from emp;
--ȥ��Ҳ������Զ���ֶΣ�ֻҪ��һ����ƥ�䣬��������ͬ������
select distinct deptno,sal from emp;
--�ڲ�ѯ�����У����Ը���ѯ����ӱ�����Ҳ���Ը�����ӱ���
select e.empno ��Ա���,e.ename ��Ա����,e.job ��Ա���� from emp e where e.deptno=10;
--������ӱ���������ʹ��as,Ҳ���Բ�ʹ��
select e.empno as ��Ա���,e.ename as ��Ա����,e.job as ��Ա���� from emp e where e.deptno=10;
--�������������������а����ո���Ҫʹ��""����������
select e.empno as "��Ա ���",e.ename as "��Ա ����",e.job as "��Ա ����" from emp e where e.deptno=10;
--��ѯ���������ֶΣ���Ҫʹ��*,�����������IO
select e.empno,e.ename,e.job,e.mgr,e.hiredate,e.sal,e.comm,e.deptno from emp e;


--=
select e.empno,e.ename,e.job,e.deptno from emp e where e.deptno=10;
--!=
select e.empno,e.ename,e.job,e.deptno  from emp e where e.deptno !=10;
--<>,���ݿ����Ĳ�����
select e.empno,e.ename,e.job,e.deptno  from emp e where e.deptno <>10;
--<
select e.empno,e.ename,e.job,e.deptno  from emp e where e.deptno <30;
--<=
select e.empno,e.ename,e.job,e.deptno  from emp e where e.deptno <=30;
-->
select e.empno,e.ename,e.job,e.deptno  from emp e where e.deptno >10;
-->=
select e.empno,e.ename,e.job,e.deptno  from emp e where e.deptno >=10;
--any,ֻҪ��һ��������������
select * from emp e where e.sal > any(1000,1500,3000);
--some,ֻҪ��һ��������������,��any��һ����Ч��
select * from emp e where e.sal > some(1000,1500,3000);
--all,�������ģ�С����С�Ĳų���
select * from emp e where e.sal > all(1000,1500,3000);


--is null,is not null
--���ݿⲻ��ʹ��=�����ж�null
select * from emp e where e.comm=null;
--ʹ��is�ж�null
select * from emp e where e.comm is null;
select * from emp e where e.comm is not null;
--between x and y������ͷβ
select * from emp e where e.sal between 1500 and 3000;
select * from emp e where e.sal >= 1500 and e.sal<=3000;

--in
select * from emp e where e.deptno in(10,20);
select * from emp e where e.deptno=10 or e.deptno=20;
--not in
select * from emp e where e.deptno not in(10,20);

--exists(sub--query)-�Ӳ�ѯ
--��ѯ��Ա���в�����10��20�����й�Ա��Ϣ��ʹ��existsʵ��
/**
*������Ҫע�⣬exists�൱��˫��forѭ��������select d.deptno from dept d where d.deptno=10 or d.deptno=20
*�鵽ʲô�����ֻҪ�ܲ鵽����������ͳ�������������Ѳ�����30�Ĺ�Ա��ϢҲ�������
*/
select *
  from emp e
 where exists (select d.deptno
          from dept d
         where d.deptno = 10
            or d.deptno = 20);
--��������������޸ĵ��������ɸѡ����and e.deptno = d.deptno
select *
  from emp e
 where exists (select d.deptno
          from dept d
         where (d.deptno = 10 or d.deptno = 20)
           and e.deptno = d.deptno);


/**
*like
*_:��ʾ�����ַ���ֻ����һ��
*%�������ַ�����������λ�ã��������
*escape:ת�壬ת�����������ⶨ�壬��������%
*/
--��ѯ������S��ͷ�Ĺ�Ա��Ϣ
select * from emp e where e.ename like ('S%');
--��ѯ������K��ͷ�������ڶ�����ĸ��N�Ĺ�Ա��Ϣ
select * from emp e where e.ename like ('K%N_');
--ģ����ѯ��������%�Ĺ�Ա��Ϣ
select * from emp e where e.ename like ('%\%%') escape('\');
select * from emp e where e.ename like ('%a%%') escape('a');


--order by   asc:����desc:����
--��������Ȼ�����ַ��ǰ��ֵ�����
select * from emp e order by e.sal asc;
select * from emp e order by e.sal desc;
--����п���ʹ�ò�ͬ������ʽ
select * from emp e order by e.sal desc,e.ename desc;


--�ַ������ӷ�
select 'my name is '||e.ename name from emp e;
select concat('my name is ',e.ename) name from emp e;
--�������й�Ա����н
--Ϊ�˱���null������ռ��㣬ʹ��nvl(arg1,arg2)����
--nvl(arg1,arg2)���������arg1Ϊnull,�򷵻�arg2�����arg1��Ϊ�գ��򷵻�arg1
select e.ename, (nvl(e.sal, 0) + nvl(e.comm, 0)) * 12 annualsal from emp e;

--����A
select * from emp e where e.deptno=30;
--����B
select * from emp e where e.sal>1000;

--ȫ��:�����������е�����ȫ��չʾ������ȥ��
select *
  from emp e
 where e.deptno = 30
union all
select *
  from emp e
 where e.sal > 1000;
--�����������������е�����ȫ��չʾ��ȥ���ظ���
select *
  from emp e
 where e.deptno = 30
union 
select *
  from emp e
 where e.sal > 1000;
--��������ʾ���������н��������
 select *
  from emp e
 where e.deptno = 30
intersect
select *
  from emp e
 where e.sal > 1000;
--�����ʾ��A�����д��ڣ���B�����в����ڵ�����
--��ͼ���˳���й�
 select *
  from emp e
 where e.deptno = 30
minus
select *
  from emp e
 where e.sal > 1000;






