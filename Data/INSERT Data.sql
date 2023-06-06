-- AutoLeasing --

use AutoleasingDB;
go

-- ******************************************************************
-- * Fahrzeug Tabelle befuellen.                             
-- ******************************************************************
INSERT INTO Fahrzeug (Marke, Modell, Baujahr, Preis) VALUES
('Audi', 'R8', 2021, 190000),
('Mercedes-Benz', 'S 63 AMG', 2022, 230000),
('BMW', 'M8', 2021, 180000),
('Lamborghini', 'Aventador', 2022, 390000),
('Porsche', '911 Turbo S', 2021, 220000),
('Bentley', 'Continental GT', 2022, 250000),
('Rolls-Royce', 'Ghost', 2021, 340000),
('Ferrari', '488 Pista', 2022, 320000),
('McLaren', '720S', 2021, 280000),
('Bugatti', 'Chiron', 2022, 4000000),
('Tesla', 'Model S', 2022, 80000),
('Jaguar', 'F-Type', 2021, 90000),
('Land Rover', 'Range Rover Sport', 2022, 95000),
('Chevrolet', 'Camaro', 2021, 50000),
('Ford', 'Mustang', 2022, 55000),
('Volkswagen', 'Golf GTI', 2021, 40000),
('Toyota', 'Supra', 2022, 60000),
('Nissan', 'GT-R', 2021, 70000),
('Maserati', 'GranTurismo', 2022, 180000),
('Aston Martin', 'DB11', 2021, 240000);

-- ******************************************************************
-- * Kunde Tabelle befuellen.                             
-- ******************************************************************
INSERT INTO Kunde (Vorname, Nachname, Adresse, Geburtsdatum) VALUES
('Laura', 'Wagner', 'Bundesplatz 15, 6003 Luzern', '1992-09-21'),
('Philipp', 'Schneider', 'Hirschengraben 22, 3011 Bern', '1987-04-03'),
('Anna', 'Weber', 'Aarauerstrasse 20, 5000 Aarau', '1991-07-29'),
('Nina', 'Müller', 'Kasernenstrasse 29, 4058 Basel', '1994-12-12'),
('Simon', 'Moser', 'Neugasse 16, 9000 St. Gallen', '1989-01-18'),
('Laura', 'Hofmann', 'Im Schilfli 8, 2502 Biel/Bienne', '1995-01-22'),
('Markus', 'Meier', 'Bürkliplatz 16, 8001 Zürich', '1986-07-14'),
('Anna', 'Suter', 'Wiesenstrasse 14, 8953 Dietikon', '1993-04-05'),
('Simon', 'Kaufmann', 'Bösch 47, 6331 Hünenberg', '1989-11-18'),
('David', 'Bachmann', 'Lindenstrasse 10, 6340 Baar', '1994-09-02'),
('Melanie', 'Keller', 'Schützenstrasse 5, 6005 Luzern', '1988-05-11'),
('Julian', 'Huber', 'Sonnenweg 3, 3012 Bern', '1990-02-28'),
('Sarah', 'Fischer', 'Mühlestrasse 12, 5000 Aarau', '1993-09-07'),
('Daniel', 'Schmid', 'Rheinweg 8, 4055 Basel', '1985-11-29'),
('Lisa', 'Brunner', 'Bahnhofstrasse 20, 9000 St. Gallen', '1996-03-15'),
('Michael', 'Kaufmann', 'Seestrasse 10, 2502 Biel/Bienne', '1987-06-19'),
('Sabrina', 'Meyer', 'Limmatquai 14, 8001 Zürich', '1992-08-23'),
('Thomas', 'Bachmann', 'Zugerstrasse 30, 6330 Cham', '1989-10-06'),
('Stefanie', 'Keller', 'Hauptstrasse 5, 8953 Dietikon', '1994-07-17'),
('Patrick', 'Schwarz', 'Lindenweg 12, 6340 Baar', '1986-12-31');

