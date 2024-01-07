CREATE TABLE Cardholder (
	id int PRIMARY KEY,
	name varchar(50) NOT NULL)
	
CREATE TABLE Credit_Card (
	card varchar(20) PRIMARY KEY,
	cardholder_id int NOT NULL,
		FOREIGN KEY (cardholder_id) REFERENCES Cardholder(id))
	
CREATE TABLE Merchant_Category (
	id int PRIMARY KEY,
	name varchar(50) NOT NULL)
	
CREATE TABLE Merchant (
	id int PRIMARY KEY,
	name varchar(50) NOT NULL,
	id_merchant_category int NOT NULL,
		FOREIGN KEY (id_merchant_category) REFERENCES Merchant_Category(id))
	
CREATE TABLE Transaction (
	id int PRIMARY KEY,
	date timestamp NOT NULL,
	amount float NOT NULL,
	card varchar(20) NOT NULL,
		FOREIGN KEY (card) REFERENCES Credit_Card(card),
	id_merchant int NOT NULL,
		FOREIGN KEY (id_merchant) REFERENCES Merchant(id))
		