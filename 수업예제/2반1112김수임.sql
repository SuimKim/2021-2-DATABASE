--ch07 서브쿼리

--SCOTT과 동일한 부서에서 근무하는 사원 검색
select ename, dno
from employee
where dno = ( select dno
              from employee
              where ename = 'SCOTT' );
              
--최소급여를 받는 사원의 이름, 담당 업무, 급여 검색
select ename, job, salary
from employee
where salary = ( select min(salary)
                 from employee );
                 
--30번 부서에서 최소급여를 구한 후,
--부서별 최소급여가 구한 최소급여보다 큰 부서만 검색
select dno, min(salary)
from employee
group by dno
having min(salary) > ( select min(salary)
                      from employee
                      where dno=30 );
                      
--다중 행 서브 쿼리
--부서별 최소 급여를 받는 사원의 이름 검색
select ename, salary, dno
from employee
where salary in ( select min(salary)
                 from employee
                 group by dno );
                 
--직급이 SALESMAN이 아니면서 급여가 임의의 SALESMAN보다 낮은 사원
select ename, job, salary
from employee
where salary < any ( select salary
                     from employee
                     where job= 'SALESMAN' )
and job != 'SALESMAN';

--직급이 SALESMAN이 아니면서 급여가 모든 SALESMAN보다 낮은 사원
select ename, job, salary
from employee
where salary < all ( select salary
                     from employee
                     where job= 'SALESMAN' )
and job != 'SALESMAN';


--혼자해보기
--1.
select ename, job
from employee
where job = ( select job
              from employee
              where eno = 7788);
              
--2.
select ename, job
from employee
where salary > (select salary
                from employee
                where eno = 7499 );
                
--3.
select ename, job, salary
from employee
where salary = ( select min(salary)
                from employee );
                
--4.
select job, round(avg(salary),1)
from employee
group by job
having round(avg(salary),1) = (select min(round(avg(salary),1))
                              from employee
                              group by job);

--5.
select ename, salary, dno
from employee
where salary in (select min(salary)
                 from employee
                 group by dno);
--6.
select eno, ename, job, salary
from employee
where salary < any ( select salary
                  from employee
                  where job= 'ANALYST' )
and job != 'ANALYST';

--9.
select ename, hiredate
from employee
where dno = ( select dno
              from employee
              where ename = 'BLAKE' )
and ename != 'BLAKE';

--10.
select eno, ename
from employee
where salary > (select avg(salary)
                from employee)
order by salary;

--11.
select eno, ename
from employee
where dno in (select dno
             from employee
             where ename like '%K%');
             
--12.
select ename, dno, job
from employee
where dno = (select dno
             from department
             where loc = 'DALLAS');
             
--13.
select ename, salary
from employee
where manager = (select eno
                 from employee
                 where ename = 'KING');

--14.
select dno, ename, job
from employee
where dno = (select dno
             from department
             where dname = 'RESEARCH');
             
--15.
select eno, ename, salary
from employee
where salary > (select avg(salary)
                from employee)
and dno in (select dno
            from employee
            where ename like '%M%');
            
--16.
select job, avg(salary)
from employee
group by job
having avg(salary) = (select min(avg(salary))
                      from employee
                      group by job);




                

