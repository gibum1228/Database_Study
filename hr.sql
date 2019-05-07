-- 2019.04.11. 201814066 김기범

-- 1) DEPARTMENTS  테이블의 구조를 확인하라
desc departments;

-- 2) DEPARTMENTS 테이블의 모든 내용을 출력하라
select * from departments;

-- 3) 각 사원(employee)의 성(last name), job code, 고용일(hire date), 사원번호(employee number)를 출력하라.
-- 사원 번호가 가장 앞에 나와야 한다. HIRE_DATE는 STARTDATE로 출력하라.
select employee_id, last_name, job_id, hire_date AS "STARTDATE" from employees;

-- 4) 사원들에게 배정된 job code를 출력하라. 중복된 값은 한번만 출력한다
select DISTINCT job_id from employees;

-- 5) 가능한 모든 job code를 출력하라. 사원들에게 배정되지 않은 job code도 출력되어야 한다
select job_id from employees;

-- 6) 사원의 이름, 급여를 출력하라. 각 칼럼의 이름은 Employee, Salary이다. Employee은 성과 이름이 같이 붙어서 하나의 컬럼으로 출력됨
select first_name || last_name AS "Employee", salary as "Salary" from employees;

-- 7) 부서의 이름과 부서 번호를 출력하라
select department_name, department_id from departments;

-- 8) COUNTRIES 테이블에 존재하는 모든 데이터를 출력하라
select * from countries;

-- 9) $12,000 이상 버는 사원의 성과 급여를 출력하라.
select last_name, salary
from employees
where salary >= 12000;

-- 10) 사원 번호 176번인 사원의 성과 이름, 부서 번호를 출력하라.
select last_name, first_name, department_id
from employees
where employee_id = 176;

-- 11) 급여를 $5000 이하 받고 있는 사원의 성과 급여를 출력하라
select last_name, salary
from employees
where salary <= 5000;

-- 12) 급여를 $12000 이상 받고 있는 사원의 성과 이름, 급여, 부서번호를 출력하라
select last_name, first_name, salary, department_id
from employees
where salary >= 12000;

-- 13) 급여를 $5000 이상, $12000 이하로 받고 있는 사람의 사원번호, 성, 급여를 출력하라, 급여가 많은 사람부터 출력되어야 한다.
select employee_id, last_name, salary
from employees
where salary BETWEEN 5000 AND 12000
ORDER BY salary DESC;

-- 14) 성이 Matos이거나 Taylor인 사원의 성과 시작날짜, job code를 출력하라. 고용일이 빠른 사람이 먼저 출력되어야 한다.
select last_name, hire_date, job_id
from employees
where last_name = 'Matos' OR last_name = 'Taylor' /* last_name in ('Matos', 'Taylor')도 가능*/
ORDER BY hire_date;

-- 15) 부서번호 20과 50사이인 사원의 성, 부서번호를 출력하라. 성이 알파벳 역순으로 출력되어야 한다.
select last_name, department_id
from employees
where department_id BETWEEN 20 AND 50
order by last_name DESC;

-- 16) 50번 부서에서 일하는 사원들이 근무하는 job id를 중복 제거하여 출력하라
select DISTINCT job_id
from employees
where department_id = 50;

-- 17) 2003년 또는 2005년에 고용된 사원의 성과 고용일을 출력하라
select last_name, hire_date
from employees
where hire_date between '03/01/01' and '03/12/31' or hire_date between '05/01/01' and '05/12/31';

-- 18) 관리자(Manager)가 없는 사원의 성과 job code를 출력하라
select last_name, job_id
from employees
where manager_id is NULL;

-- 19) Commission을 받고 있는 사원의 사원번호, 급여, commission을 출력하라.
--) Salary로 정렬하되, 같은 salary라면 commission이 커지는 순서로 나와야 한다
select employee_id, salary, commission_pct
from employees
where commission_pct is NOT NULL and commission_pct > 0
order by salary ASC, commission_pct ASC;

-- 20) 급여가 $3000보다 작으면서 부서번호가 100보다 작은 부서에 근무하는 사원의 성, 부서번호, 급여, job code를 출력하라
select last_name, salary, job_id
from employees
where salary < 3000 and department_id < 100;

