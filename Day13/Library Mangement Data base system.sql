create table Books (book_id int primary key,title varchar(30),author_id int,foreign key(author_id) REFERENCES Authors(author_id), publication_year date, genre varchar(30),isbn int,available_copies int);
create table authors (author_id int primary key,first_name varchar(30),last_name varchar(30),date_of_birth date,nationality varchar(30));
create table members (member_id int primary key, first_name varchar(30),last_name varchar(30),date_of_birth date,contact_number int,email varchar(30),membership_date date);
create table loans (loan_id int primary key,book_id int,foreign key(book_id) references books(book_id),member_id int,foreign key(member_id) references members(member_id),loan_date date,return_date date,actual_return_date date);
create table staff (staff_id int primary key, first_name varchar(30),last_name varchar(30),position varchar(30),contact_number int,email varchar(30),hire_date date);

-- DDL

-- Add a new column to book table
alter table books add books_sold int;
select * from books
-- Rename the position column in the staff table to job_title
alter table staff rename column position to job_title;
select * from staff;
-- Drop the email column from the member's table
alter table members drop email;
select * from members;
-- Adding book_id column in members table
alter table members add book_id int;
-- DML Queries

-- insert data into books table
insert into books values (1,'Javac',21,'2024-05-28','comedy',23456,500,1230);
insert into books values (2,'CJava',22,'2024-01-22','Numed',23406,520,2230);
-- before inserting in books we have to insert in authors
insert into authors values (21,'Saket','Kumar','2024-02-23','Indian');
insert into authors values (22,'Ashish','Chauhan','2024-01-20','Indian');
-- Inserting data in Members 
insert into members values(2,'Prathamesh','Ingale','1996-02-22',1234567890,'2023-02-02');
insert into members values(3,'Ramesh','Ingale','1990-02-22',132235890,'2022-02-02');
-- Inserting data into loans
insert into loans values (1,2,2,'2023-09-23','2023-10-25','2023-11-10');
insert into loans values (2,1,3,'2023-02-23','2023-07-25','2023-09-10');
-- Inserting data into staff
insert into staff values(23,'Rami','Sultan','Assistant',123456,'rami@sultan.com','2023-08-10');
insert into staff values(22,'Adi','Mirza','Librarian',654321,'adi@sultan.com','2024-05-10');
insert into staff values(29,'Shami','Sultan','Librarian',890765,'shami@sultan.com','2023-12-10');
-- Update a members contact number
update members set contact_number=909898245 where member_id =3;
-- Delete a specific loan record
delete from loans where loan_id=1;
insert into loans values (3,2,2,'2024-02-23','2024-06-25','2024-08-10');


-- Join Queries

-- Retrieve all books along with their authors
select title,first_name from books INNER JOIN authors on books.author_id = authors.author_id;
-- Find all books currentlry on loan along with member details
select title,first_name from  members Inner Join loans on loans.member_id = members.member_id INNER JOIN books on books.book_id = loans.book_id;

--get the total number of books and the total avilable copies for each genere
select genre, count(*) AS total_books, sum(available_copies) as total_avilable_copies from books group by genre;

-- find all staff members who are librarians and their hire dates
select hire_date,last_name,first_name as Staff_Members from staff where job_title='Librarian';
create table Books (book_id int primary key,title varchar(30),author_id int,foreign key(author_id) REFERENCES Authors(author_id), publication_year date, genre varchar(30),isbn int,available_copies int);
create table authors (author_id int primary key,first_name varchar(30),last_name varchar(30),date_of_birth date,nationality varchar(30));
create table members (member_id int primary key, first_name varchar(30),last_name varchar(30),date_of_birth date,contact_number int,email varchar(30),membership_date date);
create table loans (loan_id int primary key,book_id int,foreign key(book_id) references books(book_id),member_id int,foreign key(member_id) references members(member_id),loan_date date,return_date date,actual_return_date date);
create table staff (staff_id int primary key, first_name varchar(30),last_name varchar(30),position varchar(30),contact_number int,email varchar(30),hire_date date);

-- DDL

-- Add a new column to book table
alter table books add books_sold int;
select * from books
-- Rename the position column in the staff table to job_title
alter table staff rename column position to job_title;
select * from staff;
-- Drop the email column from the member's table
alter table members drop email;
select * from members;
-- Adding book_id column in members table
alter table members add book_id int;
-- DML Queries

