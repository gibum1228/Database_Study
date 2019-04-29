-- self join
-- e는 사원의 정보를 가져오기 위해
-- m은 상사의 정보를 가져오기 위해 사용
-- 릴레이션 사용 목적이 명확해야하며 e, m 등 테이블 이름을 명시해줘야 한다.

select e.first_name employee, m.first_name manager
from employees e join employees m
on e.manager_id = m.employee_id
-- where e.employee_id = 101;

-- outer join( right outer join, left outer join,, full outer join (모든 조인에서 사용 가능)