-- 21) 사원 급여의 최고, 최저, 합, 평균을 구하라.
-- Maximum, Minimum, Sum, Average로 컬럼 이름을 정한다
select max(salary) as "Maximum",
        min(salary) as "Minimum",
        sum(salary) as "Sum",
        avg(salary) as "Average"
from employees;

-- 22) 각 JOB마다 사원 급여의 최고, 최저, 합, 평균을 구하라
-- Maximum, Minimum, Sum, Average로 컬럼 이름을 정한다
select job_id, Max(salary) As "Maximum",
        Min(Salary) As "Minimum",
        SUM(Salary) As "Sum",
        AVG(Salary) As "Average"
from Employees
Group by job_id;

-- 24) MANAGER 역할을 하고 있는 사원의 수를 출력하라
select count(distinct manager_id)
from employees;

-- 25) 급여가 #5000이하인 사원들만 대상으로, 부서번호별 급여의 합을 출력하라
select sum(salary), department_id
from employees
where salary <= 5000
group by department_id;

-- 26) 사원의 수가 5명 이상인 JOB_ID 별로 급여의 최소값을 구하라
select min(salary)
from employees
group by job_id
having count(*) >= 5;

-- 27) 100번 이하 부서에 소속된 사원의 사원번호, 성, 부서번호, 부서명을 출력하라
select employee_id, last_name, department_id, department_name
from employees natural join departments
where department_id <= 100;

-- 28) 모든 부서의 주소를 출력한다. location ID, street address, city, state 또는 province, country를 출력해야한다. NATURAL JOIN을 사용하라
select location_id, street_address, city, state_province, country_id
from departments natural join locations;

-- 29) Toronto에서 근무하는 사원의 last name, job id, department number, department name을 출력하라
select last_name, job_id, employees.department_id, department_name
from locations join departments
on locations.location_id = departments.location_id
join employees
on employees.department_id = departments.department_id
where city = 'Toronto';

-- 32) 사원의 번호, 성, job_code, job_title을 출력하라
select employee_id, last_name, job_title
from employees natural join jobs;

-- 33) 모든 부서의 번호, 이름, 부서장의 성을 출력하라
select d.department_id, d.department_name, e.last_name
from employees e join departments d
on e.employee_id = d.manager_id;

-- 37) job 이력(history)가 있는 사원의 사원 성과 이름, job_history 기록 횟수를 출력하라
select last_name, first_name, count(*)
from employees join job_history
using (employee_id)
group by last_name, first_name;
-- 중간고사 끝)

-- (self join) 34 ~ 37
-- 34) 사원의 번호, 사원의 이름(성과 이름), 관리자의 번호, 관리자의 이름(성과 이름)을 출력하라
--) EMP#, EMP_NAME, MANAGER#, MANAGER_NAME으로 출력한다.
select e.employee_id EMP#, e.last_name || e.first_name EMP_NAME, m.manager_id MANAGER#, m.last_name || m.first_name MANAGER_NAME 
from employees e join employees m
on e.manager_id = m.employee_id;

-- 35) 관리자가 없는 사원을 포함하여, 사원의 번호, 사원의 이름(성과 이름), 관리자의 번호, 관리자의 이름(성과 이름)을 출력하라.
--) EMP#, EMP_NAME, MANAGER#, MANAGER_NAME으로 출력한다.
select e.employee_id EMP#, e.last_name || e.first_name EMP_NAME, m.manager_id MANAGER#, m.last_name || m.first_name MANAGER_NAME 
from employees e left outer join employees m
on e.manager_id = m.employee_id;

-- 36) 사원의 성과 부서 번호 및 주어진 사원과 동일한 부서에 근무하는 모든 사원의 사원번호, 성을 출력하라. 각 열 이름을 적절하게 붙여라
select t.last_name EMP_LN, t.department_id DER_ID, e.employee_id TEAM_EMP_ID, e.last_name TEAM_EMP_LN 
from employees e join employees t
on e.department_id = t.department_id;

