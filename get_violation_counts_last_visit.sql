/*this is not done, the counts need to be changed to only count where the value is 'TRUE'*/
select A.business_id, btrim( A.name, '"') as name, A.categories, A.attributes, A.hours, A.stars, A.review_count, A.is_open,  A.longitude, A.latitude, A.address, A.city, A.postal_code, A.neighborhood,  b.facility_name, b.placard_st, b.bus_st_date, b.inspect_dt, b.start_time, b.end_time, b.description,  b.rating, count(b.low) as count_low, count(b.medium=TRUE) as count_medium, count(b.high) as count_high
from restaurants A
left join public.violations b
on levenshtein(btrim( a.name,'"'), b.facility_name) <3
and trim(a.postal_code) = trim(b.zip)
and levenshtein(a.address, b.num ||' '|| b.street) <4
inner join (select c.facility_name, max(c.inspect_dt) as maxdt from 
public.violations c
group by c.facility_name) d on
b.facility_name = d.facility_name and b.inspect_dt = d.maxdt
group by A.business_id, a.name, A.categories, A.attributes, A.hours, A.stars, A.review_count, A.is_open,  A.longitude, A.latitude, A.address, A.city, A.postal_code, A.neighborhood,  b.facility_name, b.placard_st, b.bus_st_date, b.inspect_dt, b.start_time, b.end_time, b.description,  b.rating
order by a.business_id;