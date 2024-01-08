CREATE TABLE cardholder (
	id int PRIMARY KEY,
	name varchar(50) NOT NULL
);	
	
CREATE TABLE credit_Card (
	card varchar(20) PRIMARY KEY,
	card_holder_id int NOT NULL,
		FOREIGN KEY (card_holder_id) REFERENCES Card_holder(id)
);	
	
CREATE TABLE merchant_Category (
	id int PRIMARY KEY,
	name varchar(50) NOT NULL
);	
	
CREATE TABLE merchant (
	id int PRIMARY KEY,
	name varchar(50) NOT NULL,
	id_merchant_category int NOT NULL,
		FOREIGN KEY (id_merchant_category) REFERENCES Merchant_Category(id)
);	
	
CREATE TABLE transaction (
	id int PRIMARY KEY,
	date timestamp NOT NULL,
	amount float NOT NULL,
	card varchar(20) NOT NULL,
		FOREIGN KEY (card) REFERENCES Credit_Card(card),
	id_merchant int NOT NULL,
		FOREIGN KEY (id_merchant) REFERENCES Merchant(id)
);	
		