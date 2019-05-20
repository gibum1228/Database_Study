--) 내장함수
-- 1) 사원의 성과 함께 급여와 commission을 출력하라. 급여는 천의 자리 이상만 출력(반올림)하고, commission은 소수 첫 째 자리까지만 출력(버림)하라
select last_name,round(salary,-3), round(commission_pct,1)
from employees;

-- 2) 3.14와 가장 가까운 큰 정수, 3.14와 가장 가까운 적은 정수를 출력하라. 세 개의 컬럼(3.14 포함)이 출력되어야 한다
select ceil(3.14), floor(3.14), 3.14
from dual;

-- 3) 60번 부서에 속한 사원의 성을 대문자로 출력하라
select UPPER(last_name) "사원의 성"
from employees
where department_id = 60;

-- 4) 자신의 이름을 출력하고, 길이를 출력하라. 가상의 dual 테이블을 이용하라
select '김기범' "이름", length('김기범') "이름 길이"
from dual;

-- 5) 50, 60, 90 번 부서에 속한 사원의 전화번호에서 앞의 3자리를 추출하여 사원번호, 전화번호와 함께 출력하라
select employee_id, phone_number,SUBSTR(Phone_number,1,3) "전화번호 3자리"
from employees
where department_id = 50 or department_id = 60 or department_id = 90;
-- department_id in (50, 60, 90) 하면 더 간단함

-- 6) Commission이 0.1을 넘는 사원에 대해 사원번호와 급여를 출력하라. 급여를 6자리로 출력하되, 왼쪽 빈 공간을 *로 채워서 출력하라
select employee_id, LPAD(salary,6,'*')
from employees
where commission_pct > 0.1;

-- 7) JOB_HISTORY 테이블을 이용하여, 각 사원 번호와 해당 사원의 종료날짜, 종료한 날짜의 2개월 후 달의 마지막 날짜를 출력하라(총 3개의 컬럼)
select employee_id, end_date, last_day(add_months(end_date, 2))
from job_history;

-- 8) 오늘 날짜와 시각을 다음 형식으로 출력하라. 1999/12/29 03:03:45 AM. AM대신 오전이라는 단어가 출려될 수 있다.
select to_char(sysdate, 'yyyy/mm/dd hh12:mi:ss AM')
from dual;

-- 9) 사원번호가 200번대인 사원의 사원번호, 시작날짜, 종료날짜를 출력하라. 날짜는 연, 월, 일, 요일을 출력한다
select employee_id, to_char(start_date,'yyyy/mm/dd day'), to_char(end_date, 'yyyy/mm/dd day')
from job_history
where employee_id >= 200 and employee_id < 300;

-- 10) 1993.03.01 이전에 고용된 사원의 성, 고용일을 출력하라. 이 질의는 NLS_LANG 변수가 어떤 변수로 설정되어도 작동할 수 있도록 하라.
-- dafault 값을 비교할 경우 문제가 발생할 수 있기 때문에 NLS_LANG 변수가 어떠한 환경에서도 작동하게 하려면 TO_DATE를 사용해야함
select last_name, hire_date
from employees
where hire_date <= to_date('1993.03.01','yyyy.mm.dd');
-- 이상, 이하, 이전 등 '이'가 들어간 조건은 포함하는 걸로 약속

-- 11) 급여가 $20000이상인 사원을 급여가 큰 순서로 성과 급여 고용일을 출력하라. 고용일은 1999-04-28 형식이어야 한다.
select last_name, to_char(hire_date,'yyyy-mm-dd')
from employees
where salary >= 20000
order by salary desc;

-- 12) commission이 NULL인 경우 0으로 간주하여 연봉을 계산한 후, 사원의 사원번호와 연봉(YEAR_SAL)을 연봉이 커지는 순서로 출력하라
select employee_id, nvl( salary * 12 * commission_pct,0) as "YEAR_SAL"
from employees
order by commission_pct;

-- 13) Salary가 큰 3명의 사원의 성, 이름, Salary를 출력하라. ROWNUM을 이용하라
select ROWNUM, last_name, first_name, salary
from (select last_name, first_name, salary
    from employees
    order by salary desc)
where rownum <= 3;