select *
from restaurants A
inner join public.violations B
on levenshtein(a.name, b.facility_name) <2
and trim(a.postal_code) = trim(b.zip) ;
