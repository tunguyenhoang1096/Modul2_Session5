-- EX4: Truy vấn dữ liệu trên nhiều bảng
CREATE TABLE customers(
    customer_id INT PRIMARY KEY ,
    customer_name VARCHAR(100) NOT NULL
);
INSERT INTO customers
VALUES (1,'Nguyễn Văn A'),
       (2,'Hoàng Thị B'),
       (3,'Lê Văn C');
CREATE TABLE orders(
    order_id INT PRIMARY KEY ,
    order_date DATE ,
    customer_id INT,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);
INSERT INTO orders
VALUES (101, '2025-01-05', 1),
       (102, '2025-01-06', 2),
       (103, '2025-01-07', 1),
       (104, '2025-01-08', 3);
CREATE TABLE order_items(
    order_id INT,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    customer_id INT,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    product_name VARCHAR(100) NOT NULL ,
    quantity INT CHECK ( quantity > 0 ),
    price DECIMAL(10,0)
);
INSERT INTO order_items
VALUES  -- Đơn 101
       (101, 1, 'Laptop Dell', 1, 25000000),
       (101, 1, 'Chuột Logitech', 2, 500000),

        -- Đơn 102
       (102, 2, 'iPhone 14', 1, 23000000),

        -- Đơn 103
       (103, 1, 'Tai nghe Sony', 1, 9000000),
       (103, 1, 'Bàn phím cơ', 1, 3000000),

        -- Đơn 104
       (104, 3, 'iPad Gen 9', 1, 9000000);
-- Hiển thị: mã đơn hàng, ngày đặt hàng, tên khách hàng
SELECT order_id, order_date, customer_name
FROM orders o
JOIN customers c
ON o.customer_id = c.customer_id;
-- Hiển thị: danh sách sản phẩm trong mỗi đơn hàng
SELECT order_id, product_name, quantity, price
FROM order_items;
-- Tính tổng tiền của mỗi đơn hàng
SELECT order_id,
       SUM(quantity * price) AS total_amount
FROM order_items
GROUP BY order_id;
-- Hiện thị: các đơn hàng có tổng tiền lớn hơn 10.000.000
SELECT order_id,
       SUM(quantity * price) AS total_amount
FROM order_items
GROUP BY order_id
HAVING total_amount > 10000000;