select e.first_name, e.last_name,d.dept_no,dept.dept_name,d.from_date,d.to_date
from employee e
inner join department_employee d
on e.emp_no = d.emp_no
inner join department dept
on d.dept_no = dept.dept_no
where e.emp_no in (10001,10002,10003,10004)