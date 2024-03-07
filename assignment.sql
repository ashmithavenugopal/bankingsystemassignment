------TASK 1------
----1.create a database---- 
CREATE DATABASE HMBANK
USE HMBANK
-----2.define the schema---
create table Customers(
customer_id int Not Null primary key,
first_name varchar(20) Not Null,
last_name varchar(20) , 
dob date , 
email varchar(25),
phone_number varchar(15), 
customer_address varchar(200))

create table Accounts(
account_id int Not Null primary key , 
customer_id int,
Foreign key(customer_id) references Customers(customer_id),
account_type varchar(20),
balance decimal(10,2))

create table Transactions(
transaction_id int Not Null primary key , 
account_id int,
Foreign key (account_id) references Accounts(account_id),
transaction_type varchar(25),
amount decimal(10,2),
transaction_date date)

------TASK 2------
----1. insert value into table , CUSTOMERS----
insert into Customers (customer_id,first_name,last_name,dob,email,phone_number,customer_address) values
(01,'Ayush','K','2003-10-10','ayushk@gmail.com','9234690716','6 krishna street Puducherry'),
(02,'Aathmika','S','2001-04-21','aathmi@gmail.com','9845627890','10 sbi colony Chennai'),
(03,'Yashvi','R','2002-05-30','yashvir@gmail.com','7623135670','8 eleventh street near hyatt Delhi'),
(04,'Rishi','A','2001-09-28','rishi@gmail.com','6381254321','9 baba colony Shiridi'),
(05,'Sharmika','H','2000-3-16','sharmikahari@gmail.com','5689012543','16 bakers street Amritsar'),
(06,'Ashmitha','V','2003-05-20','ashmitha@gmail.com','8976201289','26 mkv nagar Puducherry'),
(07,'Sakshi','M','2000-04-05','sakshi06@gmail.com','6345892018','78 A/B pm colony Banglore'),
(08,'Aryan','L','1999-02-18','aryan@gmail.com','2389470981','31 lkg colony Dehradun'),
(09,'Aadhvik','S','2003-05-30','aadhvik@gmail.com','2345678901','68 babu road Hyderabad'),
(010,'Karthik','V','2001-09-06','karthi@gmail.com','6834980212','82 A/B West mambalam Chennai');

select * from Customers

----1. insert value into table , ACCOUNTS----
insert into Accounts(account_id,customer_id,account_type,balance) values
(20241,01,'savings',250000.00),
(20242,02,'current',175469.68),
(20243,03,'zero_balance',0.00),
(20244,04,'savings',78018.00),
(20245,05,'zero_balance',0.00),
(20246,06,'current',90342.67),
(20247,07,'savings',3003456.00),
(20248,08,'zero_balance',0.00),
(20249,09,'current',24981.00),
(202410,010,'zero_balance',0.00);

select * from Accounts


----1. insert value into table , TRANSACTIONS----

update Transactions set transaction_date = cast(transaction_date as datetime);

insert into Transactions(transaction_id,account_id,transaction_type,amount,transaction_date) values
(301, 20241, 'Deposit', 10000.00, '2024-03-01 08:30:00'),
(302, 20242, 'Withdrawal', 500.50, '2024-03-01 09:45:00'),
(403, 20243, 'transfer', 2070.75, '2024-03-02 12:15:00'),
(404, 20244, 'Withdrawal', 800.20, '2024-03-02 14:30:00'),
(505, 20245, 'Deposit', 500.00, '2024-03-03 10:00:00'),
(506, 20246, 'transfer', 3008.75, '2024-03-03 11:30:00'),
(607, 20247, 'Deposit', 10067.50, '2024-03-03 14:45:00'),
(608, 20248, 'Withdrawal', 2180.25, '2024-03-04 09:15:00'),
(709, 20249, 'tranfer', 5090.00, '2024-03-04 11:00:00'),
(710, 202410, 'Withdrawal', 2500.90, '2024-03-04 15:30:00');

select * from Transactions

------TASK 2------- 
---------1. Write a SQL query to retrieve the name, account type and email of all customers.  

select  first_name + ' ' + last_name AS CustomerName,
    account_type,email from Customers c 
    JOIN Accounts a ON c.customer_id = a.customer_id;

---------2. Write a SQL query to list all transaction corresponding customer. 

select
    T.transaction_id,
    C.first_name + ' ' + C.last_name AS CustomerName,
    A.account_type,
    T.amount,
    T.transaction_date
