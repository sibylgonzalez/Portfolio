 SELECT
    CONCAT(m.first_name, ' ', m.last_name) AS manager,
    COUNT(e.emp_no) AS employee_count
FROM
    employees e
JOIN
    dept_manager dm ON e.emp_no = dm.emp_no
JOIN
    employees m ON dm.emp_no = m.emp_no
GROUP BY
    manager



    ;