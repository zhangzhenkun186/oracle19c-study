--������ѯ
--��ѯ��Ա���ƺ�������������--��ֵ����
select e.ename,d.dname from emp e,dept d where e.deptno=d.deptno;
--��ѯ��Ա�����ƺ�нˮ�ȼ����ǵ�ֵ����
select e.ename,s.grade from emp e,salgrade s where e.sal between s.losal and s.hisal;
--�����ӣ���������,����(+)��ȫ��ʾ
select e.ename,d.dname from emp e,dept d where e.deptno=d.deptno(+);
select e.ename,d.dname from emp e left join dept d on e.deptno=d.deptno;
--��������
select e.ename,d.dname from emp e,dept d where e.deptno(+)=d.deptno;
select e.ename,d.dname from emp e right join dept d on e.deptno=d.deptno;
--��ȫ������
select e.ename,d.dname from emp e full join dept d on e.deptno=d.deptno;
--������,��ѯ��Ա�������������
select e.ename,m.ename from emp e inner join emp m on e.mgr=m.empno;

--99�﷨
--cross join  �൱�ڵѿ�����--54����¼ 14*4
select * from emp cross join dept;
--natural join ��ֵ���ӣ���Ҫע����ǣ�����Ҫд����������������ű����Զ���ȡ��ͬ����
--����Ҳ�����ͬ���У��൱�ڵѿ�����
select * from emp natural join dept;
select * from emp natural join salgrade;--�ѿ�����

--on�Ӿ䣬��ֵ����
select * from emp e join dept d on e.deptno=d.deptno;
--on�Ӿ䣬�ǵ�ֵ����
select * from emp e join salgrade s on e.sal between s.losal and s.hisal;

--left outer join ��������
--92 �﷨
select * from emp e,dept d where e.deptno=d.deptno(+);
--99 �﷨
select * from emp e left outer join dept d on e.deptno=d.deptno;

--right outer join ��������
--92 �﷨
select * from emp e,dept d where e.deptno(+)=d.deptno;
--99 �﷨
select * from emp e right outer join dept d on e.deptno=d.deptno;

--full outer joinȫ����
select * from emp e full outer join dept d on e.deptno=d.deptno;
--inner join �൱�ڵ�ֵ����
select * from emp e inner join dept d on e.deptno=d.deptno;
--inner join ������
select * from emp e inner join emp m on e.mgr=m.empno;

--using,���˿���ʹ��on��ʾ���������⣬������ʹ��using��ʶ��������
--����using�е��в��������κα�ֻ����Ϊ������
select * from emp e join dept d using(deptno);--ֻ��һ��deptno
select e.deptno from emp e join dept d using(deptno);--������Ϊdeptno,���������κα�
select deptno from emp e join dept d using(deptno);--��ȷ
select * from emp e join dept d on e.deptno=d.deptno; --������deptno

--�Ӳ�ѯ
--��Щ�˵�нˮ��������Ա��ƽ��нˮ֮��
select * from emp e where e.sal>(select avg(sal) from emp);
--��ѯ��Ա����Щ�Ǿ�����
select * from emp p where p.empno in( select distinct e.mgr from emp e);

--��ѯ����ƽ��нˮ�ĵȼ�
--�Ȳ�����ŵ�ƽ��нˮ
select e.deptno,avg(e.sal) from emp e group by e.deptno;
--��ѯƽ��нˮ�ĵȼ�
select da.deptno, da.avgsal, s.grade
  from salgrade s,
       (select e.deptno, avg(e.sal) avgsal from emp e group by e.deptno) da
 where da.avgsal between s.losal and s.hisal;
 
select da.deptno, da.avgsal, s.grade
  from salgrade s join 
       (select e.deptno, avg(e.sal) avgsal from emp e group by e.deptno) da
 on da.avgsal between s.losal and s.hisal;
 
--��ƽ��нˮ��ߵĲ���
 select p.deptno
   from (select e.deptno, avg(e.sal) vsal from emp e group by e.deptno) p
  where p.vsal = (select max(t.vsal)
                    from (select e.deptno, avg(e.sal) vsal
                            from emp e
                           group by e.deptno) t);
                           
--�����������ҳ��mysql�п���ʹ��limit����oracle�в�֧��������ʹ��rownum��
--��rownum����ֱ��ʹ��
--��ѯнˮ��ߵ�ǰ5��
--����,ʹ��rownumʱ������ʹ��Ƕ��
select *,rownum from emp e order by e.sal desc where rownum<=5;
--��ȷ,ʹ��rownumʱ������ʹ��Ƕ��
select t.*,rownum from (select * from emp e order by e.sal desc) t where rownum<=5;
--��ѯнˮ��ߵ�6��10��
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
