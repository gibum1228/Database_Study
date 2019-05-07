-- 2019.04.11. 201814066 ����

-- 1) DEPARTMENTS  ���̺��� ������ Ȯ���϶�
desc departments;

-- 2) DEPARTMENTS ���̺��� ��� ������ ����϶�
select * from departments;

-- 3) �� ���(employee)�� ��(last name), job code, �����(hire date), �����ȣ(employee number)�� ����϶�.
-- ��� ��ȣ�� ���� �տ� ���;� �Ѵ�. HIRE_DATE�� STARTDATE�� ����϶�.
select employee_id, last_name, job_id, hire_date AS "STARTDATE" from employees;

-- 4) ����鿡�� ������ job code�� ����϶�. �ߺ��� ���� �ѹ��� ����Ѵ�
select DISTINCT job_id from employees;

-- 5) ������ ��� job code�� ����϶�. ����鿡�� �������� ���� job code�� ��µǾ�� �Ѵ�
select job_id from employees;

-- 6) ����� �̸�, �޿��� ����϶�. �� Į���� �̸��� Employee, Salary�̴�. Employee�� ���� �̸��� ���� �پ �ϳ��� �÷����� ��µ�
select first_name || last_name AS "Employee", salary as "Salary" from employees;

-- 7) �μ��� �̸��� �μ� ��ȣ�� ����϶�
select department_name, department_id from departments;

-- 8) COUNTRIES ���̺� �����ϴ� ��� �����͸� ����϶�
select * from countries;

-- 9) $12,000 �̻� ���� ����� ���� �޿��� ����϶�.
select last_name, salary
from employees
where salary >= 12000;

-- 10) ��� ��ȣ 176���� ����� ���� �̸�, �μ� ��ȣ�� ����϶�.
select last_name, first_name, department_id
from employees
where employee_id = 176;

-- 11) �޿��� $5000 ���� �ް� �ִ� ����� ���� �޿��� ����϶�
select last_name, salary
from employees
where salary <= 5000;

-- 12) �޿��� $12000 �̻� �ް� �ִ� ����� ���� �̸�, �޿�, �μ���ȣ�� ����϶�
select last_name, first_name, salary, department_id
from employees
where salary >= 12000;

-- 13) �޿��� $5000 �̻�, $12000 ���Ϸ� �ް� �ִ� ����� �����ȣ, ��, �޿��� ����϶�, �޿��� ���� ������� ��µǾ�� �Ѵ�.
select employee_id, last_name, salary
from employees
where salary BETWEEN 5000 AND 12000
ORDER BY salary DESC;

-- 14) ���� Matos�̰ų� Taylor�� ����� ���� ���۳�¥, job code�� ����϶�. ������� ���� ����� ���� ��µǾ�� �Ѵ�.
select last_name, hire_date, job_id
from employees
where last_name = 'Matos' OR last_name = 'Taylor' /* last_name in ('Matos', 'Taylor')�� ����*/
ORDER BY hire_date;

-- 15) �μ���ȣ 20�� 50������ ����� ��, �μ���ȣ�� ����϶�. ���� ���ĺ� �������� ��µǾ�� �Ѵ�.
select last_name, department_id
from employees
where department_id BETWEEN 20 AND 50
order by last_name DESC;

-- 16) 50�� �μ����� ���ϴ� ������� �ٹ��ϴ� job id�� �ߺ� �����Ͽ� ����϶�
select DISTINCT job_id
from employees
where department_id = 50;

-- 17) 2003�� �Ǵ� 2005�⿡ ���� ����� ���� ������� ����϶�
select last_name, hire_date
from employees
where hire_date between '03/01/01' and '03/12/31' or hire_date between '05/01/01' and '05/12/31';

-- 18) ������(Manager)�� ���� ����� ���� job code�� ����϶�
select last_name, job_id
from employees
where manager_id is NULL;

-- 19) Commission�� �ް� �ִ� ����� �����ȣ, �޿�, commission�� ����϶�.
--) Salary�� �����ϵ�, ���� salary��� commission�� Ŀ���� ������ ���;� �Ѵ�
select employee_id, salary, commission_pct
from employees
where commission_pct is NOT NULL and commission_pct > 0
order by salary ASC, commission_pct ASC;