from
    Transactions T
    JOIN Accounts A ON T.account_id = A.account_id
    JOIN Customers C ON A.customer_id = C.customer_id;

---------3. Write a SQL query to increase the balance of a specific account by a certain amount. 

update Accounts set Balance += 975.00 WHERE account_id = 20241;
select*from Accounts

---------4. Write a SQL query to Combine first and last names of customers as a full_name. 

select concat(first_name, ' ' , last_name) as full_name from Customers

---------5. Write a SQL query to remove accounts with a balance of zero where the account type is savings.

insert into Customers (customer_id,first_name,last_name,dob,email,phone_number,customer_address) values
(011,'Sathvik','D','2003-01-10','sathvik@gmail.com','9234689786','6 kk nagar Chennai');

insert into Accounts (account_id,customer_id,account_type,balance) values
(202411,011,'savings',0.00);

select * from Accounts

delete from Accounts where account_type = 'savings' AND balance = 0.0;

select *from Accounts

---------6.Write a SQL query to Find customers living in a specific city.

select *from Customers where charindex('Puducherry',customer_address)>0

---------7.Write a SQL query to Get the account balance for a specific account.

select balance from Accounts where account_id=20241

---------8.Write a SQL query to List all current accounts with a balance greater than $1,000. 

select * from Accounts

select account_id,account_type,balance from accounts where account_type='current' and balance >1000

---------9.Write a SQL query to Retrieve all transactions for a specific account.

select transaction_id,transaction_type,amount,transaction_date from Transactions where account_id= 20245

---------10.Write a SQL query to Calculate the interest accrued on savings accounts based on a given interest rate.

select account_id , balance * 0.60 as interest from Accounts where account_type ='savings'

---------11.Write a SQL query to Identify accounts where the balance is less than a specified overdraft limit. 

select account_id,account_type,Balance from Accounts where Balance < 500.00

---------12. Write a SQL query to Find customers not living in a specific city. 
SELECT *
FROM Customers
WHERE customer_address NOT LIKE '%Puducherry%'

---------TASK 3---------
---------1. Write a SQL query to Find the average account balance for all customers. 

Select avg(balance) as avg_B from Accounts

---------2.Write a SQL query to Retrieve the top 10 highest account balances.

select top 10 account_id,balance from Accounts order by balance DESC

---------3.Write a SQL query to Calculate Total Deposits for All Customers in specific date.
select * from transactions

select sum(amount) as total_deposits from Transactions where transaction_type='deposit' and transaction_date ='2024-03-03'

---------4. Write a SQL query to Find the Oldest and Newest Customers. 

SELECT concat(first_name,last_name),dob from Customers where dob=(select min(dob) from Customers) OR dob=(select max(dob) from Customers)

---------5. Write a SQL query to Retrieve transaction details along with the account type. 

select T. * , A.account_type from Transactions T join Accounts A on T.account_id = A.account_id

---------6. Write a SQL query to Get a list of customers along with their account details.

select concat_ws(' ',first_name,last_name) as Full_name , A. * 
from Customers as C join Accounts as A 
on C.customer_id = A.Customer_id

---------7.Write a SQL query to Retrieve transaction details along with customer information for a specific account.

select T. * , concat_ws(' ',first_name,last_name) as Full_name from Transactions as T 
join Accounts as A on T.account_id=A.account_id
join Customers as C on C.customer_id=A.customer_id
where A.account_id=20248

---------8. Write a SQL query to Identify customers who have more than one account.

insert into Customers(customer_id,first_name,last_name,dob,email,phone_number,customer_address) values
(012,'Virat','K','2001-11-17','viratk@gmail.com','8345780897','8vip nagar Salem');

insert into Accounts(account_id,customer_id,account_type,balance) values
(202411,010,'savings',75600.78),
(202412,07,'current',203400.50);

select *from Accounts

select customer_id ,COUNT (account_id) as NOA
from Accounts group by customer_id
having count(account_id)>1

---------9.Write a SQL query to Calculate the difference in transaction amounts between deposits and withdrawals.

insert into Transactions(transaction_id,account_id,transaction_type,amount,transaction_date) values
(303,20241,'withdrawal',2000,'2024-03-04 15:30:00')

select*from Transactions

