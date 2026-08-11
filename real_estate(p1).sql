create database if not exists cleanprac;
use cleanprac;

create table if not exists real_estate (
    name text,
    property_title text,
    price_raw text,
    location text,
    total_area_sqft int,
    price_per_sqft double,
    description text,
    baths int,
    balcony text
);

set sql_safe_updates = 0;

alter table real_estate rename column name to project_name;

#updating price 

alter table real_estate modify column price_inr decimal (15,2);

update real_estate
set price_inr = cast(REGEXP_SUBSTR(price_raw, '[0-9]+(\\.[0-9]+)?') AS DECIMAL(10,2)) * 10000000
where price_raw like '%Cr';
update real_estate
set price_inr = cast(regexp_substr(price_raw, '[0-9]+(\\.[0-9])?') as decimal (10,2)) * 100000
where price_raw like '%L';

#type

alter table real_estate modify column property_type varchar(100); 

update real_estate
set property_type = case
when property_title like "%Flat%" or property_title like "%Apartment%" then "Flat/Apartment"
when property_title like "%Independent House%" then "Independent House"
when property_title like "%Villa%" then "Villa"
when property_title like "%Villa%" then "Villa"
else "Other"
end;
select * from real_estate;

#bedrooms

alter table real_estate modify column bhk int; 

update real_estate
set bhk = cast(trim(substring_index(property_title, 'BHK', 1)) as unsigned)
where property_title like "%BHK%";

select * from real_estate;

#backing NULLs

update real_estate
set bhk = baths
where bhk is NULL;

#separateLocality/City

alter table real_estate 
modify column city varchar(100),
modify column locality varchar(200); 

update real_estate
set city = trim(substring_index(location, ',', -1)),
locality =trim(substring_index(location, ',', 1))
where location like "%,%";

#clearingup

alter table real_estate
drop column location,
drop column property_title,
drop column description;

#balcony

update real_estate
set balcony = case
when balcony like "%Yes%" then 1
when balcony like "%No%" then 0
else null
end;
alter table real_estate modify column balcony int;

select * from real_estate;
