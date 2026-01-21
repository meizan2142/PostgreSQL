# Project Name: [Vehicle Rental System - Database Design & SQL Queries]

## 📌 Overview
This project showcases a Vehicle Rental System implemented with PostgreSQL, featuring a well-structured ERD and a collection of requirement-driven SQL queries that efficiently retrieve and manage data across the Customers, Vehicles, and Bookings tables, all documented in the `queries.sql` file.

## 🛠️ Technologies Used
* **Database engine:** [PostgreSQL]
* **Query Language:** SQL (PostgreSQL)
* **Tools:** [Beekeeper Studio]

## 📂 Database Schema
Briefly describe the tables used in your queries:
* **Table users:** Stores customer-related information such as name, email, phone and role.
* **Table vehicles:** Contains vehicle details including vehicle name, type, model year, and availability status.
* **Table bookings:** 
       * user_id → references users(user_id)
       * vehicle_id → references vehicles(vehicle_id)

---

## 🔍 Query Explanations & Solutions
Each section below corresponds to a query found in `queries.sql`.

### 1. [Query Name - Retrieve booking information]
**Problem:** Retrieve booking information along with:
Customer name
Vehicle name
**SQL Solution:**
```sql
select booking_id, (users.name) as customer_name,(vehicles.name)as vehicle_name,start_date,end_date,(bookings.status) as status
from bookings
join users
  on bookings.user_id = users.user_id
join vehicles
  on bookings.vehicle_id = vehicles.vehicle_id;
```  
### 2. [Query Name - Find all vehicles]
**Problem:** Find all vehicles that have never been booked.
**SQL Solution:**
```sql
select *
from vehicles as v
where exists (
  select 1
  from bookings as b
  where b.vehicle_id = v.vehicle_id
);
```  
### 3. [Query Name - Where]
**Problem:** Retrieve all available vehicles of a specific type (e.g. cars).
**SQL Solution:**
```sql
select * from vehicles where type='car' and status='available';
```

### 4. [Query Name - GROUP BY and HAVING]
**Problem:** Find the total number of bookings for each vehicle and display only those vehicles that have more than 2 bookings.
**SQL Solution:**
```sql
select v.name as vehicle_name,count(*) as total_bookings from bookings as b join vehicles as v on b.vehicle_id=v.vehicle_id
  group by v.name having count(*)>2
```