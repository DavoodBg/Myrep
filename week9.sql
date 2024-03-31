-- Write query to create table product with below shown structure Figure 1. (schema – sakila). 
USE sakila;
CREATE TABLE product
(
Product_id int PRIMARY key,
product_name VARCHAR(50),
preventive_maintenance JSON,
repair_schedule JSON
);
SELECT * FROM product;
DESC product;

INSERT INTO product(product_id,product_name,preventive_maintenance,repair_schedule)
Values(101,'HondaAmaze','{"Part":"Motor","EngineerName":"ASTHA","MaintenanceDate":"1989-02-16"}','{"RepairDate":"1992-10-14","Expenditure":9000}'),
(102,'HondaCity','{"Part":"Steering","EngineerName":"Mayank","MaintenanceDate":"1985-04-16"}','{"RepairDate":"1989-01-14","Expenditure":19000}'),
(103,'HondaWR-V','{"Part":"Seat","EngineerName":"NEHA","MaintenanceDate":"1993-03-12"}','{"RepairDate":"1994-01-14","Expenditure":10000}'),
(104,'HondaJazz','{"Part":"Motor","EngineerName":"ASTHA","MaintenanceDate":"1997-02-10"}','{"RepairDate":"1996-01-12","Expenditure":5000}'),
(105,'HondaBR-V','{"Part":"Clutch Plate","EngineerName":"Sameer","MaintenanceDate":"2020-02-10"}','{"RepairDate":"2020-01-03","Expenditure":45000}');
SELECT * FROM product;


SELECT product_id,product_name,preventive_maintenance->'$.Part' Part,preventive_maintenance -> '$.MaintenanceDate' MaintenanceDate,repair_schedule -> '$.Expenditure' Expenditure
FROM product;

SELECT product_id,product_name,preventive_maintenance->'$.EngineerName' EngineerName,preventive_maintenance -> '$.MaintenanceDate' MaintenanceDate
FROM product;

SELECT product_id,product_name,preventive_maintenance->'$.EngineerName' EngineerName,preventive_maintenance -> '$.MaintenanceDate' MaintenanceDate, repair_schedule ->'$.RepairDate' RepairDate,repair_schedule ->'$.Expenditure' Expenditure
FROM product;