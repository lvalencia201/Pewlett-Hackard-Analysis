drop table if exists public.retirement_titles;
select e.emp_no,e.first_name, e.last_name
,t.from_date,t.to_date
into public.retirement_titles 
from public.employee e
inner join public.title t
on e.emp_no = t.emp_no
where e.birth_date >='1952-01-01' and e.birth_date<= '1955-12-31';

drop table if exists public.mentorship_eligibility;
select e.emp_no,e.first_name, e.last_name
,t.title 
,de.from_date,de.to_date
into public.mentorship_eligibility
from public.employee e
inner join public.title t
on e.emp_no = t.emp_no
inner join public.department_employee de
on e.emp_no=de.emp_no
where e.birth_date >='1965-01-01' and e.birth_date<= '1965-01-01';

drop table if exists public.unique_titles;
select e.emp_no,e.first_name, e.last_name,t.title
into public.unique_titles 
from public.employee e
inner join public.title t
on e.emp_no = t.emp_no
where e.birth_date >='1952-01-01' and e.birth_date<= '1955-12-31'
and t.to_date=(select max (t2.to_date) from public.title t2 where t2.emp_no=t.emp_no);

drop table if exists retiring_titles;
select  count (title) as count,title
into retiring_titles
from unique_titles
group by title
order by count(title)desc;