
INSERT INTO Client VALUES ('AAAAAAAA', 'JOEL', 'PILLAR', 'SIR', 'LZ3148', '23 MadeUp Road', '5050');
INSERT INTO Client VALUES ('BBBBBBBB', 'ALEX', 'ROGERS', 'MS', 'R34S23', '21 Fake Street', '5030');
INSERT INTO Client VALUES ('CCCCCCCC', 'SARAH', 'MIDDLETON', 'MRS', 'X375TR', '114 Pirie Street', '5200');
INSERT INTO Client VALUES ('DDDDDDDD', 'ARABELLA', 'APIR', 'MISS', 'Z34399', '6 Jackie Tce', '5050');
INSERT INTO Client VALUES ('EEEEEEEE', 'ROSA', 'PARKS', 'MISS', 'T98S87', '6 Jackie Tce', '5050');
INSERT INTO Client VALUES ('FFFFFFFF', 'TEST', 'PERSON', 'MR', 'ZZZ987', '6 Try Tce', '4999');

INSERT INTO Depot VALUES (01, '11 Town St', '5000', '555-1234');
INSERT INTO Depot VALUES (02, '99 Jump St', '5001', '555-0001');
INSERT INTO Depot VALUES (03, '67 Turnip Ln', '5002', '555-4444');
INSERT INTO Depot VALUES (04, '101 Shipton Dr', '5003', '555-7777');

INSERT INTO VehicleType VALUES ('Ford', 'Falcon', 5, 'Sedan', 'Sport');
INSERT INTO VehicleType VALUES ('Holden', 'Commodore', 2, 'Hatch', 'Luxury');
INSERT INTO VehicleType VALUES ('Tesla', 'P90', 4, 'Coupe', 'Luxury');
INSERT INTO VehicleType VALUES ('Jeep', 'Wrangler', 2, 'Hatch', 'Sport');
INSERT INTO VehicleType VALUES ('Mitsubishi', 'Outlander', 6, 'SUV', 'Standard');

INSERT INTO DailyTariff VALUES ('T1', 'Basic');
INSERT INTO DailyTariff VALUES ('T2', 'Country driving');
INSERT INTO DailyTariff VALUES ('T3', 'People under 25');

INSERT INTO CompanyClient VALUES ('AAAAAAAA', 'JP Net');
INSERT INTO CompanyClient VALUES ('EEEEEEEE', 'WCH Enterprises');
INSERT INTO CompanyClient VALUES ('FFFFFFFF', 'BEST Co');

INSERT INTO ClientPhoneNo VALUES ('AAAAAAAA', '555-3690');
INSERT INTO ClientPhoneNo VALUES ('BBBBBBBB', '555-4999');
INSERT INTO ClientPhoneNo VALUES ('BBBBBBBB', '555-4989');
INSERT INTO ClientPhoneNo VALUES ('CCCCCCCC', '555-4345');
INSERT INTO ClientPhoneNo VALUES ('DDDDDDDD', '555-1369');
INSERT INTO ClientPhoneNo VALUES ('DDDDDDDD', '555-9631');
INSERT INTO ClientPhoneNo VALUES ('DDDDDDDD', '555-1245');
INSERT INTO ClientPhoneNo VALUES ('DDDDDDDD', '555-9988');
INSERT INTO ClientPhoneNo VALUES ('EEEEEEEE', '555-7766');

INSERT INTO DepotPhoneNo VALUES (01,'555-4320');
INSERT INTO DepotPhoneNo VALUES (01,'555-4322');
INSERT INTO DepotPhoneNo VALUES (02,'555-0022');
INSERT INTO DepotPhoneNo VALUES (03,'555-1122');
INSERT INTO DepotPhoneNo VALUES (04,'555-2223');
INSERT INTO DepotPhoneNo VALUES (04,'555-3344');

INSERT INTO Vehicle VALUES ('AAA 111', 111, 'BlueSteel', 'Ford', 'Falcon', 01, '2020-04-04', 120000, 01);
INSERT INTO Vehicle VALUES ('BBB 222', 112, 'Silver', 'Holden', 'Commodore', 02, '2021-03-19', 150000, 01);
INSERT INTO Vehicle VALUES ('CCC 333', 113, 'JetBlack', 'Holden', 'Commodore', 01, '2019-11-22', 35000, 02);
INSERT INTO Vehicle VALUES ('DDD 444', 114, 'Red', 'Tesla', 'P90', 03, '2021-04-07', 10000, 03);
INSERT INTO Vehicle VALUES ('EEE 555', 115, 'White', 'Tesla', 'P90', 03, '2020-01-30', 25000, 03);
INSERT INTO Vehicle VALUES ('FFF 666', 116, 'Black', 'Jeep', 'Wrangler', 03, '2019-10-03', 99000, 02);
INSERT INTO Vehicle VALUES ('GGG 777', 117, 'Grey', 'Mitsubishi', 'Outlander', 04, '2019-06-30', 26000, 04);

