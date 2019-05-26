-- 뷰

-- 1) 사원번호, 사원이름(first_name과 last_name을 빈칸을 넣어 붙여서 EMPOYEE라는 컬럼으로 표시), 부서 번호를 가지는 뷰 EMPLOYEE_VU를 생성하라
Create view EMPLOYEE_VU
AS select employee_id, first_name || ' ' || last_name "EMPLOYEE", department_id
from employees;

-- 2) EMPLOYEE_VU를 이용하여, 사원 이름과 해당 사원이 소속된 부서를 출력하라
select EMPLOYEE, department_id
from EMPLOYEE_VU;

-- 3) 부서 이름, 해당 부서의 평균 급여(컬럼 이름은 AVG_SAL), 부서장 이름을 갖는 뷰인 DEPARTMENT_VU를 생성하라. 뷰를 통해 내용을 확인하라
create view DEPARTMENT_VU as
select department_name, AVG(salary) "AVG_SAL"
from departments d join employees e
on d.department_id = e.department_id
join employees m
on d.manager_id = m.employee_id
group by department_name, m.first_name;
select *
from DEPARTMENT_VU;

-- 4) 80번 부서에 속한 사원만 보이도록 1 번에서 정의된 뷰를 수정하라
create or replace view EMPLOYEE_VU as
select employee_id, first_name || ' ' || last_name "EMPLOYEE", department_id
from employees
where department_id = 80;

-- 5) 3번의 뷰를 삭제하라
drop view department_vu;

-- 인덱스
-- 1) 사원의 성으로 검색되는 경우가 많았다. 검색의 효율을 높일 수 있는 명령을 작성하라.
create index ix_lastname on EMPLOYEES (last_name);

-- 2) WHere 절에서 사원 번호와 부서 번호가 같이 검색되는 경우가 많다. 검색의 효율을 높일 수 있는 명령을 작성하라
create index ix_id on employee (employee_id, department_id);

-- 3) salary가 where 절에서 검색될 때는 항상 salary가 큰 사원부터 작은 사원 순서로 검색되는 경우가 많다고 가정하자. 이를 반영하여 인덱스를 설정하라
create index ix_salary on employees (salary desc);

-- 4) 3에서 설정된 인덱스를 삭제하라
drop index ix_salary;