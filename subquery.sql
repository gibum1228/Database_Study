-- �μ�����

-- ��������
-- 1) �μ� �̸��� ����� �ְ� �޿��� ����϶�. (��Į�� �μ����� ���)
select (select department_name
        from departments d
        where e.department_id = d.department_id), MAX(salary)
from employees e
group by department_id;

-- 2) �����ȣ�� 102�� ����� ������ �μ����� �ٹ��ϴ� ����� �̸��� ä�� ��¥�� ����϶�. ��, 102�� ����� ��¿��� �����϶�(inline view ���)
select first_name, hire_date
from (select department_id
        from employees
        where employee_id = 102) d, employees e
where e.department_id = d.department_id and e.employee_id <> 102;

-- 3) ��� �޿� �̻��� �޴� ��� ����� �����ȣ, �� �� �޿��� ǥ���϶�. �޿��� ������������ �����Ѵ�.
select employee_id, last_name, salary
from employees
where salary >= (select avg(salary)
                from employees)
order by salary;

-- 4) King�� �����ڷ� �ϴ� ��� ����� �� �� �޿��� ����Ѵ�. King�� �빮�ڵ�, �ҹ��ڵ� ������� �۵��ϵ��� �����϶�
select last_name, salary
from employees
where manager_id in (select employee_id
                    from employees
                    where upper(last_name) = 'KING');

-- 5) �μ� 60�� �Ҽӵ� ��� ����� �޿����� ���� �޿��� �޴� ��� ����� ���� �޿��� ����϶�. (all, any, exits ���� �̿��϶�)
select last_name, salary
from employees
where salary > all (select salary
                    from employees
                    where department_id = 60);

-- 6) ���� 'u'�� ���Ե� ����� �ִ� �μ����� �ٹ��ϴ� ��� �� 1���ٴ� ���� �޿��� �ް� �ִ� ����� ��� ��ȣ, �� �� �޿��� �޿��� Ŀ���� ������ ����϶�.
-- u�� ù ���ڿ� ���Եɼ��� �ְ� �� ��� �빮�ڷ� ǥ���� ���� �ִ�.
select employee_id, last_name, salary
from employees
where salary > some (select salary
                    from employees
                    where department_id in (select department_id
                                            from employees
                                            where upper(last_name) like '%U%'))
order by salary;