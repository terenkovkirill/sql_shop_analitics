CREATE TABLE users 
(
	user_id SERIAL PRIMARY KEY,
	username VARCHAR(50) NOT NULL,
	email VARCHAR(100) UNIQUE NOT NULL CHECK (email LIKE '%@%.%'),
	registration_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	city VARCHAR(50),
	is_active BOOLEAN DEFAULT TRUE
);


CREATE TABLE products 
(
	product_id SERIAL PRIMARY KEY,
	name VARCHAR(50) NOT NULL,
	price NUMERIC(10, 2),
	category VARCHAR(50),					--TODO: Создать ENUM для категорий
	in_stock BOOLEAN DEFAULT TRUE
);


CREATE TABLE orders
(
	order_id SERIAL PRIMARY KEY,
	user_id INT REFERENCES users(user_id),
	order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	status VARCHAR(20) CHECK (status IN ('pending', 'completed', 'cancelled')),
	total_amount NUMERIC(10, 2)
);


CREATE TABLE order_items
(
	item_id SERIAL PRIMARY KEY,
	order_id INT REFERENCES orders(order_id),
	product_id INT REFERENCES products(product_id),
	quantity INT NOT NULL,
	price_at_order NUMERIC(10, 2)
);

CREATE INDEX ind_users_email ON users(email);		--TODO: применить это этo
CREATE INDEX ind_user_id 	 ON orders(user_id); 