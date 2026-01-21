-- Query: 1 (Join)
select booking_id, (users.name) as customer_name,(vehicles.name)as vehicle_name,start_date,end_date,(bookings.status) as status
from bookings
join users
  on bookings.user_id = users.user_id
join vehicles
  on bookings.vehicle_id = vehicles.vehicle_id;

-- Query: 2 (Exists)
select *
from vehicles as v
where exists (
  select 1
  from bookings as b
  where b.vehicle_id = v.vehicle_id
);

-- Query: 3 (Where)
select * from vehicles where type='car' and status='available';

-- Query: 4 (Group By and Having)
select v.name as vehicle_name,count(*) as total_bookings from bookings as b join vehicles as v on b.vehicle_id=v.vehicle_id
  group by v.name having count(*)>2