-- Retirement Titles D1--------------------------------
SELECT ce.emp_no,
	ce.first_name,
	ce.last_name,
	ti.title,
	ti.from_date,
	ti.to_date
INTO ret_titles
FROM employees AS ce
INNER JOIN titles AS ti
ON (ce.emp_no = ti.emp_no)
WHERE birth_date BETWEEN '1952-01-01' AND '1955-12-31'
ORDER BY ce.emp_no;
SELECT * FROM ret_titles
-- Unique Titles D1------------------------------------
SELECT DISTINCT ON (rt.emp_no) 
	rt.emp_no,
	rt.first_name, 
	rt.last_name, 
	rt.title
INTO unique_titles
FROM ret_titles as rt
WHERE rt.to_date = '9999-01-01'
ORDER BY rt.emp_no ASC, rt.to_date DESC;
SELECT * FROM unique_titles
-- Retiring Titles D1----------------------------------
SELECT COUNT(ut.title), ut.title
INTO retiring_titles
FROM unique_titles AS ut
GROUP BY ut.title
ORDER BY COUNT(ut.title) DESC;
SELECT * FROM retiring_titles
-- Mentorship Eligibilty D2----------------------------
SELECT DISTINCT ON (e.emp_no) 
		e.emp_no,
		e.first_name,
		e.last_name,
		e.birth_date,
		de.from_date,
		de.to_date,
		ti.title
INTO mentorship_eligibilty
FROM employees as e
INNER JOIN dept_emp as de
ON (e.emp_no = de.emp_no)
INNER JOIN titles as ti
ON (e.emp_no = ti.emp_no)
WHERE (birth_date BETWEEN '1965-01-01' AND '1965-12-31')
AND (de.to_date = '9999-01-01')
ORDER BY e.emp_no ASC, de.from_date DESC;
SELECT * FROM mentorship_eligibilty
-- mentorship_eligibilty_count D3-----------------------
SELECT COUNT (me.emp_no), me.title
INTO mentorship_eligibilty_count 
FROM mentorship_eligibilty as me
GROUP BY me.title
ORDER BY COUNT(me.title) DESC;
SELECT * FROM mentorship_eligibilty_count 






















-- 3: Report on the employee database analysis


