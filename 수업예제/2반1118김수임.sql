--ch08. 테이블 생성 / 수정 / 제거하기
--테이블 구조를 만드는 create table문
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

--테이블 구조를 변경하는 alter table문
--칼럼 추가
alter table dept20
add(birth date);

--칼럼 변경
alter table dept20
modify ename varchar2(30);

--칼럼 제거
alter table dept20
drop column ename;

--테이블명을 변경하는 rename문
rename dept20 to emp20;

--테이블 구조를 제거하는 drop table문
drop table emp20;

--테이블의 모든 데이터를 제거하는 truncate table문
truncate table dept2;

--ch10. 데이터 무결성과 제약조건
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
