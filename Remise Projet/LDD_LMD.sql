go
DROP DATABASE entite;
go
go
CREATE DATABASE entite;
go

USE entite;

DROP TABLE if exists Adoption;
DROP TABLE if exists EntiteMobile;
DROP TABLE if exists Client;
DROP TABLE if exists Climat;
DROP TABLE if exists Position;

-- Création des tables

CREATE TABLE Client (
	IdClient INT IDENTITY,
	Nom VARCHAR(50),
	TypeClient VARCHAR(50),
	CONSTRAINT pkclient PRIMARY KEY (IdClient),
    CONSTRAINT typeclient CHECK (TypeClient IN ('Corporation', 'Membre du public', 'Gouvernement'))
);

CREATE TABLE Climat (
    flight_nbr VARCHAR(10),
	request_datetime INT,
    humidity FLOAT(10),
    precip FLOAT(10),
	windgust FLOAT(10),
    windspeed FLOAT(10),
    winddir FLOAT(10), 
    cloudcover FLOAT(10),
    visibility FLOAT(10),
    CONSTRAINT pkclimat PRIMARY KEY (flight_nbr, request_datetime)
);

CREATE TABLE EntiteMobile (
	flight_nbr VARCHAR(10),
	flight_origin VARCHAR(10),
    flight_destin VARCHAR(10)
	CONSTRAINT pkentite PRIMARY KEY (flight_nbr)
);

CREATE TABLE Position (
    flight_nbr VARCHAR(10),
    flight_time INT,
    latitude FLOAT(30),	
    longitude FLOAT(30),
	CONSTRAINT pkposition PRIMARY KEY (flight_nbr, flight_time),
    FOREIGN KEY (flight_nbr, flight_time) REFERENCES Climat (flight_nbr, request_datetime) ON DELETE CASCADE    
);

CREATE TABLE Adoption (
	IdClient INT,
	FOREIGN KEY (IdClient) REFERENCES Client (IdClient) ON DELETE CASCADE,
	flight_nbr VARCHAR(10),
    FOREIGN KEY (flight_nbr) REFERENCES EntiteMobile (flight_nbr) ON DELETE CASCADE,
	CONSTRAINT pkadoption PRIMARY KEY (IdClient, flight_nbr)
);

-- Insertion des données

