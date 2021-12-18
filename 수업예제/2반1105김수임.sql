--ch6. 테이블 조인하기
--equl join
select employee.ename, employee.dno, department.dname, department.loc
from employee, department
where employee.dno = department.dno;

--일반적인 조인 방법 (많이 사용됨)
select e.ename, e.dno, d.dname, d.loc
from employee e, department d
where e.dno = d.dno  --조인 조건
and e.dno=20;        --검색 조건

--natural join
select e.ename, dno, d.dname, d.loc
from employee e natural join department d
where dno=20;        --검색 조건

--join ~ using
select e.ename, dno, d.dname, d.loc
from employee e join department d
using(dno)      --조인 조건
where dno=20;   --검색 조건

--join ~ on (성능적으로 가장 좋고 많이 사용됨)
select e.ename, e.dno, d.dname, d.loc
from employee e join department d
on e.dno = d.dno  --조인 조건
where e.dno=20;   --검색 조건

--non-equl join
--사원의 급여와 급여등급 검색
select e.ename, e.salary, s.grade 
from employee e, salgrade s
where e.salary between losal and hisal; --조인 조건

select e.ename, e.salary, s.grade 
from employee e join salgrade s
on e.salary between losal and hisal; --조인 조건

--사원이름, 부서이름, 급여, 급여등급
select e.ename, d.dname, e.salary, s.grade
from employee e, department d, salgrade s
where e.dno = d.dno
and e.salary between losal and hisal;

select e.ename, d.dname, e.salary, s.grade
from employee e join department d 
on e.dno = d.dno
join salgrade s
on e.salary between losal and hisal;

--self join
--사원이름, 직속상관이름 검색
select e.ename, m.ename
from employee e, employee m
where e.manager = m.eno;

select e.ename, m.ename
from employee e join employee m
on e.manager = m.eno;

--outer join
select e.ename, m.ename
from employee e left outer join employee m
on e.manager = m.eno;

--혼자해보기
--1
select e.ename, e.dno, d.dname
from employee e, department d
where e.dno = d.dno
and e.ename = 'SCOTT';

--2.
select e.ename, d.dname, d.loc
from employee e join department d
on e.dno= d.dno;

--3.
select dno, e.job, d.loc
from employee e join department d
using(dno)
where dno = 10;

--4.
select e.ename, d.dname, d.loc
from employee e natural join department d
where loc = 'CHICAGO'
and e.commission>0; 

--5.
select e.ename, d.dname
from employee e, department d
where e.dno=d.dno
and e.ename like '%A%';

select e.ename, d.dname
from employee e join department d
on e.dno=d.dno
where e.ename like '%A%';  --속도가 빠르다

--6.
select ename, job, dno, dname
from employee e natural join department d
where loc='NEW YORK';

--8.
select e.ename as Employee, e.eno as Emp#, m.eno as Manager, m.ename as Mgr#
from employee e left outer join employee m
on e.manager = m.eno
order by e.eno desc;

--9.
select s.ename as 이름, s.dno as 부서번호, e.ename as 동료
from employee s, employee e
where s.dno = e.dno
and s.ename = 'SCOTT'
and e.ename != 'SCOTT';

--10.
select d.ename, d.hiredate
from employee e join employee d
on e.hiredate < d.hiredate
where e.ename = 'WARD'
order by 2;

--11.
select e.ename, e.hiredate, d.ename, d.hiredate
from employee e join employee d
on e.manager = d.eno
where e.hiredate < d.hiredate;
