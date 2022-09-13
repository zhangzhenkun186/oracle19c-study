--查询用户
select username from dba_users;
--一、oracle 19c用户：
--sys change_on_install  sysdba
--system no authentication sysdba
--创建用户
create user zzk123 identified by zzk;
--授权
grant dba,connect,resource,create view to zzk;
grant create session to zzk;
grant select any table to zzk;
grant update any table to zzk;
grant insert any table to zzk;
grant delete any table to zzk;
