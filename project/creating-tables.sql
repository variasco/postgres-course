CREATE TABLE address (
  id SERIAL PRIMARY KEY,
  city VARCHAR(50) NOT NULL,
  street VARCHAR(50) NOT NULL,
  building INT NOT NULL
);

CREATE TABLE staff_positions (
  id SERIAL PRIMARY KEY,
  name VARCHAR(100) NOT NULL
);

CREATE TABLE staff (
  id SERIAL PRIMARY KEY,
  first_name VARCHAR(100) NOT NULL,
  last_name VARCHAR(100) NOT NULL,
  phone VARCHAR(16) UNIQUE NOT NULL,
  password VARCHAR(100) NOT NULL,
  position_id INT NOT NULL,
  address_id INT,
  birthday DATE,
  created_at TIMESTAMP DEFAULT NOW(),
  FOREIGN KEY (address_id) REFERENCES address(id) ON UPDATE CASCADE ON DELETE SET NULL,
  FOREIGN KEY (position_id) REFERENCES staff_positions(id) ON UPDATE CASCADE ON DELETE SET NULL,
);

CREATE TABLE catalogs (
  id SERIAL PRIMARY KEY,
	name VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE products (
  id SERIAL PRIMARY KEY,
	name VARCHAR(100) NOT NULL,
	description TEXT,
	price NUMERIC(11,2),
	catalog_id INT,
	created_at TIMESTAMP DEFAULT NOW(),
  FOREIGN KEY (catalog_id) REFERENCES catalogs(id) ON UPDATE CASCADE ON DELETE SET NULL
);

CREATE TABLE stores (
  id SERIAL PRIMARY KEY,
  manager_id INT, /* NULL if storehouse */
  address_id INT,
  FOREIGN KEY (manager_id) REFERENCES staff(id) ON UPDATE CASCADE ON DELETE SET NULL,
  FOREIGN KEY (address_id) REFERENCES address(id) ON UPDATE CASCADE ON DELETE SET NULL
);

CREATE TABLE stores_products (
  id SERIAL PRIMARY KEY,
	store_id INT,
	product_id INT,
	remainder INT,
	created_at TIMESTAMP DEFAULT NOW(),
	updated_at TIMESTAMP DEFAULT NOW(),
	FOREIGN KEY (store_id) REFERENCES stores(id) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY (product_id) REFERENCES products(id) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE customers (
  id SERIAL PRIMARY KEY,
  first_name VARCHAR(100) NOT NULL,
  last_name VARCHAR(100),
  phone VARCHAR(16) UNIQUE NOT NULL,
  email VARCHAR(120) UNIQUE,
  discount_card_number BIGINT,
  discount_points INT DEFAULT 300
);

CREATE TABLE discounts (
  id SERIAL PRIMARY KEY,
	customer_id INT,
	product_id INT,
	category_id INT,
	value REAL, /* between 0.0 and 1.0 */
	started_at TIMESTAMP,
	finished_at TIMESTAMP,
	FOREIGN KEY (customer_id) REFERENCES customers(id) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY (product_id) REFERENCES products(id) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY (category_id) REFERENCES catalogs(id) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE orders (
  id SERIAL PRIMARY KEY,
	customer_id INT NOT NULL,
	created_at TIMESTAMP DEFAULT NOW(),
  FOREIGN KEY (customer_id) REFERENCES customers(id) ON UPDATE CASCADE ON DELETE SET NULL
);

CREATE TABLE orders_products (
  id SERIAL PRIMARY KEY,
	order_id INT NOT NULL,
	product_id INT NOT NULL,
	quantity INT DEFAULT 1,
	created_at TIMESTAMP DEFAULT NOW(),
	updated_at TIMESTAMP DEFAULT NOW(),
  FOREIGN KEY (order_id) REFERENCES orders(id) ON UPDATE CASCADE ON DELETE CASCADE,
  FOREIGN KEY (product_id) REFERENCES products(id) ON UPDATE CASCADE ON DELETE SET NULL
);