-- 37) 담당관리자보다 먼저 채용된 사원의 이름(FIRST_NAME)과 채용날짜, 해당 관리자의 이름(FIRST_NAME)과 채용날짜를 출력하라
select e.first_name EMP_FIRST_NAME, e.hire_date EMP_HIRE_DATE, s.first_name SUPER_FIRST_NAME, s.hire_date SUPER_HIRE_DATE
from employees e join employees s
on e.department_id = s.department_id
where s.hire_date > e.hire_date;

-- (집합연산) 38 ~ 41
-- 38) 소속 사원이 없는 부서의 이름을 출력하라
select department_name
from departments
MINUS
select department_name
from departments
where department_id IN (select department_id
                        from employees);

-- 39) 배당된 사원이 없는 업무의 이름(job_title)을 출력하라
select job_title
from jobs
MINUS
select job_title
from jobs
where job_id IN (select job_id
                from employees);

-- 40) Shipping 부서와 Human Resoures 부서의 부서 이름과 주소(address)를 출력하라. 집합연산을 이용하라
select department_name, Street_address
from departments natural join locations
where department_name = 'Shipping'
UNION
select department_name, street_address
from departments natural join locations
where department_name = 'Human Resoures';

-- 41) IT 부서와 Finance 부서 둘 다가 같이 위치한 Country_ID를 출력하라. 집합연산을 이용한다.
select country_id
from departments natural join locations
where department_name = 'IT'
INTERSECT
select country_id
from departments natural join locations
where department_name = 'Finance';

-- (부속질의) 42 ~ 44
-- 42) 최고의 급여를 받고 있는 사원의 first_name을 출력하라
select e1.first_name
from employees e1
where e1.salary in (select max(salary)
                        from employees e2);

-- 43) 사원의 수가 5명 이상인 부서의 부서 이름을 출력하라
select department_name
from departments d
where 5 <= (select count(*)
            from employees e
            where d.department_id = e.department_id);

-- 44) 업무 이름에 Purchasing이 들어간 업무를 하고 있는 사원의 first_name을 출력하라
select first_name
from employees
where job_id in (select job_id
                from jobs
                where job_title like '%Purchasing%');

-- (Outer Join) 45 ~ 
-- 45) 사원이 소속되지 않은 부서를 포함하여, 부서이름과 해당 부서에 소속된 사원 이름(first_name)을 출력하라
select department_name, first_name
from departments left outer join employees
on departments.department_id = employees.department_id;

-- 46) 업무가 배정되지 않은 사원과 사원이 배정되지 않은 업무를 포함하여, 모든 사원 이름(first_name)과 업무 이름(job_title)을 출력하라
select first_name, job_title
from employees full outer join jobs
on employees.job_id = jobs.job_id;

-- create 문
-- 1)
create table DEPT3(
id NUMBER(7) primary key,
name varchar2(25));

-- 2)
create table EMP3(
id number(7),
last_name varchar2(25),
first_name varchar2(25),
dept_id number(7) references dept3(id)); -- foreign key dept_id references dept3(id)

-- 3)
create table EMPLOYEES2(
id number(6,0),
first_name varchar2(20),
last_name varchar2(25),
salary number(8,2),
dept_id number(4,0));

-- 4) 다음과 같이 긴 성을 입력할 수 있도록 EMP3 테이블을 수정한다.
alter table emp3 modify last_name varchar2(50);

-- 5) emp3 테이블에 loc라는 컬럼을 추가하라. varchar2 데이터 타입이어야 하며, 최대 10의 길이를 가진다. 디폴트 값으로는 'LA'값을 입력한다.
alter table emp3 add LOC varchar2(10) DEFAULT LA;

-- 6) emp3의 loc 컬럼 이름을 loc2로 변경하라
alter table emp3 rename column loc to LOC2;

-- 7) EMPLOYEES2 테이블에서 FIRST_NAME 열을 삭제한다. 삭제되었음을 확인한다.
alter table employees2 drop column first_name;

-- 8) DEPT3 테이블의 ID 컬럼을 삭제한다. 삭제가 불가능하다면, 가능하도록 하라
alter table emp3 drop column dept_id;
alter table dept3 drop column id;

-- 9) emp3 테이블을 삭제하라
drop table emp3;

-- 제한조건
-- 1)
create table DEPT3 as
select *
from departments;
alter table dept3 add constraint my_dept_id_pk primary key(id);

-- 2)

