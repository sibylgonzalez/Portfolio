-- Obtener la cantidad de empleados por género de cada departamento. departments | male | female--

SELECT DISTINCT
    d.dept_name AS departments,
    COUNT(CASE WHEN e.gender = 'M' THEN 1 END) AS male,
    COUNT(CASE WHEN e.gender = 'F' THEN 1 END) AS female
FROM
    departments d
JOIN
    dept_emp de ON d.dept_no = de.dept_no
JOIN
    employees e ON de.emp_no = e.emp_no
GROUP BY
    d.dept_name;
