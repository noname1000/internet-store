DROP TABLE IF EXISTS product_purchase;
DROP TABLE IF EXISTS purchase;
DROP TABLE IF EXISTS product;
DROP TABLE IF EXISTS customer;

CREATE TABLE product (
	product_id INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
	name VARCHAR(256) NOT NULL,
	description VARCHAR(4096),
	price DECIMAL(13, 2) NOT NULL DEFAULT 0.00,
	note VARCHAR(1024),
	
	PRIMARY KEY (product_id)
) ENGINE = InnoDB DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci;

CREATE TABLE customer (
	customer_id INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
	first_name VARCHAR(128) NOT NULL,
	last_name VARCHAR(128) NOT NULL,
	email VARCHAR(128) NOT NULL,
	note VARCHAR(1024),
	
	UNIQUE (email),
	
	PRIMARY KEY (customer_id)
) ENGINE = InnoDB DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci;

CREATE TABLE purchase (
	purchase_id INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
	purchase_date DATE NOT NULL,
	total_amount DECIMAL(13, 2) NOT NULL DEFAULT 0.00,
	address VARCHAR(512) NOT NULL DEFAULT "",
	note VARCHAR(1024),
	customer_id INT(11) UNSIGNED NOT NULL,
	
	PRIMARY KEY (purchase_id),
	
	CONSTRAINT fk_customer FOREIGN KEY (customer_id)
	REFERENCES customer(customer_id)
	ON DELETE RESTRICT
	ON UPDATE RESTRICT
) ENGINE = InnoDB DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci;

CREATE TABLE product_purchase (
	product_id INT(11) UNSIGNED NOT NULL,
	purchase_id INT(11) UNSIGNED NOT NULL,
	
	PRIMARY KEY (product_id, purchase_id),
	
	CONSTRAINT fk_product FOREIGN KEY (product_id)
	REFERENCES product(product_id)
	ON DELETE RESTRICT
	ON UPDATE RESTRICT,
	
	CONSTRAINT fk_purchase FOREIGN KEY (purchase_id)
	REFERENCES purchase(purchase_id)
	ON DELETE RESTRICT
	ON UPDATE RESTRICT
) ENGINE = InnoDB DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci;

/* ALTER TABLE purchase ADD CONSTRAINT fk_customer FOREIGN KEY (customer_id) REFERENCES customer(customer_id) ON DELETE RESTRICT ON UPDATE RESTRICT; */ 
/* ALTER TABLE product_purchase ADD CONSTRAINT fk_product FOREIGN KEY (product_id) REFERENCES product(product_id) ON DELETE RESTRICT ON UPDATE RESTRICT; */
/* ALTER TABLE product_purchase ADD CONSTRAINT fk_purchase FOREIGN KEY (purchase_id) REFERENCES purchase(purchase_id) ON DELETE RESTRICT ON UPDATE RESTRICT; */