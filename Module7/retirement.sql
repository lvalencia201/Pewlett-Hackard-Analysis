select e.emp_no,e.first_name, e.last_name
,t.from_date,t.to_date
from employeedb.public.employee e
inner join employeedb.title t
on e.emp_no = t.emp_no
where e.birth_date between '1952-01-01' and '1955-12-31'