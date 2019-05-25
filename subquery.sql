-- 부속질의

-- 서브쿼리
-- 1) 부서 이름별 사원의 최고 급여를 출력하라. (스칼라 부속질의 사용)
select (select department_name
        from departments d
        where e.department_id = d.department_id), MAX(salary)
from employees e
group by department_id;

-- 2) 사원번호가 102인 사원과 동일한 부서에서 근무하는 사원의 이름과 채용 날짜를 출력하라. 단, 102번 사원은 출력에서 제외하라(inline view 사용)
select first_name, hire_date
from (select department_id
        from employees
        where employee_id = 102) d, employees e
where e.department_id = d.department_id and e.employee_id <> 102;

-- 3) 평균 급여 이상을 받는 모든 사원의 사원번호, 성 및 급여를 표시하라. 급여의 오름차순으로 정렬한다.
select employee_id, last_name, salary
from employees
where salary >= (select avg(salary)
                from employees)
order by salary;

-- 4) King을 관리자로 하는 모든 사원의 성 및 급여를 출력한다. King이 대문자든, 소문자든 상관없이 작동하도록 보장하라
select last_name, salary
from employees
where manager_id in (select employee_id
                    from employees
                    where upper(last_name) = 'KING');

-- 5) 부서 60에 소속된 모든 사원의 급여보다 높은 급여를 받는 모든 사원의 성과 급여를 출력하라. (all, any, exits 등을 이용하라)
select last_name, salary
from employees
where salary > all (select salary
                    from employees
                    where department_id = 60);

-- 6) 성에 'u'가 포함된 사원이 있는 부서에서 근무하는 사원 중 1명보다는 많은 급여를 받고 있는 사원의 사원 번호, 성 및 급여를 급여가 커지는 순서로 출력하라.
-- u가 첫 글자에 포함될수도 있고 이 경우 대문자로 표현될 수도 있다.
select employee_id, last_name, salary
from employees
where salary > some (select salary
                    from employees
                    where department_id in (select department_id
                                            from employees
                                            where upper(last_name) like '%U%'))
order by salary;