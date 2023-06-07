-- AutoLeasing --

use AutoleasingDB;
go

-- ******************************************************************
-- * Stored Procedure AddFahrzeug löschen falls es schon existiert.                       
-- ******************************************************************
drop procedure if exists AddFahrzeug;
go

-- ******************************************************************
-- * Stored Procedure AddFahrzeug erstellen.                    
-- ******************************************************************
CREATE PROCEDURE AddFahrzeug
    @Marke VARCHAR(50),
    @Modell VARCHAR(50),
    @Baujahr INT,
    @Preis INT
AS
BEGIN
    -- Überprüfen, ob alle Parameter befüllt sind
    IF @Marke IS NULL
    BEGIN
        RAISERROR('Der Parameter @Marke darf nicht NULL sein.', 16, 1)
        RETURN
    END

    IF @Modell IS NULL
    BEGIN
        RAISERROR('Der Parameter @Modell darf nicht NULL sein.', 16, 1)
        RETURN
    END

    IF @Baujahr IS NULL
    BEGIN
        RAISERROR('Der Parameter @Baujahr darf nicht NULL sein.', 16, 1)
        RETURN
    END

    IF @Preis IS NULL
    BEGIN
        RAISERROR('Der Parameter @Preis darf nicht NULL sein.', 16, 1)
        RETURN
    END

    -- Insert-Anweisung ausführen
    INSERT INTO Fahrzeug (Marke, Modell, Baujahr, Preis)
    VALUES (@Marke, @Modell, @Baujahr, @Preis)
    RETURN 1
END
go

-- ******************************************************************
-- * AddFahrzeug ausfuehren.              
-- ******************************************************************
EXEC AddFahrzeug @Marke = 'Ford', @Modell = 'Mustang', @Baujahr = 1965, @Preis = 77423;

-- ******************************************************************
-- * Test zum Procedure AddFahrzeug.            
-- ******************************************************************

-- Test 1.0: Fügt den Ford Mustang zur Fahrzeug Tabelle hinzu und
-- Testet ob der Ford Mustang vorhanden ist.
EXEC AddFahrzeug @Marke = 'Ford', @Modell = 'Mustang', @Baujahr = 1965, @Preis = 77423;
SELECT * FROM Fahrzeug WHERE Marke = 'Ford' AND Modell = 'Mustang';

-- Test 2.0: Fügt den Dodge Charger zur Fahrzeug Tabelle hinzu und
-- Testet ob der Dodge Charger vorhanden ist.
EXEC AddFahrzeug @Marke = 'Dodge', @Modell = 'Charger', @Baujahr = 1971, @Preis = 89900;
SELECT * FROM Fahrzeug WHERE Marke = 'Dodge' AND Modell = 'Charger';

-- Test 3.0: Gibt ein Error zurück das die Parameter nicht NULL sein dürfen.
EXEC AddFahrzeug @Marke = NULL, @Modell = NULL, @Baujahr = NULL, @Preis = NULL;