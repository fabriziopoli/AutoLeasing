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
('Bugatti', 'Chiron', 2022, 4000000);

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
('David', 'Bachmann', 'Lindenstrasse 10, 6340 Baar', '1994-09-02');

INSERT INTO Leasingvertrag (FahrzeugID, KundenID, Vertragsbeginn, Vertragsende, Vertragslaufzeit, MonatlicheZahlungen) VALUES 
(1, 3, '2022-01-01', '2024-01-01', 24, 1250.00),
(2, 4, '2022-02-15', '2024-02-15', 24, 900.00),
(3, 5, '2022-03-01', '2024-03-01', 24, 1100.00),
(4, 6, '2022-04-01', '2024-04-01', 24, 1400.00),
(5, 7, '2022-05-15', '2024-05-15', 24, 1600.00),
(6, 8, '2022-06-01', '2024-06-01', 24, 2000.00),
(7, 9, '2022-07-01', '2024-07-01', 24, 1750.00),
(8, 10, '2022-08-15', '2024-08-15', 24, 1200.00),
(9, 11, '2022-09-01', '2024-09-01', 24, 1000.00),
(10, 12, '2022-10-01', '2024-10-01', 24, 1300.00);

INSERT INTO Wartung_Reparatur (FahrzeugID, Beschreibung, Datum, Kosten) VALUES 
(1, 'Bremsen erneuern', '2022-04-01', 1200.00),
(2, 'Ölwechsel', '2022-03-15', 300.00),
(3, 'Klimaanlage reparieren', '2022-05-10', 800.00),
(4, 'Zahnriemen wechseln', '2022-02-28', 1500.00),
(5, 'Scheibenwischer ersetzen', '2022-04-20', 100.00),
(6, 'Motorreparatur', '2022-06-05', 3500.00),
(7, 'Getriebeöl wechseln', '2022-03-01', 400.00),
(8, 'Bremsflüssigkeit auffüllen', '2022-07-12', 150.00),
(9, 'Reifen wechseln', '2022-10-15', 600.00),
(10, 'Auspuff reparieren', '2022-05-30', 900.00);

INSERT INTO Zahlungshistorie (VertragsID, Betrag, Datum, Status) VALUES 
(1, 1500.00, '2022-01-01', 1),
(2, 1750.50, '2022-02-05', 1),
(3, 2000.00, '2022-03-12', 1),
(4, 2250.75, '2022-04-18', 0),
(5, 1500.00, '2022-05-25', 1),
(6, 1750.50, '2022-06-30', 1),
(7, 2000.00, '2022-07-07', 1),
(8, 2250.75, '2022-08-14', 0),
(9, 1500.00, '2022-09-21', 1),
(10, 1750.50, '2022-10-27', 1);