INSERT INTO climat (flight_nbr, request_datetime, humidity, precip, windgust, windspeed, winddir, cloudcover, visibility) VALUES
('AC61', 1679358871, 72.71, 0.0, 67.7, 48.2, 233.9, 100.0, 24.1),
('AC859', 1679358872, 74.6, 0.0, NULL, 5.4, 340.0, 52.0, NULL),
('AC43', 1679358875, 84.19, 0.0, 7.9, 5.4, 82.2, 10.6, NULL),
('AC9', 1679358873, 46.6, 0.0, NULL, 22.7, 178.7, 62.4, 16.0),
('AC776', 1679358874, 84.6, 0.0, NULL, 9.4, 270.0, 70.0, NULL),
('AC63', 1679358871, 94.99, 0.8, 24.8, 23.4, 40.2, 100.0, 0.2),
('AC51', 1679358873, 95.71, 0.0, 15.1, 6.5, 20.6, 100.0, NULL),
('AC307', 1679358874, 87.8, 0.0, NULL, 7.2, 120.0, 91.0, NULL),
('AC1330', 1679358874, 61.1, 0.0, NULL, 6.8, 215.0, 75.0, NULL),
('AC585', 1679358874, 97.4, 0.0, NULL, 18.4, 89.0, 0.0, 16.0),
('AC1039', 1679358873, 18.7, 0.0, NULL, 22.4, 108.0, 1.3, 16.0),
('AC998', 1679358871, 44.9, 0.0, 40.7, 19.4, 262.0, 88.0, 16.0),
('AC116', 1679358842, 44.4, 0.0, 27.7, 20.5, 240.0, 88.0, 24.0),
('AC357', 1679358874, 42.2, 0.0, NULL, 8.6, 80.0, 0.0, 15.6),
('AC119', 1679358874, 23.1, 0.0, NULL, 10.1, 60.0, 88.0, 40.0),
('AC1320', 1679358874, 30.7, 0.0, NULL, 5.4, 190.0, 0.0, 16.0),
('AC765', 1679358872, 68.0, 0.0, NULL, 17.2, 30.0, 0.0, 16.0),
('AC1049', 1679358872, 78.9, 0.0, NULL, 5.4, 200.0, 36.1, 16.0),
('AC957', 1679358873, 70.53, 0.0, 15.8, 15.5, 59.6, 98.8, 24.1),
('AC791', 1679358874, 63.3, 0.0, NULL, 13.0, 240.0, 100.0, 16.0),
('AC959', 1679358874, 78.66, 0.0, 40.7, 35.3, 20.0, 88.0, 16.3),
('AC990', 1679358872, 28.2, 0.0, 27.7, 13.3, 206.0, 11.4, 16.0),
('AC3', 1679358872, 90.0, 0.0, NULL, 22.3, 213.3, 100.0, 5.3),
('AC1205', 1679358871, 47.3, 0.0, 27.7, 18.2, 249.0, 100.0, 14.0),
('AC1301', 1679358874, 84.9, 0.0, NULL, 9.4, 50.0, 100.0, 9.2),
('AC118', 1679358874, 67.2, 0.0, 29.5, 20.5, 320.0, 17.0, NULL),
('AC741', 1679358872, 52.8, 0.0, NULL, 9.6, 13.0, 33.0, 16.0),
('AC138', 1679358872, 63.9, 0.0, NULL, 5.4, 93.0, 100.0, 24.0),
('AC987', 1679358872, 27.4, 0.0, 38.9, 19.6, 192.0, 0.0, 16.0),
('AC694', 1679358872, 69.49, 0.0, 92.9, 71.3, 279.1, 5.0, 24.1),
('AC425', 1679358874, 59.9, 0.0, 40.7, 11.5, 221.0, 100.0, 14.0),
('AC418', 1679358872, 61.1, 0.0, NULL, 7.0, 219.0, 75.0, NULL),
('AC80', 1679358875, 87.64, 0.1, 73.1, 67.3, 248.7, 100.0, 1.0),
('AC121', 1679358871, 80.4, 0.0, 38.9, 24.7, 135.0, 100.0, 14.0),
('AC57', 1679358867, 98.57, 0.0, 17.6, 7.6, 12.2, 96.0, NULL),
('AC599', 1679358874, 81.8, 0.0, NULL, 11.2, 180.0, 88.9, 16.0),
('AC125', 1679358874, 93.4, 0.0, NULL, 21.9, 100.0, 0.0, 16.0),
('AC8815', 1679358868, 42.7, 0.0, 41.1, 25.0, 183.0, 0.0, 16.0),
('AC345', 1679358872, 66.6, 0.0, NULL, 19.1, 66.0, 88.0, 24.0),
('AC323', 1679358872, 43.7, 0.0, NULL, 8.6, 80.0, 0.0, 16.0),
('AC1088', 1679358873, 44.3, 0.0, NULL, 21.1, 41.0, 12.1, 16.0),
('AC1237', 1679358874, 54.5, 0.0, NULL, 18.1, 226.0, 15.8, 16.0),
('AC781', 1679358872, 58.7, 0.0, NULL, 8.2, 315.0, 38.7, 14.6),
('AC971', 1679358871, 30.8, 0.0, NULL, 36.0, 8.0, 37.9, 16.0),
('AC120', 1679358874, 74.8, 0.0, NULL, 14.5, 90.0, 54.1, 16.0),
('AC527', 1679358873, 84.6, 0.216, NULL, 12.0, 9.0, 90.1, 10.2),
('AC549', 1679358871, 58.4, 0.0, NULL, 11.7, 55.0, 73.6, 16.0),
('AC555', 1679358873, 73.3, 0.0, NULL, 14.8, 240.0, 100.0, 16.0),
('AC337', 1679358873, 60.9, 0.0, NULL, 13.2, 224.0, 88.0, 24.0),
('AC543', 1679358873, 74.2, 0.0, NULL, 18.4, 30.0, 100.0, 16.0),
('AC61', 1679361899, 51.19, 0.0, 40.7, 36.0, 253.9, 87.2, 24.1),
('AC859', 1679361905, 37.6, 0.0, NULL, 8.8, 235.0, 90.0, NULL),
('AC43', 1679361903, 76.2, 0.0, NULL, 7.5, 223.0, 100.0, 9.9),
('AC9', 1679361905, 87.3, 0.1, 23.0, 10.4, 150.3, 90.4, 1.4),
('AC776', 1679361905, 64.7, 0.0, NULL, 5.7, 8.0, 71.0, NULL),
('AC63', 1679361899, 72.5, 0.0, 69.1, 57.6, 278.0, 27.6, 24.1),
('AC51', 1679361899, 79.12, 0.0, 15.5, 9.7, 298.5, 82.4, NULL),
('AC585', 1679361905, 81.9, 0.0, NULL, 9.4, 90.0, 95.0, NULL),
('AC998', 1679361892, 64.8, 0.0, NULL, 5.9, 357.0, 71.0, NULL),
('AC119', 1679361906, 81.3, 0.0, NULL, 2.7, 255.0, 93.0, NULL),
('AC1320', 1679361897, 41.5, 0.0, NULL, 16.5, 220.0, 88.0, 24.0),
('AC765', 1679361903, 41.8, 0.0, NULL, 6.4, 338.0, 95.1, 16.0),
('AC957', 1679361904, 91.76, 0.0, 13.3, 5.0, 80.6, 100.0, 24.1),
('AC791', 1679361906, 28.4, 0.0, 37.1, 21.8, 223.0, 26.2, 16.0),
('AC959', 1679361905, 72.7, 0.0, 17.3, 16.6, 64.5, 6.7, 24.1),
('AC990', 1679361904, 40.4, 0.0, NULL, 16.2, 221.0, 88.0, 24.0),
('AC3', 1679361905, 61.72, 0.0, 66.6, 51.8, 253.4, 100.0, 24.1),
('AC1301', 1679361904, 52.7, 0.0, NULL, 10.8, 316.0, 100.0, 16.0),
('AC118', 1679361905, 37.2, 0.0, NULL, 6.4, 235.0, 95.0, NULL),
('AC741', 1679361904, 80.8, 0.0, NULL, 22.3, 170.0, 0.0, 16.0),
('AC987', 1679361904, 80.89, 0.0, 40.7, 25.9, 100.0, 84.0, 16.3),
('AC80', 1679361907, 73.36, 0.0, 64.8, 52.6, 244.4, 7.2, 23.2),
('AC121', 1679361905, 70.3, 0.0, NULL, 9.9, 105.0, 21.0, NULL),
('AC57', 1679361904, 90.31, 0.0, 18.4, 5.8, 187.6, 0.0, NULL),
('AC125', 1679361905, 85.7, 0.0, NULL, 13.2, 127.0, 42.0, NULL),
('AC8815', 1679361905, 30.8, 0.0, 44.6, 18.2, 191.0, 100.0, 15.4),
('AC345', 1679361905, 81.1, 0.0, NULL, 9.9, 333.0, 42.0, NULL),
('AC781', 1679361905, 70.2, 0.0, NULL, 10.8, 18.0, 0.0, 16.0),
('AC971', 1679361906, 64.8, 0.0, NULL, 11.9, 144.0, 45.1, 16.0),
('AC120', 1679361905, 73.0, 0.0, NULL, 10.1, 40.0, 65.9, 16.0),
('AC527', 1679361905, 59.0, 0.0, NULL, 12.7, 298.0, 0.0, 16.0),
('AC549', 1679361905, 55.9, 0.0, NULL, 11.6, 49.0, 0.0, 16.0),
('AC337', 1679361904, 67.1, 0.0, NULL, 10.3, 325.0, 88.0, 24.0),
('AC543', 1679361906, 64.5, 0.0, NULL, 5.6, 325.0, 0.0, 16.0),
('AC429', 1679361905, 64.8, 0.0, NULL, 5.7, 7.0, 71.0, NULL),
('AC357', 1679361903, 40.7, 0.0, NULL, 3.6, 185.0, 0.0, 16.0),
('AC323', 1679361904, 40.7, 0.0, NULL, 3.6, 185.0, 0.0, 16.0),
('AC61', 1679364791, 88.44, 0.1, 48.2, 46.8, 355.8, 81.7, 6.3),
('AC43', 1679364798, 93.4, 0.3, NULL, 7.6, 270.0, 50.0, 10.0),
('AC9', 1679364795, 69.42, 0.1, 64.1, 46.8, 252.9, 100.0, 18.4),
('AC776', 1679364795, 66.8, 0.0, NULL, 7.1, 213.0, 60.0, NULL),
('AC63', 1679364799, 72.12, 0.0, 36.4, 32.4, 299.5, 6.3, 24.1),
('AC51', 1679364797, 100.0, 0.0, NULL, 3.6, 101.5, 84.5, 6.0),
('AC585', 1679364798, 47.3, 0.0, NULL, 7.6, 190.0, 25.0, 24.0),
('AC765', 1679364797, 68.4, 0.0, NULL, 9.4, 244.0, 48.4, 16.0),
('AC791', 1679364798, 78.9, 0.0, NULL, 12.5, 202.0, 84.8, 16.0),
('AC959', 1679364797, 90.07, 0.0, 20.2, 5.4, 78.3, 59.1, 24.1),
('AC3', 1679364799, 64.46, 0.0, 11.5, 11.9, 36.5, 100.0, 24.1),
('AC741', 1679364795, 36.6, 0.0, NULL, 14.2, 320.0, 68.8, 16.0),
('AC987', 1679364797, 84.0, 0.0, NULL, 7.6, 70.0, 95.0, NULL),
('AC80', 1679364799, 81.61, 0.2, 74.5, 43.9, 250.4, 100.0, 20.7),
('AC121', 1679364797, 78.8, 0.0, NULL, 4.7, 279.0, 100.0, 14.8),
('AC57', 1679364797, 91.37, 0.0, 9.7, 5.4, 92.3, 85.3, NULL),
('AC125', 1679364797, 65.4, 0.0, NULL, 3.9, 331.0, 100.0, 18.3),
('AC8815', 1679364798, 46.5, 0.0, 40.7, 24.8, 150.0, 100.0, 16.0),
('AC345', 1679364797, 48.5, 0.0, NULL, 1.4, 321.0, 26.0, 15.9),
('AC781', 1679364798, 79.0, 0.0, NULL, 13.6, 62.0, 32.3, 16.0),
('AC971', 1679364795, 54.1, 0.0, NULL, 18.4, 290.0, 77.0, NULL),
('AC120', 1679364797, 90.8, 0.3, NULL, 3.4, 276.0, 100.0, 24.0),
('AC527', 1679364798, 83.6, 0.0, NULL, 14.8, 30.0, 0.0, 16.0),
('AC549', 1679364796, 92.3, 0.0, NULL, 22.3, 100.0, 0.3, 16.0),
('AC337', 1679364797, 42.6, 0.0, NULL, 7.6, 10.0, 0.0, 14.0),
('AC543', 1679364797, 92.4, 0.0, NULL, 21.8, 103.0, 58.3, 16.0),
('AC357', 1679364795, 47.3, 0.0, NULL, 7.6, 190.0, 25.0, 24.0),
('AC323', 1679364789, 47.3, 0.0, NULL, 7.6, 190.0, 25.0, 24.0),
('AC694', 1679364798, 73.9, 0.0, 83.5, 57.5, 280.0, 100.0, 24.0),
('AC61', 1679365091, 79.21, 0.0, 60.1, 52.6, 339.6, 84.8, 13.0),
('AC43', 1679365087, 93.4, 0.1, NULL, 7.6, 270.0, 50.0, 10.0),
('AC9', 1679365091, 65.41, 0.1, 64.8, 52.2, 256.9, 100.0, 17.5),
('AC776', 1679365086, 66.8, 0.0, NULL, 7.1, 213.0, 60.0, NULL),
('AC63', 1679365087, 74.83, 0.0, 32.8, 28.8, 300.2, 68.4, 24.1),
('AC51', 1679365089, 93.8, 0.0, NULL, 3.6, 50.0, 100.0, 5.5),
('AC585', 1679365073, 47.3, 0.0, NULL, 7.6, 190.0, 25.0, 24.0),
('AC765', 1679365088, 80.7, 0.0, NULL, 14.8, 180.0, 0.0, 16.0),
('AC791', 1679365087, 79.4, 0.0, NULL, 12.8, 201.0, 86.4, 16.0),
('AC959', 1679365089, 90.1, 0.0, 9.4, 4.3, 103.6, 100.0, 24.1),
('AC3', 1679365087, 82.52, 0.2, 25.9, 24.8, 37.1, 100.0, 6.6),
('AC741', 1679365089, 62.4, 0.0, NULL, 13.5, 286.0, 95.9, 16.0),
('AC987', 1679365088, 84.2, 0.0, NULL, 5.2, 116.0, 93.0, NULL),
('AC80', 1679365091, 85.14, 0.7, 71.3, 42.1, 246.4, 100.0, 14.7),
('AC121', 1679365090, 85.0, 0.0, NULL, 4.1, 283.0, 100.0, 16.0),
('AC57', 1679365087, 93.7, 0.0, NULL, 3.6, 50.0, 99.3, 5.5),
('AC125', 1679365090, 68.4, 0.0, NULL, 7.3, 326.0, 100.0, 14.0),
('AC8815', 1679365087, 48.2, 0.0, 32.3, 18.3, 150.0, 100.0, 16.0),
('AC345', 1679365090, 54.8, 0.0, NULL, 3.0, 318.0, 64.9, 20.1),
('AC781', 1679365090, 67.5, 0.0, NULL, 18.0, 76.0, 74.7, 16.0),
('AC971', 1679365088, 54.1, 0.0, NULL, 18.4, 290.0, 79.0, NULL),
('AC120', 1679365089, 63.4, 0.0, NULL, 0.4, 10.0, 100.0, 24.0),
('AC527', 1679365090, 80.5, 0.0, NULL, 14.5, 31.0, 0.0, 16.0),
('AC549', 1679365088, 91.7, 0.0, NULL, 22.8, 116.0, 79.6, 16.0),
('AC337', 1679365088, 42.6, 0.0, NULL, 7.6, 10.0, 0.0, 14.0),
('AC543', 1679365088, 87.0, 0.0, NULL, 20.6, 111.0, 70.8, 16.0),
('AC357', 1679365086, 47.3, 0.0, NULL, 7.6, 190.0, 25.0, 24.0),
('AC323', 1679365089, 47.3, 0.0, NULL, 7.6, 190.0, 25.0, 24.0),
('AC694', 1679365088, 73.9, 0.0, 83.5, 57.5, 280.0, 100.0, 24.0),
('AC61', 1679367047, 67.78, 0.0, 65.9, 56.9, 277.9, 62.0, 24.1),
('AC43', 1679367043, 91.47, 0.0, 14.8, 7.2, 214.0, 100.0, 24.1),
('AC9', 1679367039, 52.75, 0.0, 28.1, 23.4, 262.9, 100.0, 24.1),
('AC63', 1679367043, 69.39, 0.0, 1.8, 2.2, 335.3, 100.0, 24.1),
('AC51', 1679367045, 90.0, 0.0, NULL, 4.8, 51.0, 48.5, 7.1),
('AC765', 1679367043, 10.9, 0.0, NULL, 14.8, 320.0, 0.0, 16.0),
('AC3', 1679367043, 71.31, 0.0, 48.6, 45.7, 325.2, 100.0, 24.1),
('AC741', 1679367045, 60.8, 0.0, NULL, 14.5, 304.0, 75.9, 15.8),
('AC987', 1679367046, 85.9, 0.0, NULL, 6.6, 153.0, 36.0, NULL),
('AC80', 1679367045, 82.87, 0.0, 56.2, 39.6, 254.4, 63.7, 24.1),
('AC57', 1679367045, 87.1, 0.0, NULL, 9.4, 100.0, 4.9, 9.0),
('AC345', 1679367044, 90.8, 0.0, NULL, 0.8, 345.0, 89.0, NULL),
('AC781', 1679367043, 61.0, 0.0, NULL, 17.9, 226.0, 92.4, 16.0),
('AC971', 1679367045, 83.0, 0.585, NULL, 2.8, 320.0, 100.0, 12.5),
('AC527', 1679367045, 49.7, 0.0, NULL, 15.6, 89.0, 13.3, 16.0),
('AC549', 1679367046, 87.4, 0.0, NULL, 6.7, 74.0, 100.0, 12.5),
('AC337', 1679367046, 77.5, 0.0, NULL, 0.0, 0.0, 37.0, NULL),
('AC543', 1679367044, 86.2, 0.0, NULL, 6.4, 79.0, 100.0, 15.7),
('AC357', 1679367043, 47.3, 0.0, NULL, 7.6, 190.0, 25.0, 24.0),
('AC323', 1679367042, 47.3, 0.0, NULL, 7.6, 190.0, 25.0, 24.0),
('AC694', 1679367045, 73.9, 0.1, 81.6, 64.7, 280.0, 100.0, 24.0);