-- 20) �޿��� $3000���� �����鼭 �μ���ȣ�� 100���� ���� �μ��� �ٹ��ϴ� ����� ��, �μ���ȣ, �޿�, job code�� ����϶�
select last_name, salary, job_id
from employees
where salary < 3000 and department_id < 100;

-- 21) ��� �޿��� �ְ�, ����, ��, ����� ���϶�.
-- Maximum, Minimum, Sum, Average�� �÷� �̸��� ���Ѵ�
select max(salary) as "Maximum",
        min(salary) as "Minimum",
        sum(salary) as "Sum",
        avg(salary) as "Average"
from employees;

-- 22) �� JOB���� ��� �޿��� �ְ�, ����, ��, ����� ���϶�
-- Maximum, Minimum, Sum, Average�� �÷� �̸��� ���Ѵ�
select job_id, Max(salary) As "Maximum",
        Min(Salary) As "Minimum",
        SUM(Salary) As "Sum",
        AVG(Salary) As "Average"
from Employees
Group by job_id;

-- 24) MANAGER ������ �ϰ� �ִ� ����� ���� ����϶�
select count(distinct manager_id)
from employees;

-- 25) �޿��� #5000������ ����鸸 �������, �μ���ȣ�� �޿��� ���� ����϶�
select sum(salary), department_id
from employees
where salary <= 5000
group by department_id;

-- 26) ����� ���� 5�� �̻��� JOB_ID ���� �޿��� �ּҰ��� ���϶�
select min(salary)
from employees
group by job_id
having count(*) >= 5;

-- 27) 100�� ���� �μ��� �Ҽӵ� ����� �����ȣ, ��, �μ���ȣ, �μ����� ����϶�
select employee_id, last_name, department_id, department_name
from employees natural join departments
where department_id <= 100;

-- 28) ��� �μ��� �ּҸ� ����Ѵ�. location ID, street address, city, state �Ǵ� province, country�� ����ؾ��Ѵ�. NATURAL JOIN�� ����϶�
select location_id, street_address, city, state_province, country_id
from departments natural join locations;

-- 29) Toronto���� �ٹ��ϴ� ����� last name, job id, department number, department name�� ����϶�
select last_name, job_id, employees.department_id, department_name
from locations join departments
on locations.location_id = departments.location_id
join employees
on employees.department_id = departments.department_id
where city = 'Toronto';

-- 32) ����� ��ȣ, ��, job_code, job_title�� ����϶�
select employee_id, last_name, job_title
from employees natural join jobs;

-- 33) ��� �μ��� ��ȣ, �̸�, �μ����� ���� ����϶�
select d.department_id, d.department_name, e.last_name
from employees e join departments d
on e.employee_id = d.manager_id;

-- 37) job �̷�(history)�� �ִ� ����� ��� ���� �̸�, job_history ��� Ƚ���� ����϶�
select last_name, first_name, count(*)
from employees join job_history
using (employee_id)
group by last_name, first_name;
-- �߰���� ��)

-- (self join) 34 ~ 37
-- 34) ����� ��ȣ, ����� �̸�(���� �̸�), �������� ��ȣ, �������� �̸�(���� �̸�)�� ����϶�
--) EMP#, EMP_NAME, MANAGER#, MANAGER_NAME���� ����Ѵ�.
select e.employee_id EMP#, e.last_name || e.first_name EMP_NAME, m.manager_id MANAGER#, m.last_name || m.first_name MANAGER_NAME 
from employees e join employees m
on e.manager_id = m.employee_id;

-- 35) �����ڰ� ���� ����� �����Ͽ�, ����� ��ȣ, ����� �̸�(���� �̸�), �������� ��ȣ, �������� �̸�(���� �̸�)�� ����϶�.
--) EMP#, EMP_NAME, MANAGER#, MANAGER_NAME���� ����Ѵ�.
select e.employee_id EMP#, e.last_name || e.first_name EMP_NAME, m.manager_id MANAGER#, m.last_name || m.first_name MANAGER_NAME 
from employees e left outer join employees m
on e.manager_id = m.employee_id;

-- 36) ����� ���� �μ� ��ȣ �� �־��� ����� ������ �μ��� �ٹ��ϴ� ��� ����� �����ȣ, ���� ����϶�. �� �� �̸��� �����ϰ� �ٿ���
select t.last_name EMP_LN, t.department_id DER_ID, e.employee_id TEAM_EMP_ID, e.last_name TEAM_EMP_LN 
from employees e join employees t
on e.department_id = t.department_id;

