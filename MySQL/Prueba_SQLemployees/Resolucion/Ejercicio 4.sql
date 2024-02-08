WITH RankedSalaries AS (
    SELECT
        e.emp_no,
        e.first_name,
        e.last_name,
        d.dept_name AS department,
        s.salary,
        ROW_NUMBER() OVER (PARTITION BY d.dept_name ORDER BY s.salary DESC) AS SalaryRankDesc,
        ROW_NUMBER() OVER (PARTITION BY d.dept_name ORDER BY s.salary ASC) AS SalaryRankAsc
    FROM
        employees e
    JOIN
        dept_emp de ON e.emp_no = de.emp_no
    JOIN
        departments d ON de.dept_no = d.dept_no
    JOIN
        salaries s ON e.emp_no = s.emp_no
)
SELECT
    emp_no,
    first_name,
    last_name,
    department,
    salary
FROM
    RankedSalaries
WHERE
    SalaryRankDesc <= 10 OR SalaryRankAsc <= 10;