INSERT INTO EntiteMobile (flight_nbr, flight_origin, flight_destin) VALUES
('AC61', 'YYZ', 'ICN'),
('AC859', 'LHR', 'YYZ'),
('AC43', 'DEL', 'YYZ'),
('AC9', 'YYZ', 'NRT'),
('AC776', 'LAX', 'YUL'),
('AC63', 'YVR', 'ICN'),
('AC51', 'DEL', 'YUL'),
('AC307', 'YUL', 'YVR'),
('AC1330', 'LIR', 'YUL'),
('AC585', 'EWR', 'YYC'),
('AC1039', 'YYZ', 'DEN'),
('AC998', 'PVR', 'YUL'),
('AC116', 'YVR', 'YYZ'),
('AC357', 'YOW', 'YYC'),
('AC119', 'YYZ', 'YVR'),
('AC1320', 'LIR', 'YYZ'),
('AC765', 'YUL', 'SFO'),
('AC1049', 'ORD', 'YVR'),
('AC957', 'YYZ', 'SJO'),
('AC791', 'YYZ', 'LAX'),
('AC959', 'YUL', 'SJO'),
('AC990', 'MEX', 'YYZ'),
('AC3', 'YVR', 'NRT'),
('AC1205', 'MIA', 'YYZ'),
('AC1301', 'IAH', 'YVR'),
('AC118', 'YVR', 'YYZ'),
('AC741', 'YYZ', 'SFO'),
('AC138', 'YYC', 'YYZ'),
('AC987', 'CUN', 'YYC'),
('AC694', 'YYZ', 'YYT'),
('AC425', 'YUL', 'YYZ'),
('AC418', 'YUL', 'N/A'),
('AC80', 'YYZ', 'TLV'),
('AC121', 'YYZ', 'YVR'),
('AC57', 'DXB', 'YYZ'),
('AC599', 'SNA', 'YVR'),
('AC125', 'YYZ', 'YVR'),
('AC8815', 'YUL', 'DFW'),
('AC345', 'YOW', 'YVR'),
('AC323', 'YYC', 'N/A'),
('AC1088', 'YYZ', 'MCO'),
('AC1237', 'PBI', 'YYZ'),
('AC781', 'YUL', 'LAX'),
('AC971', 'PVR', 'YVR'),
('AC120', 'YVR', 'YYZ'),
('AC527', 'YUL', 'SAN'),
('AC549', 'EWR', 'YVR'),
('AC555', 'LAX', 'YVR'),
('AC337', 'YUL', 'YEG'),
('AC543', 'YYZ', 'SEA');

