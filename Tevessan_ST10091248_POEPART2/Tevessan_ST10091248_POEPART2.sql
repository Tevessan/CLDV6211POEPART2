create database rideYouRentSt10091248;

-- main tables
CREATE TABLE cars_st10091248 (
car_no VARCHAR(10) PRIMARY KEY,
make VARCHAR(20) NOT NULL,
model VARCHAR(50) NOT NULL,
body_type VARCHAR(20) NOT NULL,
kilometers_travelled INT NOT NULL,
service_kilometers INT NOT NULL,
available VARCHAR(3) NOT NULL
);

CREATE TABLE inspectors_st10091248 (
inspector_no VARCHAR(10) PRIMARY KEY,
first_name VARCHAR(50) NOT NULL,
last_name VARCHAR(50) NOT NULL,
email VARCHAR(100) UNIQUE NOT NULL,
mobile VARCHAR(15) UNIQUE NOT NULL
);

CREATE TABLE drivers_st10091248 (
id INT IDENTITY(1,1) PRIMARY KEY,
first_name VARCHAR(50) NOT NULL,
last_name VARCHAR(50) NOT NULL,
street_address VARCHAR(100) NOT NULL,
city VARCHAR(50) NOT NULL,
state_province VARCHAR(50) NOT NULL,
postal_code VARCHAR(20) NOT NULL,
email VARCHAR(100) UNIQUE NOT NULL,
mobile VARCHAR(15) UNIQUE NOT NULL
);

CREATE TABLE rentals_st10091248 (
id INT IDENTITY(1,1) PRIMARY KEY,
car_no VARCHAR(10) NOT NULL FOREIGN KEY REFERENCES cars_st10091248(car_no),
inspector_no VARCHAR(10) NOT NULL FOREIGN KEY REFERENCES inspectors_st10091248(inspector_no),
driver_id INT NOT NULL FOREIGN KEY REFERENCES drivers_st10091248(id),
rental_fee DECIMAL(10, 2) NOT NULL,
start_date DATE NOT NULL,
end_date DATE NOT NULL
);


-- look up table
CREATE TABLE fines_st10091248 (
fine_id int NOT NULL identity(1,1),
fine int NOT NULL,
Constraint Fineid_pk Primary Key(fine_id)
);

CREATE TABLE Return_st10091248 (
CarNo VARCHAR(10),
inspector_id VARCHAR(10),
driver_id INT IDENTITY(1,1),
ReturnDate DATE,
ElapsedDate INT,
fine_id INT,
FOREIGN KEY (CarNo) REFERENCES cars_st10091248(car_no),
FOREIGN KEY (inspector_id) REFERENCES inspectors_st10091248(inspector_no),
FOREIGN KEY (driver_id) REFERENCES drivers_st10091248(id),
FOREIGN KEY (fine_id) REFERENCES fines_st10091248(fine_id)
);

-- cars_st10091248 table
INSERT INTO cars_st10091248 (car_no, make, model, body_type, kilometers_travelled, service_kilometers, available)
VALUES
('HYU001', 'Hyundai', 'Grand i10 1.0 Motion', 'Hatchback', 1500, 15000, 'yes'),
('HYU002', 'Hyundai', 'i20 1.2 Fluid', 'Hatchback', 3000, 15000, 'yes'),
('BMW001', 'BMW', '320d 1.2', 'Sedan', 20000, 50000, 'yes'),
('BMW002', 'BMW', '240d 1.4', 'Sedan', 9500, 15000, 'yes'),
('TOY001', 'Toyota', 'Corolla 1.0', 'Sedan', 15000, 50000, 'yes'),
('TOY002', 'Toyota', 'Avanza 1.0', 'SUV', 98000, 15000, 'yes'),
('TOY003', 'Toyota', 'Corolla Quest 1.0', 'Sedan', 15000, 50000, 'yes'),
('MER001', 'Mercedes Benz', 'c180', 'Sedan', 5200, 15000, 'yes'),
('MER002', 'Mercedes Benz', 'A200', 'Sedan', 4080, 15000, 'yes'),
('FOR001', 'Ford', 'Fiesta 1.0', 'Sedan', 7600, 15000, 'yes');

