select 
t.travel_description, 
t.travel_date , 
section_order, 
city_from, city_to, 
section_distance_km, 
section_time_min,
section_avg_speed_km_h,
travel_avg_speed_km_h,
travel_total_distance_km,
driver_name,
(
	select STRING_AGG(passenger_name , ',')
	from passengerssections ps 
	where ps.travel_description = t.travel_description
	and ps.section_order = s.section_order
) as other_passengers
from travels t 
inner join sections s 
on t.travel_description = s.travel_description
inner join drivers d 
on d.travel_description = t.travel_description
