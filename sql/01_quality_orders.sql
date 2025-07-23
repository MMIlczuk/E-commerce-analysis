select *
from commerce.olist_orders_dataset
;

-- poszukiwanie duplikatów
select count(*), count(distinct order_id)
from commerce.olist_orders_dataset
;

-- poszukiwanie pustych wartości
select count(*) as nulle
from commerce.olist_orders_dataset
where order_status is null or order_purchase_timestamp is null or order_approved_at is null or order_delivered_carrier_date is null or order_delivered_customer_date is null or order_estimated_delivery_date is null
;

select count(*) as puste_wartosci
from commerce.olist_orders_dataset
where order_status = "" or order_purchase_timestamp = "" or order_approved_at = "" or order_delivered_carrier_date = "" or order_delivered_customer_date = "" or order_estimated_delivery_date = ""
;


-- Sprawdzenie ile pustych wartości znajduje się w poszczególnych kolumnach
SELECT 'order_status' AS kolumna, COUNT(*) AS puste_wartosci
FROM commerce.olist_orders_dataset
WHERE order_status = ''

UNION ALL

SELECT 'order_purchase_timestamp', COUNT(*)
FROM commerce.olist_orders_dataset
WHERE order_purchase_timestamp = ''

UNION ALL

SELECT 'order_approved_at', COUNT(*)
FROM commerce.olist_orders_dataset
WHERE order_approved_at = ''

UNION ALL

SELECT 'order_delivered_carrier_date', COUNT(*)
FROM commerce.olist_orders_dataset
WHERE order_delivered_carrier_date = ''

UNION ALL

SELECT 'order_delivered_customer_date', COUNT(*)
FROM commerce.olist_orders_dataset
WHERE order_delivered_customer_date = ''

UNION ALL

SELECT 'order_estimated_delivery_date', COUNT(*)
FROM commerce.olist_orders_dataset
WHERE order_estimated_delivery_date = '';

-- puste wartości występują tylko w datach. Sprawdzam, czy może się to pokrywać z np anulowaniem zamówienia lub niedostepnoscia

SELECT 
  order_status,
  SUM(CASE WHEN order_approved_at = '' THEN 1 ELSE 0 END) AS pusty_approved_at,
  SUM(CASE WHEN order_delivered_carrier_date = '' THEN 1 ELSE 0 END) AS pusty_carrier,
  SUM(CASE WHEN order_delivered_customer_date = '' THEN 1 ELSE 0 END) AS pusty_customer
FROM commerce.olist_orders_dataset
GROUP BY order_status;

-- dla większości braki danych w datach są to wartości logiczne, jednak braki w wartościach dla statusu delivered świadczą o zaistniałych anomaliach

create table commerce.orders_dataset_cleaned as
	select order_id,
    customer_id,
    order_status,
    STR_TO_DATE(NULLIF(order_purchase_timestamp, '')'%Y-%m-%d %H:%i:%s') AS order_purchase_timestamp,
    STR_TO_DATE(NULLIF(order_approved_at, '')'%Y-%m-%d %H:%i:%s') AS order_approved_at,
    STR_TO_DATE(NULLIF(order_delivered_carrier_date, '')'%Y-%m-%d %H:%i:%s') AS order_delivered_carrier_date,
    STR_TO_DATE(NULLIF(order_delivered_customer_date, '')'%Y-%m-%d %H:%i:%s') AS order_delivered_customer_date,
    STR_TO_DATE(NULLIF(order_estimated_delivery_date, '')'%Y-%m-%d %H:%i:%s') AS order_estimated_delivery_date
    from commerce.olist_orders_dataset

    
    
    
    
    


