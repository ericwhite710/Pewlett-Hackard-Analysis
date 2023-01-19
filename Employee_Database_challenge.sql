-- D1
-- Retrieve emp_no, first_name, last_name columns from Employees table.
select emp_no, first_name, last_name
from employees;
select count(*)
from employees;

-- Retrieve title, from_date, to_date columns from Titles table.
select emp_no, title, from_date,to_date from titles;
select count(*) from titles;
select e.emp_no, e.first_name, e.last_name,
       t.title, t.from_date, t.to_date
into retirement_titles	   
from employees e 
inner join titles t on (e.emp_no=t.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
order by e.emp_no
select count(distinct e.emp_no)
from employees e 
inner join titles t on (e.emp_no=t.emp_no)
and t.to_date='9999-01-01'
select count(*) from retirement_titles;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title
INTO unique_titles
FROM retirement_titles
WHERE to_date='9999-01-01'
ORDER BY emp_no, to_date DESC;
select count(*) from unique_titles;

-- Write another query in the Employee_Database_challenge.sql file to retrieve the number of employees by their most recent job title who are about to retire.
select count(*) as count, title
into retiring_titles
from unique_titles
group by title
order by count(*) desc;

select * from retiring_titles;