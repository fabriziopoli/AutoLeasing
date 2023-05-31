CREATE PROCEDURE AddFahrzeug
    @Marke VARCHAR(50),
    @Modell VARCHAR(50),
    @Baujahr INT,
    @Preis INT
AS
BEGIN
    INSERT INTO Fahrzeug (Marke, Modell, Baujahr, Preis)
    VALUES (@Marke, @Modell, @Baujahr, @Preis)
END

--Abfüllen von Daten
EXEC AddFahrzeug @Marke = 'Ford Mustang', @Modell = '289', @Baujahr = 1965, @Preis = 77423;

--Test zum Procedure AddFahrzeug
SELECT * FROM Fahrzeug WHERE Marke = 'Ford Mustang' AND Modell = '289';