-- ******************************************************************
-- * Leasingvertrag Tabelle befuellen.                             
-- ******************************************************************
INSERT INTO Leasingvertrag (fk_FahrzeugID, fk_KundenID, Vertragsbeginn, Vertragsende, Vertragslaufzeit, MonatlicheZahlungen) VALUES 
(1, 3, '2022-01-01', '2024-01-01', 24, 1250.00),
(2, 4, '2022-02-15', '2024-02-15', 24, 900.00),
(3, 5, '2022-03-01', '2024-03-01', 24, 1100.00),
(4, 6, '2022-04-01', '2024-04-01', 24, 1400.00),
(5, 7, '2022-05-15', '2024-05-15', 24, 1600.00),
(6, 8, '2022-06-01', '2024-06-01', 24, 2000.00),
(7, 9, '2022-07-01', '2024-07-01', 24, 1750.00),
(8, 10, '2022-08-15', '2024-08-15', 24, 1200.00),
(9, 11, '2022-09-01', '2024-09-01', 24, 1000.00),
(10, 12, '2022-10-01', '2024-10-01', 24, 1300.00),
(11, 13, '2022-11-15', '2024-11-15', 24, 1500.00),
(12, 14, '2022-12-01', '2024-12-01', 24, 1800.00),
(13, 15, '2023-01-01', '2025-01-01', 24, 1900.00),
(14, 16, '2023-02-15', '2025-02-15', 24, 1400.00),
(15, 17, '2023-03-01', '2025-03-01', 24, 1700.00),
(16, 18, '2023-04-01', '2025-04-01', 24, 2200.00),
(17, 19, '2023-05-15', '2025-05-15', 24, 2500.00),
(18, 20, '2023-06-01', '2025-06-01', 24, 1900.00),
(19, 2, '2023-07-01', '2025-07-01', 24, 2200.00),
(20, 1, '2023-08-15', '2025-08-15', 24, 1600.00);

-- ******************************************************************
-- * Wartung_Reparatur Tabelle befuellen.                             
-- ******************************************************************
INSERT INTO Wartung_Reparatur (fk_FahrzeugID, Beschreibung, Datum, Kosten) VALUES 
(1, 'Bremsen erneuern', '2022-04-01', 1200.00),
(2, 'Ölwechsel', '2022-03-15', 300.00),
(3, 'Klimaanlage reparieren', '2022-05-10', 800.00),
(4, 'Zahnriemen wechseln', '2022-02-28', 1500.00),
(5, 'Scheibenwischer ersetzen', '2022-04-20', 100.00),
(6, 'Motorreparatur', '2022-06-05', 3500.00),
(7, 'Getriebeöl wechseln', '2022-03-01', 400.00),
(8, 'Bremsflüssigkeit auffüllen', '2022-07-12', 150.00),
(9, 'Reifen wechseln', '2022-10-15', 600.00),
(10, 'Auspuff reparieren', '2022-05-30', 900.00),
(11, 'Inspektion durchführen', '2022-08-10', 500.00),
(12, 'Lackausbesserung', '2022-09-25', 800.00),
(13, 'Fensterscheibe austauschen', '2022-07-05', 400.00),
(14, 'Kupplung erneuern', '2022-12-02', 2000.00),
(15, 'Kühler reparieren', '2022-11-15', 600.00),
(16, 'Batterie wechseln', '2022-10-20', 150.00),
(17, 'Türschloss ersetzen', '2022-09-10', 250.00),
(18, 'Achsen ausrichten', '2022-08-20', 300.00),
(19, 'Airbag reparieren', '2022-11-28', 700.00),
(20, 'Lenkung überprüfen', '2022-12-15', 400.00);

-- ******************************************************************
-- * Zahlungshistorie Tabelle befuellen.                             
-- ******************************************************************
INSERT INTO Zahlungshistorie (fk_VertragsID, Betrag, Datum, Status) VALUES 
(10, 1500.00, '2022-01-01', 1),
(11, 1500.00, '2022-09-21', 1),
(12, 1750.50, '2022-02-05', 1),
(13, 2000.00, '2022-03-12', 1),
(14, 2250.75, '2022-04-18', 0),
(15, 1500.00, '2022-05-25', 1),
(16, 1750.50, '2022-06-30', 1),
(17, 2000.00, '2022-07-07', 1),
(18, 2250.75, '2022-08-14', 0),
(19, 1750.50, '2022-10-27', 1),
(20, 2000.00, '2022-11-03', 1),
(21, 2250.75, '2022-12-10', 0),
(22, 1750.50, '2022-12-17', 1),
(23, 2000.00, '2022-12-24', 1),
(24, 2250.75, '2022-12-31', 0),
(25, 1750.50, '2023-01-07', 1),
(26, 2000.00, '2023-01-14', 1),
(27, 2250.75, '2023-01-21', 0),
(28, 1750.50, '2023-01-28', 1),
(29, 2000.00, '2023-02-04', 1);

-- ******************************************************************
-- * Wartung_Reparatur_Fahrzeug Zwischentabelle befuellen.                             
-- ******************************************************************
INSERT INTO Wartung_Reparatur_Fahrzeug (fk_ReparaturID, fk_FahrzeugID) VALUES
(1, 1), 
(2, 1), 
(2, 2), 
(3, 3), 
(3, 4), 
(4, 5), 
(4, 6), 
(5, 7), 
(6, 8), 
(7, 9),
(8, 10),
(9, 1),
(10, 2),
(11, 3),
(12, 4),
(13, 5),
(14, 6),
(15, 7),
(16, 8),
(17, 9);