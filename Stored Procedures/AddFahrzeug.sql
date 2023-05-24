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
