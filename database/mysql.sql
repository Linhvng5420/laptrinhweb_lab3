CREATE TABLE Users (
  user_id INT(11) AUTO_INCREMENT,
  user_name VARCHAR(25) NOT NULL,
  user_email VARCHAR(55) NOT NULL,
  user_pass VARCHAR(255) NOT NULL,
  updated_at DATETIME,
  created_at DATETIME,
  PRIMARY KEY (user_id)
);

CREATE TABLE Products (
  product_id INT(11) AUTO_INCREMENT,
  product_name VARCHAR(50) NOT NULL,
  product_description TEXT,
  price DECIMAL(10, 2) NOT NULL,
  stock_quantity INT(11) NOT NULL,
  updated_at DATETIME,
  created_at DATETIME,
  PRIMARY KEY (product_id)
);

CREATE TABLE orders (
  order_id INT(11) AUTO_INCREMENT,
  user_id INT(11) NOT NULL,
  updated_at DATETIME,
  created_at DATETIME,
  PRIMARY KEY (order_id),
  FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

CREATE TABLE order_details (
  order_detail_id INT(11) AUTO_INCREMENT,
  order_id INT(11) NOT NULL,
  product_id INT(11) NOT NULL,
  updated_at DATETIME,
  created_at DATETIME,
  PRIMARY KEY (order_detail_id),
  FOREIGN KEY (order_id) REFERENCES orders(order_id),
  FOREIGN KEY (product_id) REFERENCES Products(product_id)
);