-- 37) �������ں��� ���� ä��� ����� �̸�(FIRST_NAME)�� ä�볯¥, �ش� �������� �̸�(FIRST_NAME)�� ä�볯¥�� ����϶�
select e.first_name EMP_FIRST_NAME, e.hire_date EMP_HIRE_DATE, s.first_name SUPER_FIRST_NAME, s.hire_date SUPER_HIRE_DATE
from employees e join employees s
on e.department_id = s.department_id
where s.hire_date > e.hire_date;

-- (���տ���) 38 ~ 41
-- 38) �Ҽ� ����� ���� �μ��� �̸��� ����϶�
select department_name
from departments
MINUS
select department_name
from departments
where department_id IN (select department_id
                        from employees);

-- 39) ���� ����� ���� ������ �̸�(job_title)�� ����϶�
select job_title
from jobs
MINUS
select job_title
from jobs
where job_id IN (select job_id
                from employees);

-- 40) Shipping �μ��� Human Resoures �μ��� �μ� �̸��� �ּ�(address)�� ����϶�. ���տ����� �̿��϶�
select department_name, Street_address
from departments natural join locations
where department_name = 'Shipping'
UNION
select department_name, street_address
from departments natural join locations
where department_name = 'Human Resoures';

-- 41) IT �μ��� Finance �μ� �� �ٰ� ���� ��ġ�� Country_ID�� ����϶�. ���տ����� �̿��Ѵ�.
select country_id
from departments natural join locations
where department_name = 'IT'
INTERSECT
select country_id
from departments natural join locations
where department_name = 'Finance';

-- (�μ�����) 42 ~ 44
-- 42) �ְ��� �޿��� �ް� �ִ� ����� first_name�� ����϶�
select e1.first_name
from employees e1
where e1.salary in (select max(salary)
                        from employees e2);

-- 43) ����� ���� 5�� �̻��� �μ��� �μ� �̸��� ����϶�
select department_name
from departments d
where 5 <= (select count(*)
            from employees e
            where d.department_id = e.department_id);

-- 44) ���� �̸��� Purchasing�� �� ������ �ϰ� �ִ� ����� first_name�� ����϶�
select first_name
from employees
where job_id in (select job_id
                from jobs
                where job_title like '%Purchasing%');

-- (Outer Join) 45 ~ 
-- 45) ����� �Ҽӵ��� ���� �μ��� �����Ͽ�, �μ��̸��� �ش� �μ��� �Ҽӵ� ��� �̸�(first_name)�� ����϶�
select department_name, first_name
from departments left outer join employees
on departments.department_id = employees.department_id;

-- 46) ������ �������� ���� ����� ����� �������� ���� ������ �����Ͽ�, ��� ��� �̸�(first_name)�� ���� �̸�(job_title)�� ����϶�
select first_name, job_title
from employees full outer join jobs
on employees.job_id = jobs.job_id;

-- create ��
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

-- 4) ������ ���� �� ���� �Է��� �� �ֵ��� EMP3 ���̺��� �����Ѵ�.
alter table emp3 modify last_name varchar2(50);

-- 5) emp3 ���̺� loc��� �÷��� �߰��϶�. varchar2 ������ Ÿ���̾�� �ϸ�, �ִ� 10�� ���̸� ������. ����Ʈ �����δ� 'LA'���� �Է��Ѵ�.
alter table emp3 add LOC varchar2(10) DEFAULT LA;

-- 6) emp3�� loc �÷� �̸��� loc2�� �����϶�
alter table emp3 rename column loc to LOC2;

-- 7) EMPLOYEES2 ���̺��� FIRST_NAME ���� �����Ѵ�. �����Ǿ����� Ȯ���Ѵ�.
alter table employees2 drop column first_name;

-- 8) DEPT3 ���̺��� ID �÷��� �����Ѵ�. ������ �Ұ����ϴٸ�, �����ϵ��� �϶�
alter table emp3 drop column dept_id;
alter table dept3 drop column id;

-- 9) emp3 ���̺��� �����϶�
drop table emp3;

-- ��������
-- 1)
create table DEPT3 as
select *
from departments;
alter table dept3 add constraint my_dept_id_pk primary key(id);

-- 2)

