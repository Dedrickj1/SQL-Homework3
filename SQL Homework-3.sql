--1. List all customers who live in Texas(use JOINS)
SELECT Customer.Customer_ID, Customer.First_Name, Customer.Last_Name,district
FROM Customer
JOIN Address ON Customer.Address_ID = Address.Address_ID
WHERE district = 'Texas';


--2. Get all payments above $6.99 with the Customer's Full Name
SELECT CONCAT(Customer.First_Name, ' ', Customer.Last_Name) AS FullName, Payment.Amount
FROM Customer
JOIN Payment ON Customer.Customer_ID = Payment.Customer_ID
WHERE Payment.Amount > 6.99;

--3. Show all customers names who have made payments over $175(use
--subqueries)

SELECT CONCAT(Customer.First_Name, ' ', Customer.Last_Name) AS FullName
FROM Customer
WHERE Customer.Customer_ID IN (
    SELECT Payment.Customer_ID
    FROM Payment
    WHERE Payment.Amount > 175.00
);

--4. List all customers that live in Nepal (use the city
--table)
SELECT Customer.First_Name, Customer.Last_Name
FROM Customer
JOIN Address ON Customer.Address_ID = Address.Address_ID
JOIN City ON Address.City_ID = City.City_ID
JOIN Country ON City.Country_ID = Country.Country_ID
WHERE City = 'Nepal';
select * from city
-- No Country_id in the city table has a city named Nepal

--5. Which staff member had the most transactions?
SELECT Staff.Staff_ID, CONCAT(Staff.First_Name, ' ', Staff.Last_Name) AS FullName, COUNT(*) AS TransactionCount
FROM Staff
JOIN Transaction ON Staff.Staff_ID = Transaction.Staff_ID
GROUP BY Staff.Staff_ID, FullName
ORDER BY TransactionCount DESC
LIMIT 1;
-- confused on which table i am to look through

-- 6. How many movies of each rating are there?

SELECT Rating, COUNT(*) AS MovieCount
FROM film
GROUP BY Rating;

-- 7.Show all customers who have made a single payment above $6.99 (Use Subqueries)
SELECT Customer.First_Name, Customer.Last_Name
FROM Customer
WHERE Customer.Customer_ID IN (
    SELECT Payment.Customer_ID
    FROM Payment
    WHERE Payment.Amount > 6.99
    GROUP BY Payment.Customer_ID
    HAVING COUNT(*) = 1
);

-- 8. How many free rentals did our stores give away?
SELECT COUNT(*) AS FreeRentalCount
FROM Rental
WHERE IsFreeRental = 1;
select * from rental
-- need help on this one as well can't find the table i am using











