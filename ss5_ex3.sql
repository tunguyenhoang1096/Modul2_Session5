-- EX3: Truy vấn lồng (SubQuery)
-- Tạo bảng products và thêm dữ liệu
CREATE TABLE products(
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(100) NOT NULL ,
    category VARCHAR(50) NOT NULL ,
    price DECIMAL(10,0) NOT NULL
);
INSERT INTO products
VALUES (1, 'Laptop Dell XPS 13', 'Laptop', 25000000),
       (2, 'Laptop HP Pavilion', 'Laptop', 18000000),
       (3, 'Laptop MacBook Pro', 'Laptop', 42000000),

       (4, 'iPhone 14', 'Phone', 23000000),
       (5, 'Samsung Galaxy S23', 'Phone', 21000000),
       (6, 'Xiaomi Redmi Note 12', 'Phone', 7000000),

       (7, 'iPad Pro', 'Tablet', 28000000),
       (8, 'iPad Gen 9', 'Tablet', 9000000),

       (9, 'Sony WH-1000XM5', 'Accessory', 9000000),
       (10, 'Apple Watch Series 9', 'Accessory', 12000000);
-- Hiển thị các sản phẩm có: giá cao hơn giá trung bình của tất cả sản phẩm
SELECT * FROM products
WHERE price > (
    SELECT  AVG(price) AS avg_price FROM products
    );
-- Hiển thị sản phẩm có: giá cao nhất trong từng loại sản phẩm
SELECT * FROM products AS p
WHERE price = (
    SELECT MAX(price)
    FROM products
    WHERE p.category = category
    );
-- Hiển thị các sản phẩm thuộc loại: có ít nhất một sản phẩm giá trên 20.000.000
SELECT * FROM products
WHERE category IN (
    SELECT DISTINCT category
    FROM products
    WHERE price > 20000000
);