select * from cars_st10091248;

-- inspectors_st10091248 table
INSERT INTO inspectors_st10091248 (inspector_no, first_name, last_name, email, mobile)
VALUES
('I101', 'Bud', 'Barnes', 'bud@therideyourent.com', '0821585359'),
('I102', 'Tracy', 'Reeves', 'tracy@therideyourent.com', '0822889988'),
('I103', 'Sandra', 'Goodwin', 'sandra@therideyourent.com', '0837695468'),
('I104', 'Shannon', 'Burke', 'shannon@therideyourent.com', '0836802514');

select * from inspectors_st10091248;

-- drivers_st10091248 table
INSERT INTO drivers_st10091248 (first_name, last_name, street_address, city, state_province, postal_code, email, mobile)
VALUES
('Gabrielle', 'Clarke', '917 Heuvel St', 'Botshabelo', 'Free State', '9781', 'gorix10987@macauvpn.com', '0837113269'),
('Geoffrey', 'Franklin', '1114 Dorp St', 'Paarl', 'Western Cape', '7655', 'noceti8743@drlatvia.com', '0847728052'),
('Fawn', 'Cooke', '2158 Prospect St', 'Garsfontein', 'Gauteng', '0042', 'yegifav388@enamelme.com', '0821966584'),
('Darlene', 'Peters', '2529 St. John Street', 'Somerset West', 'Western Cape', '7110', 'mayeka4267@macauvpn.com', '0841221244'),
('Vita', 'Soto', '1474 Wolmarans St', 'Sundra', 'Mpumalanga', '2200', 'wegog55107@drlatvia.com', '0824567924'),
('Opal', 'Rehbein', '697 Thutlwa St', 'Letaba', 'Limpopo', '0870', 'yiyow34505@enpaypal.com', '0826864938'),
('Vernon', 'Hodgson', '1935 Thutlwa St', 'Letsitele', 'Limpopo', '0885', 'gifeh11935@enamelme.com', '0855991446'),
('Crispin', 'Wheatly', '330 Sandown Rd', 'Cape Town', 'Western Cape', '8018', 'likon78255@macauvpn.com', '0838347945'),
('Melanie', 'Cunningham', '616 Loop St', 'Atlantis', 'Western Cape', '7350', 'sehapeb835@macauvpn.com', '0827329001'),
('Kevin', 'Peay', '814 Daffodil Dr', 'Elliotdale', 'Eastern Cape', '5118', 'xajic53991@enpaypal.com', '0832077149');

select * from drivers_st10091248;

-- rentals table
INSERT INTO rentals_st10091248 (car_no, inspector_no, driver_id, rental_fee, start_date, end_date)
VALUES
('HYU001', 'I101', 1, 5000, '2021-08-30', '2021-08-31'),
('HYU002', 'I101', 1, 5000, '2021-09-01', '2021-09-10'),
('FOR001', 'I101', 2, 6500, '2021-09-01', '2021-09-10'),
('BMW002', 'I102', 5, 7000, '2021-09-20', '2021-09-25'),
('TOY002', 'I102', 4, 5000, '2021-10-03', '2021-10-31'),
('MER001', 'I103', 4, 8000, '2021-10-05', '2021-10-15'),
('HYU002', 'I104', 7, 5000, '2021-12-01', '2022-02-10'),
('TOY003', 'I104', 9, 5000, '2021-08-10', '2021-08-31');

Select * from rentals_st10091248;

-- fines table
INSERT INTO fines_st10091248 (fine)
VALUES
(0), (2500), (1000), (500);

select * from fines_st10091248;


-- ReturnInfo table
set IDENTITY_INSERT Return_st10091248 ON;

INSERT INTO Return_st10091248 (CarNo, inspector_id, driver_id, ReturnDate, ElapsedDate, fine_id)
VALUES
('HYU001', 'I101', 1, '2021-08-31', 0, 1),
('HYU002', 'I101', 1, '2021-09-10', 0, 1),
('FOR001', 'I101', 2, '2021-09-10', 0, 1),
('BMW002', 'I102', 5, '2021-09-30', 5, 2),
('TOY002', 'I102', 4, '2021-10-31', 2, 3),
('MER001', 'I103', 4, '2021-10-15', 1, 4),
('HYU002', 'I104', 7, '2022-02-10', 0, 1),
('TOY003', 'I104', 9, '2021-08-31', 0, 1);

