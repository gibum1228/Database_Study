create table sal_history_2
as (SELECT employee_id EMPID, hire_date HIREDATE,
       salary SAL
FROM employees
WHERE department_id > 80);	