-- insert data into books table
insert into books values (1,'Javac',21,'2024-05-28','comedy',23456,500,1230);
insert into books values (2,'CJava',22,'2024-01-22','Numed',23406,520,2230);
-- before inserting in books we have to insert in authors
insert into authors values (21,'Saket','Kumar','2024-02-23','Indian');
insert into authors values (22,'Ashish','Chauhan','2024-01-20','Indian');
-- Inserting data in Members 
insert into members values(2,'Prathamesh','Ingale','1996-02-22',1234567890,'2023-02-02');
insert into members values(3,'Ramesh','Ingale','1990-02-22',132235890,'2022-02-02');
-- Inserting data into loans
insert into loans values (1,2,2,'2023-09-23','2023-10-25','2023-11-10');
insert into loans values (2,1,3,'2023-02-23','2023-07-25','2023-09-10');
-- Inserting data into staff
insert into staff values(23,'Rami','Sultan','Assistant',123456,'rami@sultan.com','2023-08-10');
insert into staff values(22,'Adi','Mirza','Librarian',654321,'adi@sultan.com','2024-05-10');
insert into staff values(29,'Shami','Sultan','Librarian',890765,'shami@sultan.com','2023-12-10');
-- Update a members contact number
update members set contact_number=909898245 where member_id =3;
-- Delete a specific loan record
delete from loans where loan_id=1;
insert into loans values (3,2,2,'2024-02-23','2024-06-25','2024-08-10');


-- Join Queries

-- Retrieve all books along with their authors
select title,first_name from books INNER JOIN authors on books.author_id = authors.author_id;
-- Find all books currentlry on loan along with member details
select title,first_name from  members Inner Join loans on loans.member_id = members.member_id INNER JOIN books on books.book_id = loans.book_id;

--get the total number of books and the total avilable copies for each genere
select genre, count(*) AS total_books, sum(available_copies) as total_avilable_copies from books group by genre;

-- find all staff members who are librarians and their hire dates
select hire_date,last_name,first_name as Staff_Members from staff where job_title='Librarian';
create table Books (book_id int primary key,title varchar(30),author_id int,foreign key(author_id) REFERENCES Authors(author_id), publication_year date, genre varchar(30),isbn int,available_copies int);
create table authors (author_id int primary key,first_name varchar(30),last_name varchar(30),date_of_birth date,nationality varchar(30));
create table members (member_id int primary key, first_name varchar(30),last_name varchar(30),date_of_birth date,contact_number int,email varchar(30),membership_date date);
create table loans (loan_id int primary key,book_id int,foreign key(book_id) references books(book_id),member_id int,foreign key(member_id) references members(member_id),loan_date date,return_date date,actual_return_date date);
create table staff (staff_id int primary key, first_name varchar(30),last_name varchar(30),position varchar(30),contact_number int,email varchar(30),hire_date date);

-- DDL

-- Add a new column to book table
alter table books add books_sold int;
select * from books
-- Rename the position column in the staff table to job_title
alter table staff rename column position to job_title;
select * from staff;
-- Drop the email column from the member's table
alter table members drop email;
select * from members;
-- Adding book_id column in members table
alter table members add book_id int;
-- DML Queries

-- insert data into books table
insert into books values (1,'Javac',21,'2024-05-28','comedy',23456,500,1230);
insert into books values (2,'CJava',22,'2024-01-22','Numed',23406,520,2230);
-- before inserting in books we have to insert in authors
insert into authors values (21,'Saket','Kumar','2024-02-23','Indian');
insert into authors values (22,'Ashish','Chauhan','2024-01-20','Indian');
-- Inserting data in Members 
insert into members values(2,'Prathamesh','Ingale','1996-02-22',1234567890,'2023-02-02');
insert into members values(3,'Ramesh','Ingale','1990-02-22',132235890,'2022-02-02');
-- Inserting data into loans
insert into loans values (1,2,2,'2023-09-23','2023-10-25','2023-11-10');
insert into loans values (2,1,3,'2023-02-23','2023-07-25','2023-09-10');
-- Inserting data into staff
insert into staff values(23,'Rami','Sultan','Assistant',123456,'rami@sultan.com','2023-08-10');
insert into staff values(22,'Adi','Mirza','Librarian',654321,'adi@sultan.com','2024-05-10');
insert into staff values(29,'Shami','Sultan','Librarian',890765,'shami@sultan.com','2023-12-10');
-- Update a members contact number
update members set contact_number=909898245 where member_id =3;
-- Delete a specific loan record
delete from loans where loan_id=1;
insert into loans values (3,2,2,'2024-02-23','2024-06-25','2024-08-10');


-- Join Queries

-- Retrieve all books along with their authors
select title,first_name from books INNER JOIN authors on books.author_id = authors.author_id;
-- Find all books currentlry on loan along with member details
select title,first_name from  members Inner Join loans on loans.member_id = members.member_id INNER JOIN books on books.book_id = loans.book_id;

--get the total number of books and the total avilable copies for each genere
select genre, count(*) AS total_books, sum(available_copies) as total_avilable_copies from books group by genre;

-- find all staff members who are librarians and their hire dates
select hire_date,last_name,first_name as Staff_Members from staff where job_title='Librarian';


