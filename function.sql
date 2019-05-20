--) �����Լ�
-- 1) ����� ���� �Բ� �޿��� commission�� ����϶�. �޿��� õ�� �ڸ� �̻� ���(�ݿø�)�ϰ�, commission�� �Ҽ� ù ° �ڸ������� ���(����)�϶�
select last_name,round(salary,-3), round(commission_pct,1)
from employees;

-- 2) 3.14�� ���� ����� ū ����, 3.14�� ���� ����� ���� ������ ����϶�. �� ���� �÷�(3.14 ����)�� ��µǾ�� �Ѵ�
select ceil(3.14), floor(3.14), 3.14
from dual;

-- 3) 60�� �μ��� ���� ����� ���� �빮�ڷ� ����϶�
select UPPER(last_name) "����� ��"
from employees
where department_id = 60;

-- 4) �ڽ��� �̸��� ����ϰ�, ���̸� ����϶�. ������ dual ���̺��� �̿��϶�
select '����' "�̸�", length('����') "�̸� ����"
from dual;

-- 5) 50, 60, 90 �� �μ��� ���� ����� ��ȭ��ȣ���� ���� 3�ڸ��� �����Ͽ� �����ȣ, ��ȭ��ȣ�� �Բ� ����϶�
select employee_id, phone_number,SUBSTR(Phone_number,1,3) "��ȭ��ȣ 3�ڸ�"
from employees
where department_id = 50 or department_id = 60 or department_id = 90;
-- department_id in (50, 60, 90) �ϸ� �� ������

-- 6) Commission�� 0.1�� �Ѵ� ����� ���� �����ȣ�� �޿��� ����϶�. �޿��� 6�ڸ��� ����ϵ�, ���� �� ������ *�� ä���� ����϶�
select employee_id, LPAD(salary,6,'*')
from employees
where commission_pct > 0.1;

-- 7) JOB_HISTORY ���̺��� �̿��Ͽ�, �� ��� ��ȣ�� �ش� ����� ���ᳯ¥, ������ ��¥�� 2���� �� ���� ������ ��¥�� ����϶�(�� 3���� �÷�)
select employee_id, end_date, last_day(add_months(end_date, 2))
from job_history;

-- 8) ���� ��¥�� �ð��� ���� �������� ����϶�. 1999/12/29 03:03:45 AM. AM��� �����̶�� �ܾ ����� �� �ִ�.
select to_char(sysdate, 'yyyy/mm/dd hh12:mi:ss AM')
from dual;

-- 9) �����ȣ�� 200������ ����� �����ȣ, ���۳�¥, ���ᳯ¥�� ����϶�. ��¥�� ��, ��, ��, ������ ����Ѵ�
select employee_id, to_char(start_date,'yyyy/mm/dd day'), to_char(end_date, 'yyyy/mm/dd day')
from job_history
where employee_id >= 200 and employee_id < 300;

-- 10) 1993.03.01 ������ ���� ����� ��, ������� ����϶�. �� ���Ǵ� NLS_LANG ������ � ������ �����Ǿ �۵��� �� �ֵ��� �϶�.
-- dafault ���� ���� ��� ������ �߻��� �� �ֱ� ������ NLS_LANG ������ ��� ȯ�濡���� �۵��ϰ� �Ϸ��� TO_DATE�� ����ؾ���
select last_name, hire_date
from employees
where hire_date <= to_date('1993.03.01','yyyy.mm.dd');
-- �̻�, ����, ���� �� '��'�� �� ������ �����ϴ� �ɷ� ���

-- 11) �޿��� $20000�̻��� ����� �޿��� ū ������ ���� �޿� ������� ����϶�. ������� 1999-04-28 �����̾�� �Ѵ�.
select last_name, to_char(hire_date,'yyyy-mm-dd')
from employees
where salary >= 20000
order by salary desc;

-- 12) commission�� NULL�� ��� 0���� �����Ͽ� ������ ����� ��, ����� �����ȣ�� ����(YEAR_SAL)�� ������ Ŀ���� ������ ����϶�
select employee_id, nvl( salary * 12 * commission_pct,0) as "YEAR_SAL"
from employees
order by commission_pct;

-- 13) Salary�� ū 3���� ����� ��, �̸�, Salary�� ����϶�. ROWNUM�� �̿��϶�
select ROWNUM, last_name, first_name, salary
from (select last_name, first_name, salary
    from employees
    order by salary desc)
where rownum <= 3;