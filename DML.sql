-- DML
-- �ǽ������� �־��� lab_08_01.sql script�� �����Ͽ� my_employee table�� �����϶�. �� ���̺� ���� �Ʒ� �۾��� �����Ѵ�.

-- 1) ���� �׸��� ù��° ���� �Է��ϴ� ������ �����϶�. Į���̸��� ������� ����
insert into MY_EMPLOYEE values (1, 'Patel', 'Ralph', 'rpatel', 895);

-- 2) �ι��� ���� �Է��ϴ� ������ �����϶�. Į���̸��� ����Ѵ�.
insert into my_employee(ID, LAST_NAME, first_name, userid, salary) values (2, 'Dancs', 'Betty', 'bdancs', 860);


-- 3) ����°, �׹�° ����� �Է��ϴ� ������ �����϶�. �÷� �̸� ��� ���δ� �ʿ信 ���� �����϶�. 5��° ���� �������� �ʴ´�
insert into my_employee values (3, 'Biri', 'Ban', 'bbiri', 1100);
insert into my_employee values (4, 'Newman', 'Chad', 'cnewman', 750);

-- 4) ���̺� �����Ͱ� �ԷµǾ����� Ȯ���� �� �ִ� ������ �ۼ��Ͽ� �����϶�
select * from my_employee;

-- 5)�����ͺ��̽��� ���������� �ݿ��ǵ��� �����ϴ� ������ �����϶�
commit;

-- 6) 3���� ����� ���� Drexler�� �����϶�
update my_employee
set last_name = 'Drexler'
where id = 3;

-- 7) $1000���� ���� ���� ����� �޿��� $1000���� �����϶�
update my_employee
set salary = 1000
where salary < 1000;

-- 8) �����Ͱ� ����� �����Ǿ����� Ȯ���϶�
select * from my_employee;

-- 9) Betty Dancs�� �����϶�. ������ ������ Ȯ���϶�. �����ͺ��̽��� ���������� �ݿ��ǵ��� �����ϴ� ������ �����϶�
delete from my_employee
where last_name = 'Dancs' and first_name = 'Betty';
select * from my_employee;
commit;

-- 10) 5��° ���� �����϶�. ������ ������ Ȯ���϶�
insert into my_employee values (5, 'Ropeburn', 'Audrey', 'aropebur', '1550');
select * from my_employee;


-- DML2)
-- % HR ��Ű������ ������ ���Ǹ� �ۼ��Ѵ� "��¥ ���� �Լ��� �̸� �н��Ѵ�"
-- lab_04_01.sql�� �����Ͽ� SAL_HISTORY ���̺��� �����Ͽ�, ���� Ȯ��
-- lab_04_03.sql�� �����Ͽ� MGR_HISTORY ���̺��� �����Ͽ�, ���� Ȯ��
-- lab_04_05.sql�� �����Ͽ� SPECIAL_SAL ���̺��� �����Ͽ�, ���� Ȯ��
-- lab_DML_1.sql�� �����Ͽ� �μ� ��ȣ�� 80���� �Ѵ� �μ��� ���� ����� �����ȣ, �����, �޿��� �����ϴ� SAL_HISTORY_2 ���̺��� ������ �� ������ Ȯ��

-- 1) EMPLOYEE ���̺��� ��� ID�� 125���� ���� ����� ��� ID, ä�� ��¥, �޿�, ������ ID�� ���������� �˻��Ͽ� ������ Ȯ���϶�
select employee_id, hire_date, salary, maganer_id
from employees
where employee_id < 125;

-- 2) ��� ID�� 125���� ���� ����� ���� �޿��� $20,000 ���� ũ�� ��� ID, �޿��� ���������� SPECIAL_SAL ���̺� ������ �� ���� Ȯ��
insert into special_sal
select employee_id, salary
from employees
where employee_id < 125 and salary > 20000;
select * from special_sal;

-- 3) ��� ID�� 125���� ���� ����� ���� �޿��� $20,000 ���� ũ�� ������, ��� ID, ä�� ��¥, �޿� ���� ���� ������ SAL_HISTORY ���̺�
-- �����ϰ� ��� ID, ������ ID, �޿� ���� ���� ������ MGR_HISTORY ���̺� �����Ѵ�.
insert into sal_history
select employee_id, hire_date, salary
from employees
where salary <= 20000 and employee_id < 125;
insert into mgr_history
select employee_id, manager_id, salary
from employees
where salary <= 20000 and employee_id < 125;

-- 4) SAL_HISTORY ���̺� EMPID�� 207, HIREDATE�� 2015�� 5�� 10��, �޿��� 5000�� ����� �����϶�.
insert into sal_history_2 value (207, '2015/05/10', 5000);
-- hire_date�� to_date('2015-05-10','yyyy-mm-dd')����� ������

-- 5) SAL_HISTORY �� ������ ����Ͽ� Ȯ���϶�
select * from sal_history_2;

-- 6) SAL_HISTORY ���̺� EMPID�� 208, HIREDATE�� ����, �޿��� 10000�� ����� �����϶�. 5�� �������� ������ Ȯ���϶�
insert into SAL_HISTORY_2 value (208, sysdate, 10000);
select * from sal_history;

-- 7) SAL_HISTORY ���̺��� ��� ��ȣ�� 200������ ������� �޿��� 10% �λ��϶�
update sal_history_2
set sal = sal * 1.1
where empid <= 200;

-- 8) SAL_HISTORY ���̺��� �޿��� 10,000 ������ ����� ������ �����϶�
delete from sal_history_2
where sal <= 10000;
