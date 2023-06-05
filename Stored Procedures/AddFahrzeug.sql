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
END

-- ******************************************************************
-- * AddFahrzeug ausfuehren.              
-- ******************************************************************
EXEC AddFahrzeug @Marke = 'Ford Mustang', @Modell = '289', @Baujahr = 1965, @Preis = 77423;

-- ******************************************************************
-- * Test zum Procedure AddFahrzeug.            
-- ******************************************************************
SELECT * FROM Fahrzeug WHERE Marke = 'Ford Mustang' AND Modell = '289';