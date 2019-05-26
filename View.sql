-- ��

-- 1) �����ȣ, ����̸�(first_name�� last_name�� ��ĭ�� �־� �ٿ��� EMPOYEE��� �÷����� ǥ��), �μ� ��ȣ�� ������ �� EMPLOYEE_VU�� �����϶�
Create view EMPLOYEE_VU
AS select employee_id, first_name || ' ' || last_name "EMPLOYEE", department_id
from employees;

-- 2) EMPLOYEE_VU�� �̿��Ͽ�, ��� �̸��� �ش� ����� �Ҽӵ� �μ��� ����϶�
select EMPLOYEE, department_id
from EMPLOYEE_VU;

-- 3) �μ� �̸�, �ش� �μ��� ��� �޿�(�÷� �̸��� AVG_SAL), �μ��� �̸��� ���� ���� DEPARTMENT_VU�� �����϶�. �並 ���� ������ Ȯ���϶�
create view DEPARTMENT_VU as
select department_name, AVG(salary) "AVG_SAL"
from departments d join employees e
on d.department_id = e.department_id
join employees m
on d.manager_id = m.employee_id
group by department_name, m.first_name;
select *
from DEPARTMENT_VU;

-- 4) 80�� �μ��� ���� ����� ���̵��� 1 ������ ���ǵ� �並 �����϶�
create or replace view EMPLOYEE_VU as
select employee_id, first_name || ' ' || last_name "EMPLOYEE", department_id
from employees
where department_id = 80;

-- 5) 3���� �並 �����϶�
drop view department_vu;

-- �ε���
-- 1) ����� ������ �˻��Ǵ� ��찡 ���Ҵ�. �˻��� ȿ���� ���� �� �ִ� ����� �ۼ��϶�.
create index ix_lastname on EMPLOYEES (last_name);

-- 2) WHere ������ ��� ��ȣ�� �μ� ��ȣ�� ���� �˻��Ǵ� ��찡 ����. �˻��� ȿ���� ���� �� �ִ� ����� �ۼ��϶�
create index ix_id on employee (employee_id, department_id);

-- 3) salary�� where ������ �˻��� ���� �׻� salary�� ū ������� ���� ��� ������ �˻��Ǵ� ��찡 ���ٰ� ��������. �̸� �ݿ��Ͽ� �ε����� �����϶�
create index ix_salary on employees (salary desc);

-- 4) 3���� ������ �ε����� �����϶�
drop index ix_salary;