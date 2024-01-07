ALTER TABLE dupl_transaction
ADD Month int
EXTRACT (MONTH FROM date)
ADD Day var


SELECT EXTRACT (MONTH FROM date)  AS Month,
		EXTRACT (DAY FROM date) AS Day,
        amount
FROM dupl_transaction
JOIN credit_card ON dupl_transaction.card = credit_card.card
WHERE cardholder_id = 25
AND EXTRACT (MONTH FROM date) BETWEEN '01' AND '06'