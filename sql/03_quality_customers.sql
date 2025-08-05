select * from olist_customers_dataset;

-- poszukiwanie duplikatów
select count(*), count(distinct customer_id), count(distinct customer_unique_id)
from olist_customers_dataset
;
-- duplikaty. w customer_unique_id wyznaczają klientów wracających


-- poszukiwanie wartości pustych w kolumnach
select count(*)
from olist_customers_dataset
where customer_unique_id is null or customer_unique_id = ""
;

select count(*)
from olist_customers_dataset
where customer_unique_id is null or customer_unique_id = ""
;

select count(*)
from olist_customers_dataset
where customer_zip_code_prefix is null or customer_zip_code_prefix = ""
;

select count(*)
from olist_customers_dataset
where customer_city is null or customer_city = ""
;

select count(*)
from olist_customers_dataset
where customer_state is null or customer_state = ""
;

-- brak wartości pustych w tabeli

