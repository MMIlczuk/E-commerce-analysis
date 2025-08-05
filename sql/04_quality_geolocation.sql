select * from olist_geolocation_dataset
;

select count(*)
from olist_geolocation_dataset
where geolocation_zip_code_prefix is null or geolocation_zip_code_prefix = ""
;

select count(*)
from olist_geolocation_dataset
where geolocation_lat is null or geolocation_lat = ""
;

select count(*)
from olist_geolocation_dataset
where geolocation_lng is null or geolocation_lng = ""
;

select count(*)
from olist_geolocation_dataset
where geolocation_city is null or geolocation_city = ""
;

select count(*)
from olist_geolocation_dataset
where geolocation_state is null or geolocation_state = ""
;

-- brak wartości pustych w zbiorze

