-- self join
-- e�� ����� ������ �������� ����
-- m�� ����� ������ �������� ���� ���
-- �����̼� ��� ������ ��Ȯ�ؾ��ϸ� e, m �� ���̺� �̸��� �������� �Ѵ�.

select e.first_name employee, m.first_name manager
from employees e join employees m
on e.manager_id = m.employee_id
-- where e.employee_id = 101;

-- outer join( right outer join, left outer join,, full outer join (��� ���ο��� ��� ����)