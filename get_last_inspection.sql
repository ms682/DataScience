select distinct b.*
from public.violations b
inner join(
select distinct a.facility_name||a.num||a.street as restaurant_key, max(a.inspect_dt) as last_dt
from public.violations a
group by a.facility_name, a.num, a.street)d on d.restaurant_key = b.facility_name||b.num||b.street
and b.inspect_dt = d.last_dt