INSERT INTO Position(flight_nbr, flight_time, latitude, longitude) VALUES
('AC61', 1679358871, 59.3577, -168.3198),
('AC859', 1679358872, 47.8682, -74.1997),
('AC43', 1679358875, 42.5685, 30.3843),
('AC9', 1679358873, 61.4038, -146.6723),
('AC776', 1679358874, 45.5213, -80.6049),
('AC63', 1679358871, 55.1961, 174.9985),
('AC51', 1679358873, 41.4603, 43.2489),
('AC307', 1679358874, 49.1962, -123.1839),
('AC1330', 1679358874, 45.4638, -73.7374),
('AC585', 1679358874, 46.1101, -100.3382),
('AC1039', 1679358873, 40.3077, -103.2716),
('AC998', 1679358871, 43.5323, -77.93),
('AC116', 1679358842, 43.681, -79.6177),
('AC357', 1679358874, 50.9837, -113.9366),
('AC119', 1679358874, 49.9048, -116.3692),
('AC1320', 1679358874, 39.6434, -79.9268),
('AC765', 1679358872, 42.4503, -97.5487),
('AC1049', 1679358872, 48.4103, -121.3914),
('AC957', 1679358873, 17.6312, -82.9676),
('AC791', 1679358874, 38.7456, -109.3794),
('AC959', 1679358874, 23.8357, -80.9476),
('AC990', 1679358872, 39.6667, -84.4909),
('AC3', 1679358872, 58.6277, -160.0966),
('AC1205', 1679358871, 43.7737, -79.2853),
('AC1301', 1679358874, 45.5313, -111.0539),
('AC118', 1679358874, 47.3047, -86.2993),
('AC741', 1679358872, 41.0984, -105.7413),
('AC138', 1679358872, 44.5524, -80.675),
('AC987', 1679358872, 40.2884, -96.2683),
('AC694', 1679358872, 47.0018, -58.1971),
('AC425', 1679358874, 43.99, -78.8826),
('AC418', 1679358872, 45.4588, -73.7474),
('AC80', 1679358875, 49.5528, -46.2353),
('AC121', 1679358871, 49.7677, -103.3906),
('AC57', 1679358867, 38.5892, 41.9403),
('AC599', 1679358874, 48.5322, -122.4564),
('AC125', 1679358874, 48.433, -102.2487),
('AC8815', 1679358868, 39.8475, -88.5414),
('AC345', 1679358872, 49.8848, -99.6748),
('AC323', 1679358872, 51.1291, -114.0092),
('AC1088', 1679358873, 28.4971, -81.1867),
('AC1237', 1679358874, 42.6833, -78.7032),
('AC781', 1679358872, 44.8037, -84.3752),
('AC971', 1679358871, 32.7079, -111.2493),
('AC120', 1679358874, 49.0576, -100.5069),
('AC527', 1679358873, 44.8682, -83.7747),
('AC549', 1679358871, 44.3204, -87.6846),
('AC555', 1679358873, 45.18, -121.9412),
('AC337', 1679358873, 45.7838, -75.1802),
('AC543', 1679358873, 45.9871, -88.1534),
('AC61', 1679361899, 56.9076, -179.4053),
('AC859', 1679361905, 43.8046, -79.4084),
('AC43', 1679361903, 46.6942, 23.5131),
('AC9', 1679361905, 60.6049, -160.115),
('AC776', 1679361905, 45.4632, -73.7483),
('AC63', 1679361899, 48.2435, 172.1725),
('AC51', 1679361899, 42.1871, 34.6795),
('AC585', 1679361905, 48.7704, -108.015),
('AC998', 1679361892, 45.4568, -73.7545),
('AC119', 1679361906, 49.1972, -123.1864),
('AC1320', 1679361897, 43.676, -79.615),
('AC765', 1679361903, 40.8624, -104.8976),
('AC957', 1679361904, 11.0718, -84.3409),
('AC791', 1679361906, 35.7211, -114.7874),
('AC959', 1679361905, 17.7193, -82.948),
('AC990', 1679361904, 43.7141, -79.5407),
('AC3', 1679361905, 57.5506, -172.0005),
('AC1301', 1679361904, 48.0104, -119.641),
('AC118', 1679361905, 43.7642, -79.4676),
('AC741', 1679361904, 39.4918, -112.7103),
('AC987', 1679361904, 44.884, -101.4599),
('AC80', 1679361907, 51.4316, -34.2295),
('AC121', 1679361905, 49.9356, -113.1794),
('AC57', 1679361904, 41.4381, 34.1997),
('AC125', 1679361905, 49.5472, -111.6914),
('AC8815', 1679361905, 36.3134, -93.5627),
('AC345', 1679361905, 50.0112, -109.6492),
('AC781', 1679361905, 43.7374, -92.2463),
('AC971', 1679361906, 37.8603, -113.4693),
('AC120', 1679361905, 47.0415, -90.1679),
('AC527', 1679361905, 43.8519, -91.3151),
('AC549', 1679361905, 45.5064, -95.2771),
('AC337', 1679361904, 48.4605, -82.3496),
('AC543', 1679361906, 46.7839, -95.6597),
('AC357', 1679361903, 51.1312, -114.0124),
('AC323', 1679361904, 51.1291, -114.0092),
('AC61', 1679364791, 53.5328, 172.3979),
('AC43', 1679364798, 50.6421, 17.007),
('AC9', 1679364795, 58.6607, -171.7659),
('AC776', 1679364795, 45.457, -73.7539),
('AC63', 1679364799, 45.5141, 165.2599),
('AC51', 1679364797, 44.652, 27.095),
('AC585', 1679364798, 51.1316, -113.9956),
('AC765', 1679364797, 39.5467, -111.5503),
('AC791', 1679364798, 33.9394, -118.4182),
('AC959', 1679364797, 11.4222, -84.2695),
('AC3', 1679364799, 55.7012, 177.8218),
('AC741', 1679364795, 38.0013, -118.5962),
('AC987', 1679364797, 48.626, -107.6466),
('AC80', 1679364799, 52.1875, -22.3172),
('AC121', 1679364797, 49.5052, -122.0881),
('AC57', 1679364797, 44.2597, 27.1938),
('AC125', 1679364797, 49.6805, -120.6603),
('AC8815', 1679364798, 33.097, -97.025),
('AC345', 1679364797, 49.7473, -119.2354),
('AC781', 1679364798, 42.3354, -99.4862),
('AC971', 1679364795, 42.6911, -117.2548),
('AC120', 1679364797, 45.1641, -81.4685),
('AC527', 1679364798, 42.447, -98.221),
('AC549', 1679364796, 46.8169, -102.8484),
('AC337', 1679364797, 50.9919, -89.9752),
('AC543', 1679364797, 47.205, -103.2689),
('AC357', 1679364795, 51.1312, -114.0124),
('AC323', 1679364789, 51.1291, -114.0092),
('AC694', 1679364798, 47.6139, -52.7432),
('AC61', 1679365091, 53.2824, 171.4471),
('AC43', 1679365087, 50.9981, 16.2589),
('AC9', 1679365091, 58.4247, -172.882),
('AC776', 1679365086, 45.457, -73.7539),
('AC63', 1679365087, 45.2776, 164.5253),
('AC51', 1679365089, 45.0525, 26.461),
('AC585', 1679365073, 51.1305, -113.9983),
('AC765', 1679365088, 39.3824, -112.1967),
('AC791', 1679365087, 33.9401, -118.4019),
('AC959', 1679365089, 10.8372, -84.3968),
('AC3', 1679365087, 55.4803, 176.8597),
('AC741', 1679365089, 37.9174, -119.1166),
('AC987', 1679365088, 48.9106, -108.3781),
('AC80', 1679365091, 52.0611, -21.156),
('AC121', 1679365090, 49.2855, -122.5471),
('AC57', 1679365087, 44.7551, 26.6908),
('AC125', 1679365090, 49.5981, -121.3663),
('AC8815', 1679365087, 32.9224, -97.026),
('AC345', 1679365090, 49.6822, -120.1449),
('AC781', 1679365090, 42.2058, -100.2203),
('AC971', 1679365088, 43.1833, -117.6818),
('AC120', 1679365089, 44.7182, -80.8882),
('AC527', 1679365090, 42.2808, -98.8977),
('AC549', 1679365088, 46.937, -103.6417),
('AC337', 1679365088, 51.1579, -90.812),
('AC543', 1679365088, 47.2615, -104.0633),
('AC357', 1679365086, 51.1312, -114.0124),
('AC323', 1679365089, 51.1291, -114.0092),
('AC694', 1679365088, 47.6139, -52.7432),
('AC61', 1679367047, 47.9111, 171.7039),
('AC43', 1679367043, 53.118, 11.1304),
('AC9', 1679367039, 56.7859, -179.7492),
('AC63', 1679367043, 44.284, 159.2525),
('AC51', 1679367045, 47.6021, 22.0438),
('AC765', 1679367043, 38.3814, -116.3514),
('AC3', 1679367043, 53.7846, 170.6247),
('AC741', 1679367045, 37.5965, -122.3161),
('AC987', 1679367046, 50.6729, -113.3007),
('AC80', 1679367045, 51.6838, -13.4496),
('AC57', 1679367045, 47.1455, 22.0868),
('AC345', 1679367044, 49.1958, -123.1823),
('AC781', 1679367043, 41.2096, -104.9044),
('AC971', 1679367045, 46.5374, -120.7994),
('AC527', 1679367045, 40.9627, -103.2731),
('AC549', 1679367046, 47.6078, -109.1412),
('AC337', 1679367046, 52.0972, -96.6116),
('AC543', 1679367044, 47.4989, -109.4957),
('AC357', 1679367043, 51.1312, -114.0124),
('AC323', 1679367042, 51.1291, -114.0092),
('AC694', 1679367045, 47.6139, -52.7432);

