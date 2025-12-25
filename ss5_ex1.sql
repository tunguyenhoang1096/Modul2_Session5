CREATE DATABASE session5DB;
USE session5DB;
-- EX1
-- Tạo và thêm dữ liệu cho bảng students
CREATE TABLE students(
    student_id INT PRIMARY KEY ,
    full_name VARCHAR(100) NOT NULL ,
    birth_year INT NOT NULL ,
    gender VARCHAR(5) NOT NULL ,
    score DECIMAL(4,2) NOT NULL
);
INSERT INTO students
VALUES (1, 'Nguyen Van An', 2002, 'Nam', 8.45),
       (2, 'Tran Thi Binh', 2003, 'Nữ', 7.80),
       (3, 'Le Hoang Nam', 2001, 'Nam', 6.95),
       (4, 'Pham Thi Hoa', 2002, 'Nữ', 8.10),
       (5, 'Do Minh Quan', 2000, 'Nam', 9.20),
       (6, 'Bui Thi Lan', 2003, 'Nữ', 7.35),
       (7, 'Vu Duc Huy', 2001, 'Nam', 5.90),
       (8, 'Hoang Mai Anh', 2002, 'Nữ', 8.75),
       (9, 'Dang Tuan Kiet', 2000, 'Nam', 6.40),
       (10, 'Nguyen Thi Ngoc', 2003, 'Nữ', 9.00);
-- Hiện thị mã sinh viên, họ tên ( viết hoa toàn bộ)
SELECT student_id,
       UPPER(full_name)
FROM students;
-- Hiển thị: họ tên,số tuổi của sinh viên (dựa vào năm hiện tại)
SELECT full_name,
       YEAR(CURDATE())-birth_year AS age
FROM students;
-- Hiển thị: điểm trung bình được làm tròn 1 chữ số thập phân
SELECT ROUND(AVG(score),1) AS diemTB FROM students;
-- Hiển thị: Tổng số sinh viên, điểm cao nhất, điểm thấp nhất
SELECT COUNT(student_id) AS tong_sinh_vien,
       MAX(score) AS diem_cao_nhat,
       MIN(score) AS diem_thap_nhat
FROM students;
SELECT * FROM students;