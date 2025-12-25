-- EX2: Group by và Having
-- Tạo bảng employees và thêm dữ liệu
CREATE TABLE employees(
    emp_id INT PRIMARY KEY ,
    full_name VARCHAR(100) NOT NULL ,
    department VARCHAR(100) NOT NULL ,
    salary DECIMAL(10,2) NOT NULL
);
ALTER TABLE employees
MODIFY salary DECIMAL(10,0) NOT NULL ;
INSERT INTO employees
VALUES (1, 'Nguyen Van A', 'IT', 15000000),
       (2, 'Tran Thi B', 'IT', 14000000),
       (3, 'Le Van C', 'IT', 13000000),
       (4, 'Pham Thi D', 'IT', 16000000),

       (5, 'Hoang Van E', 'HR', 9000000),
       (6, 'Vu Thi F', 'HR', 9500000),
       (7, 'Do Van G', 'HR', 10000000),
       (8, 'Bui Thi H', 'HR', 10500000),

       (9, 'Nguyen Van I', 'Sales', 20000000),
       (10,'Tran Thi K', 'Sales', 18000000);
-- Thống kê: mỗi phòng ban có bao nhiêu nhân viên
SELECT department,
       COUNT(emp_id) AS total
FROM employees
GROUP BY department;
-- Tính: mức lương trung bình của từng phòng ban
SELECT department,
       AVG(salary) AS avg_salary
FROM employees
GROUP BY department;
-- Hiển thị phòng ban có 3 nhân viên trở lên
SELECT department,
       COUNT(emp_id) AS total
FROM employees
GROUP BY department
HAVING total > 3;
-- Hiện thị các phòng ban có lương trung bình lớn hơn 12.000.000
SELECT department,
       AVG(salary) AS avg_salary
FROM employees
GROUP BY department
HAVING avg_salary > 12000000;
SELECT * FROM employees;