INSERT INTO Insurance VALUES (12345, 'Full Cover', 15.95);
INSERT INTO Insurance VALUES (12346, 'Excess Reduction', 13.50);
INSERT INTO Insurance VALUES (12347, 'Excess Removal', 12.95);

INSERT INTO HiredVehicle VALUES ('19--XXYYZZ', '2019-06-13', 'VI', '4992585470983098', 90000, 6, 'AAAAAAAA', 01, 01, 'AAA 111', 'T1', 12345, 'AAAAA-22222');
INSERT INTO HiredVehicle VALUES ('19--CCBBAA', '2016-02-29', 'MA', '4992585470986666', 70000, 13, 'BBBBBBBB', 02, 01, 'CCC 333', 'T2', 12347, 'BBBBB-33333');
INSERT INTO HiredVehicle VALUES ('18--SSRRTT', '2017-01-24', 'VI', '4234585470986666', 40000, 2, 'DDDDDDDD', 03, 01, 'FFF 666', 'T3', 12346, 'CCCCC-44444');
INSERT INTO HiredVehicle VALUES ('18--JJKKLL', '2018-09-06', 'VI', '4992558798086666', 110000, 4, 'EEEEEEEE', 04, 04, 'DDD 444', 'T1', 12347, 'DDDDD-55555');

INSERT INTO Drivers VALUES ('AAAAAAAA', '19--XXYYZZ');
INSERT INTO Drivers VALUES ('BBBBBBBB', '19--XXYYZZ');
INSERT INTO Drivers VALUES ('BBBBBBBB', '19--CCBBAA');
INSERT INTO Drivers VALUES ('CCCCCCCC', '18--SSRRTT');
INSERT INTO Drivers VALUES ('DDDDDDDD', '18--JJKKLL');
INSERT INTO Drivers VALUES ('EEEEEEEE', '18--JJKKLL');

INSERT INTO VehicleTariff VALUES ('Ford', 'Falcon', 'T1', 40.95);
INSERT INTO VehicleTariff VALUES ('Ford', 'Falcon', 'T2', 43.50);
INSERT INTO VehicleTariff VALUES ('Ford', 'Falcon', 'T3', 44.50);
INSERT INTO VehicleTariff VALUES ('Holden', 'Commodore', 'T1', 42.95);
INSERT INTO VehicleTariff VALUES ('Holden', 'Commodore', 'T2', 46.00);
INSERT INTO VehicleTariff VALUES ('Holden', 'Commodore', 'T3', 47.00);
INSERT INTO VehicleTariff VALUES ('Tesla', 'P90', 'T1', 50.95);
INSERT INTO VehicleTariff VALUES ('Tesla', 'P90', 'T2', 61.50);
INSERT INTO VehicleTariff VALUES ('Tesla', 'P90', 'T3', 65.95);
INSERT INTO VehicleTariff VALUES ('Jeep', 'Wrangler', 'T1', 35.50);
INSERT INTO VehicleTariff VALUES ('Jeep', 'Wrangler', 'T2', 40.95);
INSERT INTO VehicleTariff VALUES ('Jeep', 'Wrangler', 'T3', 42.00);
INSERT INTO VehicleTariff VALUES ('Mitsubishi', 'Outlander', 'T1', 30.50);
INSERT INTO VehicleTariff VALUES ('Mitsubishi', 'Outlander', 'T2', 35.95);
INSERT INTO VehicleTariff VALUES ('Mitsubishi', 'Outlander', 'T3', 36.35);

INSERT INTO Invoice VALUES (9876543210, 'Yes', NULL, '19--XXYYZZ');
INSERT INTO Invoice VALUES (9876543211, 'No', '2016-09-20', '19--CCBBAA');
INSERT INTO Invoice VALUES (9876543212, 'Yes', '2019-01-20', '18--SSRRTT');
INSERT INTO Invoice VALUES (9876543213, 'Yes', '2018-10-20', '18--JJKKLL');

INSERT INTO Booking VALUES ('2020-01-01', 7, 'Red', 'BBBBBBBB', 01, 'Holden', 'Commodore');
INSERT INTO Booking VALUES ('2022-01-01', 23, 'Blue', 'DDDDDDDD', 04, 'Jeep', 'Wrangler');

INSERT INTO ServiceHistory VALUES ('2001-03-03', 345.99, 'Fixed the carburetor and the thing that goes clunk', 'AAA 111', 01);
INSERT INTO ServiceHistory VALUES ('2002-03-03', 555.99, 'Sooped up the Hyperdrive', 'BBB 222', 02);
INSERT INTO ServiceHistory VALUES ('2003-03-03', 139.99, 'Switched out the flangey', 'CCC 333', 03);
INSERT INTO ServiceHistory VALUES ('2004-03-03', 939.99, 'Motivated the motivator', 'DDD 444', 04);
INSERT INTO ServiceHistory VALUES ('2005-03-03', 736.50, 'Windscreen wipers still dirty - DAVE', 'EEE 555', 03);