select account_id,
    SUM(CASE WHEN transaction_type = 'Deposit' THEN Amount ELSE 0 END) AS Total_Deposits,
    SUM(CASE WHEN transaction_type = 'Withdrawal' THEN Amount ELSE 0 END) AS Total_Withdrawals,
    SUM(CASE WHEN transaction_type = 'Deposit' THEN Amount ELSE 0 END) -
    SUM(CASE WHEN transaction_type = 'Withdrawal' THEN Amount ELSE 0 END) AS Difference
from Transactions group by account_id;

---------10.Write a SQL query to Calculate the average daily balance for each account over a specified period. #$%

WITH DailyBalances AS (
    select 
        account_id,
        transaction_date,
        sum(CASE 
                WHEN transaction_type = 'Deposit' THEN amount
                WHEN transaction_type = 'Withdrawal' THEN -amount
                WHEN transaction_type = 'Transfer' THEN -amount
            END) AS daily_balance
    from 
        transactions
    group by 
        account_id, 
        transaction_date
)
select 
    account_id,
    avg(daily_balance) as average_daily_balance
from 
    DailyBalances
group by 
    account_id

---------11. Calculate the total balance for each account type. 

select account_type,sum(balance) as total_balance from Accounts group by account_type

---------12. Identify accounts with the highest number of transactions order by descending order.

select account_id,count(*) as total_transactions
from Transactions group by account_id order by total_transactions DESC

---------13. List customers with high aggregate account balances, along with their account types.

select Customers.customer_id ,Customers.first_name, Accounts.account_type ,
sum(balance) as total_balance from Customers
right join accounts on Customers.customer_id = Accounts.customer_id
group by Customers.customer_id ,Customers.first_name, Accounts.account_type
order by total_balance DESC

---------14. Identify and list duplicate transactions based on transaction amount, date, and account.
select * from Transactions

insert into Transactions(transaction_id,account_id,transaction_type,amount,transaction_date) values
(306,20241,'withdrawal',2000,'2024-03-04 15:30:00')

select * from Transactions

select account_id,transaction_date,amount ,count(*) as duplicate
from transactions
group by account_id,transaction_date,amount
having count (*)>1 

---------TASK 4--------
---------1. Retrieve the customer(s) with the highest account balance.

select*from Accounts

select * from Customers
where customer_id in 
(
select customer_id from Accounts where balance=
(select max(balance) from accounts)
)

---------2. Calculate the average account balance for customers who have more than one account. 

select C.customer_id, avg(A.Balance) AS AverageAccountBalance
from Customers C
JOIN Accounts A ON C.customer_id = A.customer_id
group by C.customer_id having count(A.account_id) > 1

---------3. Retrieve accounts with transactions whose amounts exceed the average transaction amount.

select T.account_id,A.account_type,avg(T.amount) as avg_trans_amt
from Transactions T join Accounts A on T.account_id = A.account_id
group by T.account_id,A.account_type
having max(T.amount) > avg(T.amount)

---------4.Identify customers who have no recorded transactions.

select c.customer_id ,c.first_name from Customers c 
join Accounts A on C.customer_id=A.customer_id
where A.account_id not in 
(select account_id from Transactions)

select * from Customers
select *from Accounts
select*from Transactions

---------5. Calculate the total balance of accounts with no recorded transactions.

SELECT
    account_id,
    customer_id,
    (SELECT SUM(balance) FROM Accounts A2 WHERE A2.account_id = A.account_id) AS total_bal
FROM
    Accounts A
WHERE
    account_id NOT IN (SELECT DISTINCT account_id FROM Transactions); 

---------6. Retrieve transactions for accounts with the lowest balance. 

select * from Customers
where customer_id in 
(
select customer_id from Accounts where balance=
(select min(balance) from accounts)
)

---------7. Identify customers who have accounts of multiple types. 

select * from Customers where customer_id in 
( select customer_id from accounts group by customer_id having count(customer_id) > 1 )

select* from Accounts

---------8. Calculate the percentage of each account type out of the total number of accounts. #$%

SELECT
    account_type,
   COUNT(*) AS NumberOfAccounts,
    CAST(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM Accounts) AS DECIMAL(5, 2)) AS Percentage
FROM
    Accounts
GROUP BY
    account_type

---------9. Retrieve all transactions for a customer with a given customer_id. 

select * from transactions where account_id in
( select account_id from Accounts where customer_id=1)

select* from Transactions

---------10. Calculate the total balance for each account type, including a subquery within the SELECT clause.

select a1.account_type , 
(select sum(a2.balance) from accounts A2 where a2.account_type = a1.account_type) as tot_bal
from accounts a1
group by account_type 



















    

    






