INSERT INTO Client(Nom, TypeClient) VALUES
('Air Canada', 'Corporation'),
('Transport Canada', 'Gouvernement'),
('Jeanne Tremblay', 'Membre du public'),
('Federal Aviation Administration', 'Gouvernement'),
('Charles Prentiss', 'Membre du public');

INSERT INTO Adoption(flight_nbr, IdClient) VALUES
('AC61', 2),
('AC859', 2),
('AC43', 2),
('AC9', 2),
('AC776', 2),
('AC63', 2),
('AC51', 2),
('AC307', 2),
('AC1330', 2),
('AC585', 2),
('AC1039', 2),
('AC998', 2),
('AC116', 2),
('AC357', 2),
('AC119', 2),
('AC1320', 2),
('AC765', 2),
('AC1049', 2),
('AC957', 2),
('AC791', 2),
('AC959', 2),
('AC990', 2),
('AC3', 2),
('AC1205', 2),
('AC1301', 2),
('AC118', 2),
('AC741', 2),
('AC138', 2),
('AC987', 2),
('AC694', 2),
('AC425', 2),
('AC418', 2),
('AC80', 2),
('AC121', 2),
('AC57', 2),
('AC599', 2),
('AC125', 2),
('AC8815', 2),
('AC345', 2),
('AC323', 2),
('AC1088', 2),
('AC1237', 2),
('AC781', 2),
('AC971', 2),
('AC120', 2),
('AC527', 2),
('AC549', 2),
('AC555', 2),
('AC337', 2),
('AC543', 2),
('AC307', 3),
('AC1330', 3),
('AC585', 3),
('AC1039', 3),
('AC998', 3),
('AC307', 1),
('AC1330', 1),
('AC585', 1),
('AC1039', 1),
('AC998', 1),
('AC345', 5),
('AC323', 5);
