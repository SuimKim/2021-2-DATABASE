--ch6. ���̺� �����ϱ�
--equl join
select employee.ename, employee.dno, department.dname, department.loc
from employee, department
where employee.dno = department.dno;

--�Ϲ����� ���� ��� (���� ����)
select e.ename, e.dno, d.dname, d.loc
from employee e, department d
where e.dno = d.dno  --���� ����
and e.dno=20;        --�˻� ����

--natural join
select e.ename, dno, d.dname, d.loc
from employee e natural join department d
where dno=20;        --�˻� ����

--join ~ using
select e.ename, dno, d.dname, d.loc
from employee e join department d
using(dno)      --���� ����
where dno=20;   --�˻� ����

--join ~ on (���������� ���� ���� ���� ����)
select e.ename, e.dno, d.dname, d.loc
from employee e join department d
on e.dno = d.dno  --���� ����
where e.dno=20;   --�˻� ����

--non-equl join
--����� �޿��� �޿���� �˻�
select e.ename, e.salary, s.grade 
from employee e, salgrade s
where e.salary between losal and hisal; --���� ����

select e.ename, e.salary, s.grade 
from employee e join salgrade s
on e.salary between losal and hisal; --���� ����

--����̸�, �μ��̸�, �޿�, �޿����
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
--����̸�, ���ӻ���̸� �˻�
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

--ȥ���غ���
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
where e.ename like '%A%';  --�ӵ��� ������

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
select s.ename as �̸�, s.dno as �μ���ȣ, e.ename as ����
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
