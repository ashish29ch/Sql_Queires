create database Insurance;
create table Customers (customer_id int primary key,first_name varchar(30),last_name varchar(30),date_of_birth date,gender varchar(10),contact_number int,email varchar(30),address varchar(30));
create table policies (policy_id int primary key,policy_name varchar(20),policy_type varchar(10),coverage_details varchar(20),premium int,start_date date,end_date date);
create table claims (claim_id int primary key,claim_date date,claim_amount int,approved_amount int,claim_status varchar(20),policy_id int,customer_id int);
create table agents (agent_id int primary key,first_name varchar(30),last_name varchar(30),contact_number int,email varchar(30),hire_date date);
create table policyAssignments (assignment_id int primary key,customer_id int,FOREIGN KEY(customer_id) REFERENCES Customers(customer_id),policy_id int,FOREIGN KEY(policy_id) REFERENCES policies(policy_id),start_date date,end_date date);
create table claimProcessing (processing_id int primary key,claim_id int,FOREIGN KEY(claim_id) REFERENCES claims(claim_id),processing_date date,payment_amount int,payment_date date);

-- Before altering make the calims table add constraint unique on cutomer_id
alter table claims add CONSTRAINT unique_cutomer_id UNIQUE(customer_id);
-- Adding foreign keys
alter table customers add CONSTRAINT FK_customer_id FOREIGN KEY(customer_id) REFERENCES claims(customer_id);

-- adding FK constraint on policy_id
alter table claims add CONSTRAINT unique_policy_id UNIQUE (policy_id);
-- adding FK
alter table policies add CONSTRAINT FK_policy_id FOREIGN KEY(policy_id) REFERENCES claims(policy_id);

-- INSERTING data into CUSTOMERS table
INSERT INTO Customers VALUES (1, 'Ashish', 'Chauhan', '1990-01-01', 'Male', 1234567890, 'ashish.doe@example.com', '123 Main St');
INSERT INTO Customers VALUES (2, 'Huge', 'Jackman', '1985-05-15', 'Female', 1876543210, 'huge.smith@example.com', '456 Elm St');
INSERT INTO Customers VALUES (3, 'Ryan', 'Reynolds', '1992-07-22', 'Male', 1555555555, 'rayn.brown@example.com', '789 Oak St');
-- INSERTING data in CLAIMS table
INSERT INTO Claims VALUES (201, '2024-07-10', 20000, 18000, 'Approved', 101, 1);
INSERT INTO Claims VALUES (202, '2024-08-15', 15000, 15000, 'Approved', 102, 2);
INSERT INTO Claims VALUES (203, '2024-09-20', 5000, 4000, 'Pending', 103, 3);
-- INSERTING DATA into POLICIES
INSERT INTO Policies VALUES (101, 'Life Insurance', 'Life', 'Full Coverage', 10000, '2024-01-01', '2029-01-01');
INSERT INTO Policies VALUES (102, 'Car Insurance', 'Auto', 'Collision and Theft', 5000, '2024-01-01', '2029-01-01');
INSERT INTO Policies VALUES (103, 'Health Insurance', 'Health', 'General Health', 3000, '2024-01-01', '2029-01-01');
-- INSERTING into AGENTS
INSERT INTO Agents VALUES (301, 'Saket', 'Kumar', 67778888, 'saket.carter@insurecorp.com', '2023-01-01');
INSERT INTO Agents VALUES (302, 'Singh', 'Shivam', 78889999, 'singh.taylor@insurecorp.com', '2023-01-02');
INSERT INTO Agents VALUES (303, 'Pancholi', 'Aditya', 89990000, 'pancholi.wilson@insurecorp.com', '2023-01-03');
-- Inserting into PolicyAssignments
INSERT INTO PolicyAssignments VALUES (401, 1, 101, '2024-01-01', '2029-01-01');
INSERT INTO PolicyAssignments VALUES (402, 2, 102, '2024-01-01', '2029-01-01');
INSERT INTO PolicyAssignments VALUES (403, 3, 103, '2024-01-01', '2029-01-01');
-- Inserting into claim Processing
INSERT INTO ClaimProcessing VALUES (501, 201, '2024-07-15', 18000, '2024-07-20');
INSERT INTO ClaimProcessing VALUES (502, 202, '2024-08-20', 15000, '2024-08-25');
INSERT INTO ClaimProcessing VALUES (503, 203, '2024-09-25', 4000, '2024-09-30');

-- ADD a new column to agents table
alter table agents add location varchar(30);

-- rename the policy_name column int policies to policy_title
ALTER TABLE policies RENAME COLUMN policy_name to policy_title;

-- Drop the address column in customers table
ALTER TABLE Customers drop address;

-- DML QUERIES

-- Update a policy's premium amount
UPDATE policies set premium=3050 where policy_id=101;
select * from policies;

-- Delete a Specific Claim (before deleting a claim from calims table delete the calim_id from customers as it is a foreign key)
DELETE from policyAssignments where customer_id =1;
DELETE from Customers where customer_id =1;
DELETE from policies where policy_id=101;
DELETE from claimProcessing where claim_id=201;
DELETE from claims where claim_id =201;

-- INsert a new Policy Assignment
select * from policyAssignments;
INSERT INTO Claims VALUES (205, '2024-07-10', 20000, 18000, 'Approved', 105, 5);
INSERT INTO Customers VALUES (5, 'Ashish', 'Chauhan', '1990-01-01', 'Male', 1234567890, 'ashish.doe@example.com');
INSERT INTO Policies VALUES (105, 'Life Insurance', 'Life', 'Full Coverage', 10000, '2024-01-01', '2029-01-01');
INSERT INTO PolicyAssignments VALUES (405, 5, 105, '2024-01-01', '2029-01-01');

-- Join Queries

-- all customers with their assigned policies and agnets
SELECT c.*, p.policy_title, a.first_name AS agent_first_name, a.last_name AS agent_last_name
FROM Customers c
JOIN PolicyAssignments pa ON c.customer_id = pa.customer_id
JOIN Policies p ON pa.policy_id = p.policy_id
JOIN Agents a ON c.customer_id = a.agent_id;
-- Find all claims and the associated policy details
SELECT cl.*, p.policy_title, p.coverage_details, p.premium
FROM Claims cl
JOIN Policies p ON cl.policy_id = p.policy_id;
-- List all claims along with customers details
SELECT cl.*, c.first_name, c.last_name, c.contact_number
FROM Claims cl
JOIN Customers c ON cl.customer_id = c.customer_id;
-- Get the total claim amount and number of claims per policy
SELECT p.policy_type, COUNT(cl.claim_id) AS number_of_claims, SUM(cl.claim_amount) AS total_claim_amount
FROM Claims cl
JOIN Policies p ON cl.policy_id = p.policy_id
GROUP BY p.policy_type;
-- find the most recent claim for each customer
SELECT c.customer_id, c.first_name, c.last_name, MAX(cl.claim_date) AS recent_claim_date
FROM Customers c
JOIN Claims cl ON c.customer_id = cl.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name;