select * from  Return_st10091248;


-- question 5
SELECT cars_st10091248.car_no, inspectors_st10091248.first_name + ' ' + inspectors_st10091248.last_name AS inspector_name, drivers_st10091248.first_name + ' ' + drivers_st10091248.last_name AS driver_name, rentals_st10091248.rental_fee, rentals_st10091248.start_date, rentals_st10091248.end_date
FROM rentals_st10091248
JOIN cars_st10091248 ON rentals_st10091248.car_no = cars_st10091248.car_no
JOIN inspectors_st10091248 ON rentals_st10091248.inspector_no = inspectors_st10091248.inspector_no
JOIN drivers_st10091248 ON rentals_st10091248.driver_id = drivers_st10091248.id
WHERE rentals_st10091248.start_date >= '2021-08-01' AND rentals_st10091248.end_date <= '2021-10-30';

-- question 6
SELECT cars_st10091248.car_no, inspectors_st10091248.first_name + ' ' + inspectors_st10091248.last_name AS inspector_name, drivers_st10091248.first_name + ' ' + drivers_st10091248.last_name AS driver_name, rentals_st10091248.rental_fee, rentals_st10091248.start_date, rentals_st10091248.end_date
FROM rentals_st10091248
JOIN cars_st10091248 ON rentals_st10091248.car_no = cars_st10091248.car_no
JOIN drivers_st10091248 ON rentals_st10091248.driver_id = drivers_st10091248.id
JOIN inspectors_st10091248 ON rentals_st10091248.inspector_no = inspectors_st10091248.inspector_no
WHERE inspectors_st10091248.first_name + ' ' + inspectors_st10091248.last_name = 'Bud Barnes';


-- queston 7
SELECT Return_st10091248.CarNo, cars_st10091248.make, drivers_st10091248.first_name + ' ' + drivers_st10091248.last_name AS driver_name, Return_st10091248.ReturnDate, Return_st10091248.ElapsedDate, fines_st10091248.fine
FROM Return_st10091248
JOIN cars_st10091248 ON Return_st10091248.CarNo = cars_st10091248.car_no
JOIN drivers_st10091248 ON Return_st10091248.driver_id = drivers_st10091248.id
JOIN fines_st10091248 ON Return_st10091248.fine_id = fines_st10091248.fine_id
WHERE cars_st10091248.make = 'Toyota';

-- question 8
SELECT COUNT(*) FROM rentals_st10091248 JOIN cars_st10091248 ON rentals_st10091248.car_no = cars_st10091248.car_no WHERE cars_st10091248.make = 'Hyundai';

-- question 9
UPDATE cars_st10091248 SET model = 'Focus' WHERE car_no = 'FOR001';
select * from cars_st10091248;

-- question 10
SELECT cars_st10091248.car_no, drivers_st10091248.first_name + ' ' + drivers_st10091248.last_name AS driver_name, 
rentals_st10091248.rental_fee, rentals_st10091248.start_date,
rentals_st10091248.end_date, cars_st10091248.available FROM rentals_st10091248 
JOIN cars_st10091248 ON rentals_st10091248.car_no = cars_st10091248.car_no 
JOIN drivers_st10091248 ON rentals_st10091248.driver_id = drivers_st10091248.id WHERE cars_st10091248.available = 'yes';

-- question 11
SELECT DISTINCT make FROM cars_st10091248;

-- question 12
SELECT * FROM cars_st10091248 WHERE kilometers_travelled + 9000 >= service_kilometers;

-- question 13
SELECT 
Return_st10091248.CarNo, drivers_st10091248.first_name + ' ' + 
drivers_st10091248.last_name AS driver_name, Return_st10091248.ReturnDate,
DATEDIFF(day, Return_st10091248.ReturnDate, GETDATE()) * 500 AS total_fine FROM Return_st10091248 
JOIN drivers_st10091248 ON Return_st10091248.driver_id = drivers_st10091248.id;

