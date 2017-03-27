select A.business_id, btrim( A.name, '"') as name, A.categories, A.attributes, A.hours, A.stars, A.review_count, A.is_open,  A.longitude, A.latitude, A.address, A.city, A.postal_code, A.neighborhood, b._id, b.facility_name, b.encounter, b.id, b.placard_st, b.bus_st_date, b.inspect_dt, b.start_time, b.end_time, b.description, b.num ||' '|| b.street as b_address, b.city,  b.rating, b.description_new, b.low, b.medium, b.high
from restaurants A
left join public.violations b
on levenshtein(btrim( a.name,'"'), b.facility_name) <3
and trim(a.postal_code) = trim(b.zip)
and levenshtein(a.address, b.num ||' '|| b.street) <4
order by a.business_id;
