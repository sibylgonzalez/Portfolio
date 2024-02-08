-- Obtén los nombres de los managers activos y el de su predecesor por cada departamento. department | manager | predecessor_manager--
SELECT DISTINCT
    d.dept_name AS department,
    CONCAT(m.first_name, ' ', m.last_name) AS current_manager,
    CONCAT(p.first_name, ' ', p.last_name) AS predecessor_manager
FROM
    departments d
JOIN
    dept_manager dm ON d.dept_no = dm.dept_no
JOIN
    employees m ON dm.emp_no = m.emp_no
LEFT JOIN
    dept_manager dp ON dm.dept_no = dp.dept_no AND dm.to_date = dp.from_date
LEFT JOIN
    employees p ON dp.emp_no = p.emp_no
WHERE
    dm.to_date = '9999-01-01';
