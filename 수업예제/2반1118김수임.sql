--ch08. ���̺� ���� / ���� / �����ϱ�
--���̺� ������ ����� create table��
create table dept ( dno number(2),
                    dname varchar2(14),
                    loc varchar2(13) );
        
create table dept2
as
select *
from department;

create table dept3
as
select *
from department
where 0=1;

create table dept20
as
select eno, ename, salary*12 as annal
from employee
where dno = 20;

--���̺� ������ �����ϴ� alter table��
--Į�� �߰�
alter table dept20
add(birth date);

--Į�� ����
alter table dept20
modify ename varchar2(30);

--Į�� ����
alter table dept20
drop column ename;

--���̺���� �����ϴ� rename��
rename dept20 to emp20;

--���̺� ������ �����ϴ� drop table��
drop table emp20;

--���̺��� ��� �����͸� �����ϴ� truncate table��
truncate table dept2;

--ch10. ������ ���Ἲ�� ��������
create table customer(
    id varchar(20) CONSTRAINT customer_id_pk PRIMARY KEY,
    pwd varchar(20) CONSTRAINT customer_pwd_nn not null,
    name varchar(20) CONSTRAINT customer_name_nn not null,
    phone  varchar(30),
    address varchar(100));
    
create table emp2(
    eno number(4) CONSTRAINT emp2_eno_pk PRIMARY KEY,
    enmae varchar(10) CONSTRAINT emp2_ename_nn not null,
    job varchar(9),
    dno number(2) constraint emp2_dno_fk reference);
