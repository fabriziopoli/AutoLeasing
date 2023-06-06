USE AutoleasingDB;

GO

DROP FUNCTION IF EXISTS GetDurchschnittlicheZahlungenNachMarke;

GO
-- Funktion erstellen
CREATE FUNCTION GetDurchschnittlicheZahlungenNachMarke ()
RETURNS @Table TABLE ([Marke] varchar(80), [DurchschnittlicheZahlung] decimal(9,2))
AS
BEGIN
	INSERT INTO @Table (Marke, DurchschnittlicheZahlung)
    SELECT F.Marke, AVG(LV.MonatlicheZahlungen) AS DurchschnittlicheZahlungen
    FROM Fahrzeug F
    INNER JOIN Leasingvertrag LV ON F.FahrzeugID = LV.FahrzeugID
    GROUP BY F.Marke;
	RETURN
END;