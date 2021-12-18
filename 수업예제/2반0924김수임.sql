--4장 다양한 함수
--일반함수
--null 값 처리 : nvl() / nvl2()
--사원의 연봉 계산하기
select ename, salary, commission, salary*12+nvl(commission, 0) as 연봉
from employee
order by 연봉 desc;

select ename, salary, commission, nvl2(commission, salary*12+commission, salary*12) as 연봉
from employee
order by 4 desc;

--조건 판별하는 switch문 : decode()
--부서 이름 출력하기
select ename, dno, decode(dno, 10, 'ACCOUNTING',
                               20, 'RESARCH',
                               30, 'SALES',
                               40, 'OPERATIONS',
                               'DEFAULT') as 부서명
from employee
order by dno;

--조건 판별하는 if else문 : case문
--부서 이름 출력하기
select ename, dno, case when dno = 10 then 'ACCOUNTING'
                        when dno = 20 then 'RESARCH'
                        when dno = 30 then 'SALES'
                        when dno = 40 then 'OPERATIONS'
                        else 'DEFAULT' 
                        end as 부서명
from employee
order by dno;

--1. substr 함수를 사용하여 사원들이 입사한 년도와 입사한 달만 출력
select hiredate, substr(hiredate, 1, 2) as 년도, substr(hiredate, 4, 2) as 달
from employee;

--2. substr 함수를 사용하여 4월에 입사한 사원만 출력
select *
from employee
where substr(hiredate, 4, 2) = '04';

--3. mod 함수를 사용하여 사원번호가 짝수인 사원만 검색
select *
from employee
where mod(eno, 2) = 0;

--4. 입사일을 연도는 2자리(YY), 월은 숫자(MON)로 표시하고 요일은 약어(DY)로 출력
select hiredate, to_char(hiredate, 'yy/mon/dd dy')
from employee;

--5. 올해 며칠이 지났는지 출력, 올해 며칠이 남았는지 출력
--현재 날짜에서 올해 1월 1일을 뺀 결과를 출력, to_date 함수를 사용하여 데이터형을 일치
select round(sysdate - to_date('2021-01-01', 'yyyy-mm-dd')) as 지난날,
       round(to_date('2021-12-31', 'yyyy-mm-dd') - sysdate) as 남은날
from dual;