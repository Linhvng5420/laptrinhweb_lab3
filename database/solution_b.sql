--1. Liệt kê các hóa đơn của khách hàng, thông tin hiển thị gồm: mã user, tên user, mã hóa đơn
SELECT u.user_id, u.user_name, o.order_id
FROM Users u
JOIN orders o ON u.user_id = o.user_id;

--2. Liệt kê số lượng các hóa đơn của khách hàng: mã user, tên user, số đơn hàng
SELECT u.user_id, u.user_name, COUNT(o.order_id) AS order_count
FROM Users u
JOIN orders o ON u.user_id = o.user_id
GROUP BY u.user_id;

--3. Liệt kê thông tin hóa đơn: mã đơn hàng, số sản phẩm
SELECT o.order_id, COUNT(od.product_id) AS product_count
FROM orders o
JOIN order_details od ON o.order_id = od.order_id
GROUP BY o.order_id;

--4. Liệt kê thông tin mua hàng của người dùng: mã user, tên user, mã đơn hàng, tên sản phẩm.
--Lưu ý: gôm nhóm theo đơn hàng, tránh hiển thị xen kẻ các đơn hàng với nhau
SELECT u.user_id, u.user_name, o.order_id, p.product_name
FROM Users u
JOIN orders o ON u.user_id = o.user_id
JOIN order_details od ON o.order_id = od.order_id
JOIN Products p ON od.product_id = p.product_id
ORDER BY o.order_id;

--5. Liệt kê 7 người dùng có số lượng đơn hàng nhiều nhất, thông tin hiển thị gồm: 
--mã user, tên user, số lượng đơn hàng
SELECT u.user_id, u.user_name, COUNT(o.order_id) AS order_count
FROM Users u
JOIN orders o ON u.user_id = o.user_id
GROUP BY u.user_id
ORDER BY order_count DESC
LIMIT 7;

--6. Liệt kê 7 người dùng mua sản phẩm có tên: Samsung hoặc Apple trong tên sản phẩm,
--thông tin hiển thị gồm: mã user, tên user, mã đơn hàng, tên sản phẩm
SELECT DISTINCT u.user_id, u.user_name, o.order_id, p.product_name
FROM Users u
JOIN orders o ON u.user_id = o.user_id
JOIN order_details od ON o.order_id = od.order_id
JOIN Products p ON od.product_id = p.product_id
WHERE p.product_name LIKE '%Samsung%' OR p.product_name LIKE '%Apple%'
LIMIT 7;

--7. Liệt kê danh sách mua hàng của user bao gồm giá tiền của mỗi đơn hàng,
--thông tin hiển thị gồm: mã user, tên user, mã đơn hàng, tổng tiền
SELECT u.user_id, u.user_name, o.order_id, SUM(p.price * od.quantity) AS total_price
FROM Users u
JOIN orders o ON u.user_id = o.user_id
JOIN order_details od ON o.order_id = od.order_id
JOIN Products p ON od.product_id = p.product_id
GROUP BY o.order_id;

--8. Liệt kê danh sách mua hàng của user bao gồm giá tiền của mỗi đơn hàng, thông tin
--hiển thị gồm: mã user, tên user, mã đơn hàng, tổng tiền. Mỗi user chỉ chọn ra 1 đơn hàng có giá tiền lớn nhất.
SELECT u.user_id, u.user_name, o.order_id, MAX(total_price) AS max_price
FROM (
    SELECT o.order_id, o.user_id, SUM(p.price * od.quantity) AS total_price
    FROM orders o
    JOIN order_details od ON o.order_id = od.order_id
    JOIN Products p ON od.product_id = p.product_id
    GROUP BY o.order_id
) AS subquery
JOIN Users u ON subquery.user_id = u.user_id
GROUP BY u.user_id;

--9. Liệt kê danh sách mua hàng của user bao gồm giá tiền của mỗi đơn hàng, thông tin hiển thị gồm:
--mã user, tên user, mã đơn hàng, tổng tiền, số sản phẩm. Mỗi user chỉ chọn ra 1 đơn hàng có giá tiền nhỏ nhất.
SELECT u.user_id, u.user_name, o.order_id, MIN(total_price) AS min_price, product_count
FROM (
    SELECT o.order_id, o.user_id, SUM(p.price * od.quantity) AS total_price, COUNT(od.product_id) AS product_count
    FROM orders o
    JOIN order_details od ON o.order_id = od.order_id
    JOIN Products p ON od.product_id = p.product_id
    GROUP BY o.order_id
) AS subquery
JOIN Users u ON subquery.user_id = u.user_id
GROUP BY u.user_id;

--10. Liệt kê danh sách mua hàng của user bao gồm giá tiền của mỗi đơn hàng, thông tin hiển thị gồm: 
--mã user, tên user, mã đơn hàng, tổng tiền, số sản phẩm. Mỗi user chỉ chọn ra 1 đơn hàng có số sản phẩm là nhiều nhất.
SELECT u.user_id, u.user_name, o.order_id, total_price, MAX(product_count) AS max_product_count
FROM (
    SELECT o.order_id, o.user_id, SUM(p.price * od.quantity) AS total_price, COUNT(od.product_id) AS product_count
    FROM orders o
    JOIN order_details od ON o.order_id = od.order_id
    JOIN Products p ON od.product_id = p.product_id
    GROUP BY o.order_id
) AS subquery
JOIN Users u ON subquery.user_id = u.user_id
GROUP BY u.user_id;


