--��ѯ�û�
select username from dba_users;
--һ��oracle 19c�û���
--sys change_on_install  sysdba
--system no authentication sysdba
--�����û�
create user zzk123 identified by zzk;
--��Ȩ
grant dba,connect,resource,create view to zzk;
grant create session to zzk;
grant select any table to zzk;
grant update any table to zzk;
grant insert any table to zzk;
grant delete any table to zzk;
