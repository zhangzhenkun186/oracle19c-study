--��oracle�������Ҫ���һ���е��Զ�����������ʹ������
/**
  �﷨��
  create sequence seq_name
  increment by n ÿ����������
  start with n  �Ӷ��ٿ�ʼ
  maxvalue n ||no maxvalue  ���ֵ
  minvalue n ||no minvalue  ��Сֵ
  cycle||nocycle �Ƿ���ѭ��
  cache n|| nocache �Ƿ��л���
*/
--��������
create sequence my_sequence
increment by 1
start with 1;

--ʹ�ã��������������֮��û���κε�ʹ�ã���ô�����Ȼ�ȡnextval�����ܻ�ȡcurrval��ǰֵ
select my_sequence.nextval from dual;
select my_sequence.currval from dual;

--���ӣ�insert into tablename (id,name) values(my_sequence.nextval,'����')��
