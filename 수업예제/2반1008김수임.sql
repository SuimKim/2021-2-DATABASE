--5장 그룹함수 혼자해보기
--1. 급여 최고액, 최저액, 총액, 평균액 출력하기
--평균은 정수로 반올림
select max(salary) as Maximum, min(salary) as Minimum,
       sum(salary) as Sum, round(avg(salary)) as Average
from employee;

--2. 담당업무(직급) 유형별로 최고액, 최저액, 총액, 평균액 출력하기
--별칭 동일하게 하고, 평균은 점수로 반올림
select job, max(salary) as Maximum, min(salary) as Minimum,
            sum(salary) as Sum, round(avg(salary)) as Average
from employee
group by job;

--3. 담당업무(직급)별 사원수 구하기
select job, count(*)
from employee
group by job;

--4. 직속상관을 알고 있는 사원의 수 구하기
select count(manager)
from employee;

--5. 급여의 최고액과 최저액의 차액 구하기
select max(salary)-min(salary) as difference
from employee;

--6. 직급별 사원의 급여 최저액 구하기
--최저 급여가 2000 미만은 제외하고, 급여에 대한 내림차순으로 정렬
select job, min(salary)
from employee
group by job
having max(salary) >= 2000
order by 2 desc;

--7. 각부서에 대해 부서번호, 사원수, 부서 내의 모든 사원의 평균 급여 구하기
--평균 급여는 소수점 둘째 자리로 반올림
select dno, count(*) as "Number of People", round(avg(salary),2) as Salary
from employee
group by dno
order by dno;

--8. 각 부서에 대해 부서번호 이름, 지역명, 사원수, 부서내의 모든 사원의 평균 급여 구하기
--별칭 동일하게 하고 평균 급여는 정수로 반올림
select decode(dno, 10, 'ACCOUNTING',
                   20, 'RESEARCH',
                   30, 'SALES',
                   40, 'OPERATIONS') as dname,
       decode(dno, 10, 'NEW YORK',
                   20, 'DALLAS',
                   30, 'CHICAGO',
                   40, 'BOSTON') as Location,           
        count(*), round(avg(salary))
from employee
group by dno;


--9. 직급을 표시한 다음 해당 직급에 대해 부서번호별 급여, 부서 10, 20, 30의 급여 총액 구하기
--별칭 동일하게 하기
select job, dno, 
       decode(dno, 10, sum(salary)) as "부서 10",
       decode(dno, 20, sum(salary)) as "부서 20",
       decode(dno, 30, sum(salary)) as "부서 30",
       sum(salary)
from employee
group by job, dno
order by dno;