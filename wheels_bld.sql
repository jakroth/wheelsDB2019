PRAGMA foreign_keys = ON;
.header on
.mode column

DROP TABLE Client;
DROP TABLE CompanyClient;
DROP TABLE ClientPhoneNo;
DROP TABLE Drivers;
DROP TABLE Depot;
DROP TABLE DepotPhoneNo;
DROP TABLE Vehicle;
DROP TABLE VehicleType;
DROP TABLE HiredVehicle;
DROP TABLE DailyTariff;
DROP TABLE VehicleTariff;
DROP TABLE Insurance;
DROP TABLE Invoice;
DROP TABLE Booking;
DROP TABLE ServiceHistory;
DROP VIEW InvoiceWithCost;

 
CREATE TABLE Client (
clientID				CHAR(8)	NOT NULL, 
fName 					CHAR(20),
lName 					CHAR(20),
title 					CHAR(4),
driversNum	 			CHAR(12),
street					CHAR(45), 
postcode				CHAR(4), 
PRIMARY KEY (clientID)
);

CREATE TABLE Depot (
depotID					INT(2) NOT NULL,  
street					CHAR(45), 
postcode				CHAR(4), 
fax						CHAR(14),
PRIMARY KEY (depotID)
);

CREATE TABLE VehicleType (
make					CHAR(8) NOT NULL,  
model					CHAR(8) NOT NULL, 
doors					INT(1), 
body					CHAR(5) CHECK (body IN ('Hatch', 'Sedan', 'SUV', 'Coupe')), 
trim					CHAR(8) CHECK (trim IN ('Standard', 'Sport', 'Luxury')),
PRIMARY KEY (make, model)
);

CREATE TABLE DailyTariff (
tariffID				CHAR(2), 
conditions				VARCHAR,
PRIMARY KEY (tariffID)
);

