select distinct(product_category_name)
from commerce.olist_products_dataset
;

-- sprawdzanie duplikatów
select count(*), count(distinct product_id)
from olist_products_dataset
;
-- brak

select * from olist_products_dataset;

-- tabela z angielskimi nazwami
create table products_dataset_eng as
	select o.product_category_name, o.product_description_lenght, o.product_height_cm, o.product_id, o.product_length_cm, o.product_name_lenght, o.product_photos_qty, o.product_weight_g, o.product_width_cm, p.product_category_name_english 
    from olist_products_dataset o
    left join product_category_name_translation p on o.product_category_name = p.product_category_name
;


select * from products_dataset_eng
where product_weight_g <= 0 or product_height_cm <= 0 or product_width_cm <= 0
;

