--List of "OPERATIONS AND QUESTIONS” posed by Wheels4U in their design documents

--1. Add a new hire
INSERT INTO HiredVehicle 
VALUES ('19--TTTTTT', '2019-01-29', 'MA', '4992585555586666', 82580, 9, 'AAAAAAAA', 04, 03, 'DDD 444', 'T3', 12345, 'EEEEE-66666');

--2. Add a new vehicle to the fleet
INSERT INTO Vehicle
VALUES ('HHH 888', 118, 'PearlWhite', 'Jeep', 'Wrangler', 01, '2021-11-10', 400000, 02);

--3. List all hires for the last month
SELECT *
FROM HiredVehicle
WHERE date >= '2019-01-01';

--4. Which make of vehicle has had the most hires?
SELECT make, count(*) AS 'hires'
FROM Vehicle v, HiredVehicle h 
WHERE  v.regNum = h.regNum
GROUP BY make
ORDER BY count(*) DESC;

--5. Which make of car is the most/least popular? --explain popular??
SELECT make, count(*) AS 'hires'
FROM Vehicle v, HiredVehicle h 
WHERE  v.regNum = h.regNum
GROUP BY make
ORDER BY count(*) DESC;

--6. Which depot has the most vehicles available for hire?
SELECT currentDepotID as 'Depot', count(*) as 'Vehicles available'
FROM Vehicle
GROUP BY "Depot"
ORDER BY count(*) DESC;

--7. Which depot is the most popular based on hires?
SELECT pickupID as 'Depot', count(*) as 'Hires'
FROM HiredVehicle
GROUP BY "Depot"
ORDER BY "Hires" DESC;

--8. List all the hires with a the number of hire days more than X.
SELECT hireID, days
FROM HiredVehicle
WHERE days > 5;

--9. List all the vehicles that have a scheduled service soon (in the next month).
SELECT regNum 
FROM Vehicle
WHERE nextServiceDate <= '2019-12-31';

--10. List all vehicles that do not currently have a future hire booked
--(did this on make/model instead as you don't book specific vehicles)
SELECT make, model
FROM VehicleType v
WHERE NOT EXISTS (
	SELECT *
	FROM Booking b 
	WHERE v.make = b.make
		AND v.model = b.model);

--11. List all invoices that have not been currently paid.
SELECT * 
FROM InvoiceWithCost
WHERE datePaid IS NULL;

--12. What are the different daily rental tariffs for tariff ID “T1” for each of the make/models?
SELECT * 
FROM VehicleTariff
WHERE tariffID = 'T1';



--Testing my INTEGRITY RULES (most of these should fail)

--Test NOT NULL of PK in client
INSERT INTO Client VALUES ('AAAAAAAA', 'JOEL', 'PILLAR', 'SIR', 'LZ3148', '23 MadeUp Road', '5050');

--Test FOREIGN KEY integrity of ClientPhoneNo
INSERT INTO ClientPhoneNo VALUES ('ZZZZZZZZ', '555-3699');

--TEST DUAL PK of VehicleType (this should succeed - same make, different model)
INSERT INTO VehicleType VALUES ('Ford', 'LASER', 5, 'Sedan', 'Sport');

--TEST DUAL PK of VehicleType (this should fail - same make and model)
INSERT INTO VehicleType VALUES ('Ford', 'Falcon', 2, 'Hatch', 'Standard');

--TEST CONSTRAINT rules of ENUM in VehicleType
INSERT INTO VehicleType VALUES ('Volkswagen', 'Beetle', 2, 'Bug', 'Standard');

--TEST CONSTRAINT rules of ENUM in VehicleType
INSERT INTO VehicleType VALUES ('Volkswagen', 'Beetle', 2, 'Hatch', 'Groovy');

--TEST double FOREIGN KEY of Vehicle (both make and model exist in VehicleType, but in different tuples)
INSERT INTO Vehicle VALUES ('ZZZ 999', 120, 'Yellow', 'Ford', 'Commodore', 01, '2020-04-04', 120000, 01);

--TEST inserting NULL for insuranceID but a value for policyNumber
INSERT INTO HiredVehicle VALUES ('21--JJKKLL', '2018-09-07', 'VI', '4992558799996666', 110000, 5, 'AAAAAAAA', 04, 04, 'DDD 444', 'T1', NULL, 'FFFFF-77777');



--Testing my CASCADE and DELETE RULES 

--UPDATE DepotID to test CASCADE to Vehicle (should succeed)
SELECT regNum, currentDepotID
FROM Vehicle
WHERE make = "Holden";

UPDATE Depot
SET depotID = 06
WHERE depotID = 01;

SELECT regNum, currentDepotID
FROM Vehicle
WHERE make = "Holden";


--UPDATE VehicleType to test CASCADE to Vehicle (should fail because UPDATE NO ACTION specified)
SELECT regNum, make, model
FROM Vehicle
WHERE make = "Tesla";

UPDATE VehicleType
SET model = 'E'
WHERE make = "Tesla";

SELECT regNum, make, model
FROM Vehicle
WHERE make = "Tesla";


--DELETE a Client, to test CASCADE to CompanyClient (should succeed)
SELECT *
FROM CompanyClient;

DELETE FROM Client
WHERE clientID = "FFFFFFFF";

SELECT *
FROM CompanyClient;


--DELETE a Client, to test CASCADE to Drivers (should fail because DELETE NO ACTION specified)
SELECT *
FROM Drivers
WHERE clientID = "BBBBBBBB";

DELETE FROM Client
WHERE clientID = "BBBBBBBB";

SELECT *
FROM Drivers
WHERE clientID = "BBBBBBBB";