CREATE TABLE CompanyClient (
clientID				CHAR(8) NOT NULL, 
cName					CHAR(20),
PRIMARY KEY (clientID),
FOREIGN KEY (clientID) REFERENCES Client(clientID) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE ClientPhoneNo (
clientID				CHAR(8) NOT NULL, 
phoneNo					CHAR(14) NOT NULL, 
PRIMARY KEY (clientID, phoneNo),
FOREIGN KEY (clientID) REFERENCES Client(clientID) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE Drivers (
clientID				CHAR(8) NOT NULL, 
hireID					CHAR(10) NOT NULL,  
PRIMARY KEY (clientID, hireID),
FOREIGN KEY (clientID) REFERENCES Client(clientID) ON UPDATE CASCADE ON DELETE NO ACTION,
FOREIGN KEY (hireID) REFERENCES HiredVehicle(hireID) ON UPDATE CASCADE ON DELETE NO ACTION
);

CREATE TABLE DepotPhoneNo (
depotID					INT(2) NOT NULL,  
phoneNo					CHAR(14) NOT NULL, 
PRIMARY KEY (depotID, phoneNo),
FOREIGN KEY (depotID) REFERENCES Depot(depotID) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE Vehicle (
regNum					CHAR(7)	NOT NULL,  
fleetNum				INT(3), 
colour					CHAR(12), 
make					CHAR(8)	NOT NULL,  
model					CHAR(8)	NOT NULL,  
currentDepotID			INT(2)	NOT NULL,   
nextServiceDate			DATE, 
nextServiceKilometrage	INT(6), 
nextServiceDepotID		INT(2)	NOT NULL, 
PRIMARY KEY (regNum)
FOREIGN KEY (make, model) REFERENCES VehicleType(make, model) ON UPDATE NO ACTION ON DELETE NO ACTION,
FOREIGN KEY (currentDepotID) REFERENCES Depot(depotID) ON UPDATE CASCADE ON DELETE SET NULL,
FOREIGN KEY (nextServiceDepotID) REFERENCES Depot(depotID) ON UPDATE CASCADE ON DELETE NO ACTION
);

CREATE TABLE HiredVehicle ( 
hireID					CHAR(10) NOT NULL, 
date 					DATE,
cardType				CHAR(2), 
cardNo					CHAR(20), 
kilometrage				INT(6), 
days					INT(2),
clientID				CHAR(8) NOT NULL, 
pickupID				INT(2) NOT NULL,   
returnID				INT(2) NOT NULL,   
regNum					CHAR(7)	NOT NULL,  
tariffID				CHAR(2)	NOT NULL,  
insuranceID				INT(5),  
policyNumber			CHAR(12) CHECK (CASE WHEN insuranceID IS NULL THEN policyNumber IS NULL END), --no need for a policy number unless take out insurance. 
PRIMARY KEY (hireID),
FOREIGN KEY (clientID) REFERENCES Client(clientID) ON UPDATE CASCADE ON DELETE NO ACTION,
FOREIGN KEY (pickupID) REFERENCES Depot(depotID) ON UPDATE CASCADE ON DELETE NO ACTION,
FOREIGN KEY (returnID) REFERENCES Depot(depotID) ON UPDATE CASCADE ON DELETE NO ACTION,
FOREIGN KEY (regNum) REFERENCES Vehicle(regNum) ON UPDATE CASCADE ON DELETE NO ACTION, 
FOREIGN KEY (tariffID) REFERENCES DailyTariff(tariffID) ON UPDATE CASCADE ON DELETE NO ACTION,
FOREIGN KEY (insuranceID) REFERENCES Insurance(insuranceID) ON UPDATE CASCADE ON DELETE NO ACTION
);

CREATE TABLE VehicleTariff (
make					CHAR(8)	NOT NULL,  
model					CHAR(8)	NOT NULL,  
tariffID				CHAR(2)	NOT NULL,  
rentalPrice				DECIMAL(3,2), --per day
PRIMARY KEY (make, model, tariffID),
FOREIGN KEY (make, model) REFERENCES VehicleType(make, model) ON UPDATE CASCADE ON DELETE NO ACTION,
FOREIGN KEY (tariffID) REFERENCES DailyTariff(tariffID) ON UPDATE CASCADE ON DELETE NO ACTION
);

CREATE TABLE Insurance (
insuranceID				INT(5) NOT NULL, 
policyType				CHAR(16) CHECK (policyType IN ('Excess Reduction', 'Excess Removal', 'Full Cover')), 
cost					DECIMAL(3,2),
PRIMARY KEY (insuranceID)
);

CREATE TABLE Invoice (
invoiceID				INT(10)	NOT NULL,  
qualityCheck			CHAR(3) CHECK (qualityCheck IN ('Yes', 'No')),
datePaid				DATE,  
hireID					CHAR(10) NOT NULL, 
PRIMARY KEY (invoiceID),
FOREIGN KEY (hireID) REFERENCES HiredVehicle(hireID) ON UPDATE CASCADE ON DELETE NO ACTION
--Derived finalCost (HiredVehicle.days * VehicleTariff.rentalPrice) -- Generating this with a VIEW. See below the tables. 
);

CREATE TABLE Booking (
startDate				DATE NOT NULL, 
hireDays				INT(2), 
colour					CHAR(12),
clientID				CHAR(8) NOT NULL, 
depotID					INT(2) NOT NULL,  
make					CHAR(8)	NOT NULL,  
model					CHAR(8)	NOT NULL, 
PRIMARY KEY (startDate),
FOREIGN KEY (clientID) REFERENCES Client(clientID) ON UPDATE CASCADE ON DELETE NO ACTION, 
FOREIGN KEY (depotID) REFERENCES Depot(depotID) ON UPDATE CASCADE ON DELETE NO ACTION,
FOREIGN KEY (make, model) REFERENCES VehicleType(make, model) ON UPDATE CASCADE ON DELETE NO ACTION
);


CREATE TABLE ServiceHistory (
date					DATE NOT NULL, 
cost					DECIMAL(5,2), 
description				VARCHAR, 
regNum					CHAR(7)	NOT NULL,  
depotID					INT(2) NOT NULL,
PRIMARY KEY (date, regNum),
FOREIGN KEY (regNum) REFERENCES Vehicle(regNum) ON UPDATE CASCADE ON DELETE NO ACTION, 
FOREIGN KEY (depotID) REFERENCES Depot(depotID) ON UPDATE CASCADE ON DELETE NO ACTION
);


-- Creates a VIEW in order to see the derived finalCost of a car hire
CREATE VIEW InvoiceWithCost (invoiceID, make, model, dateHired, daysHired, dailyTariff, finalCost, datePaid)
AS
SELECT i.invoiceID, vt.make,  vt.model, hv.date AS 'dateHired', hv.days AS 'daysHired', t.rentalPrice AS 'dailyTariff', hv.days * t.rentalPrice AS finalCost, i.datePaid
FROM Invoice i, HiredVehicle hv, Vehicle v, VehicleType vt, VehicleTariff t, DailyTariff dt 
WHERE i.hireID = hv.hireID 
	AND hv.tariffID = dt.tariffID
	AND hv.regNum = v.regNum
	AND v.make = vt.make AND v.model = vt.model
	AND vt.model = t.model AND vt.make = t.make AND dt.tariffID = t.tariffID;









