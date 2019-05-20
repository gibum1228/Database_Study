-- DML
-- 실습용으로 주어진 lab_08_01.sql script를 수행하여 my_employee table를 생성하라. 이 테이블에 대해 아래 작업을 수행한다.

-- 1) 다음 그림의 첫번째 행을 입력하는 문장을 수행하라. 칼럼이름을 사용하지 말라
insert into MY_EMPLOYEE values (1, 'Patel', 'Ralph', 'rpatel', 895);

-- 2) 두번쨰 행을 입력하는 문장을 수행하라. 칼럼이름을 사용한다.
insert into my_employee(ID, LAST_NAME, first_name, userid, salary) values (2, 'Dancs', 'Betty', 'bdancs', 860);


-- 3) 세번째, 네번째 행들을 입력하는 문장을 수행하라. 컬럼 이름 사용 여부는 필요에 따라 결정하라. 5번째 행은 삽입하지 않는다
insert into my_employee values (3, 'Biri', 'Ban', 'bbiri', 1100);
insert into my_employee values (4, 'Newman', 'Chad', 'cnewman', 750);

-- 4) 테이블에 데이터가 입력되었는지 확인할 수 있는 문장을 작성하여 수행하라
select * from my_employee;

-- 5)데이터베이스에 영구적으로 반영되도록 보장하는 문장을 수행하라
commit;

-- 6) 3번쨰 사람의 성을 Drexler로 수정하라
update my_employee
set last_name = 'Drexler'
where id = 3;

-- 7) $1000보다 적게 버는 사원의 급여를 $1000으로 수정하라
update my_employee
set salary = 1000
where salary < 1000;

-- 8) 데이터가 제대로 수정되었는지 확인하라
select * from my_employee;

-- 9) Betty Dancs를 삭제하라. 수정된 내용을 확인하라. 데이터베이스에 영구적으로 반영되도록 보장하는 문장을 수행하라
delete from my_employee
where last_name = 'Dancs' and first_name = 'Betty';
select * from my_employee;
commit;

-- 10) 5번째 행을 삽입하라. 수정된 내용을 확인하라
insert into my_employee values (5, 'Ropeburn', 'Audrey', 'aropebur', '1550');
select * from my_employee;


-- DML2)
-- % HR 스키마에서 적당한 질의를 작성한다 "날짜 관련 함수를 미리 학습한다"
-- lab_04_01.sql을 수행하여 SAL_HISTORY 테이블을 생성하여, 구조 확인
-- lab_04_03.sql을 수행하여 MGR_HISTORY 테이블을 생성하여, 구조 확인
-- lab_04_05.sql을 수행하여 SPECIAL_SAL 테이블을 생성하여, 구조 확인
-- lab_DML_1.sql을 수행하여 부서 번호가 80번이 넘는 부서에 속한 사원의 사원번호, 고용일, 급여를 포함하는 SAL_HISTORY_2 테이블을 생성한 후 구조를 확인

-- 1) EMPLOYEE 테이블에서 사원 ID가 125보다 적은 사원의 사원 ID, 채용 날짜, 급여, 관리자 ID의 세부정보를 검색하여 내용을 확인하라
select employee_id, hire_date, salary, maganer_id
from employees
where employee_id < 125;

-- 2) 사원 ID가 125보다 작은 사원에 대해 급여가 $20,000 보다 크면 사원 ID, 급여의 세부정보를 SPECIAL_SAL 테이블에 삽입한 후 내용 확인
insert into special_sal
select employee_id, salary
from employees
where employee_id < 125 and salary > 20000;
select * from special_sal;

-- 3) 사원 ID가 125보다 작은 사원에 대해 급여가 $20,000 보다 크지 않으면, 사원 ID, 채용 날짜, 급여 등의 세부 정보는 SAL_HISTORY 테이블에
-- 삽입하고 사원 ID, 관리자 ID, 급여 등의 세부 정보는 MGR_HISTORY 테이블에 삽입한다.
insert into sal_history
select employee_id, hire_date, salary
from employees
where salary <= 20000 and employee_id < 125;
insert into mgr_history
select employee_id, manager_id, salary
from employees
where salary <= 20000 and employee_id < 125;

-- 4) SAL_HISTORY 테이블에 EMPID가 207, HIREDATE가 2015년 5월 10일, 급여가 5000인 사원을 삽입하라.
insert into sal_history_2 value (207, '2015/05/10', 5000);
-- hire_date에 to_date('2015-05-10','yyyy-mm-dd')써줘야 안전함

-- 5) SAL_HISTORY 의 내용을 출력하여 확인하라
select * from sal_history_2;

-- 6) SAL_HISTORY 테이블에 EMPID가 208, HIREDATE가 오늘, 급여가 10000인 사원을 삽입하라. 5의 문장으로 내용을 확인하라
insert into SAL_HISTORY_2 value (208, sysdate, 10000);
select * from sal_history;

-- 7) SAL_HISTORY 테이블에서 사원 번호가 200이하인 사원들의 급여를 10% 인상하라
update sal_history_2
set sal = sal * 1.1
where empid <= 200;

-- 8) SAL_HISTORY 테이블에서 급여가 10,000 이하인 사원의 정보는 삭제하라
delete from sal_history_2
where sal <= 10000;
