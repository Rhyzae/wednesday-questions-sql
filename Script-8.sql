-- List all customers who live in Texas
select customer.first_name, customer.last_name, customer.email, city
from customer
full join address
on customer.address_id = address.address_id
full join city
on address.city_id = city.city_id 
where city = 'Texas';

-- Get all payments above $6.99 with the Customer's Full Name
select customer.first_name, customer.last_name, amount
from customer
full join payment
on customer.customer_id = payment.customer_id
where amount > 6.99;

-- Show all customers names who have made payments over $175
select store_id, first_name, last_name
from customer
where customer_id in (
	select customer_id
	from payment
	group by customer_id
	having sum(amount) > 175
	order by sum(amount) desc
	)
	
-- List all customers that live in Nepal
select customer.first_name, customer.last_name, customer.email, country
from customer
full join address
on customer.address_id = address.address_id
full join city
on address.city_id = city.city_id 
full join country
on city.country_id = country.country_id 
where country = 'Nepal';

-- Which staff member had the most transactions?
select first_name, last_name, count(first_name)
from staff
full join payment
on staff.staff_id = payment.staff_id
group by first_name, last_name
-- Answer: Jon Stephens


-- How many movies of each rating are there?
select rating, count(rating)
from film
group by rating

-- Show all customers who have made a single payment above $6.99 (Use Subqueries)
select store_id, first_name, last_name
from customer
where customer_id in (
	select customer_id
	from payment
	where amount > 6.99
	)

-- How many free rentals did out store give away
select rental_id, amount
from payment
where rental_id in not null and amount = 0.00;
-- Answer: 0








