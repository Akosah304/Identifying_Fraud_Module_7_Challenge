-- Count the Transactions that are less than $2.00 by Cardholder
CREATE VIEW "Transactions Under $2.00 by Cardholder" AS
SELECT cardholder.name,
	count(amount) as Total_Count
FROM transaction
JOIN credit_card ON transaction.card = credit_card.card
JOIN cardholder ON credit_card.cardholder_id = cardholder.id
WHERE amount < 2.00
GROUP BY cardholder.name;

-- Count the Transactions that are less than $2.00 by Card
CREATE VIEW "Transactions Under $2.00 by Card" AS
SELECT card,
	count(amount) as Total_Count
FROM transaction
WHERE amount < 2.00
GROUP BY card
ORDER BY Total_Count desc;

-- Top 100 Highest Transactions between 7am and 9am
CREATE VIEW "Highest 100 AM Transactions" AS
SELECT cast(date as time) as time,
	amount
FROM transaction
WHERE cast(date as time) between '7:00:00' AND '9:00:00'
ORDER BY amount desc
LIMIT 100;

-- Top 100 Highest Transactions between Other Times
CREATE VIEW "Highest 100 Other Transactions" AS
SELECT cast(date as time) as time,
	amount
FROM transaction
WHERE cast(date as time) not between '7:00:00' AND '9:00:00'
ORDER BY amount desc
LIMIT 100;

-- Count the Transactions that are less than $2.00 by Merchant
CREATE VIEW "Transactions Under $2.00 by Merchant" AS
SELECT merchant.name,
	count(amount) as Total_Count
FROM transaction
JOIN merchant ON transaction.id_merchant = merchant.id
WHERE amount < 2.00
GROUP BY merchant.name
ORDER BY Total_Count desc
LIMIT 5;