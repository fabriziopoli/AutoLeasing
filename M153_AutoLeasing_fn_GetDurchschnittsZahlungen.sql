-- AutoLeasing --

USE AutoleasingDB;
GO

-- ******************************************************************
-- * Function GetDurchschnittlicheZahlungenNachMarke löschen 
-- * falls es schon existiert.                       
-- ******************************************************************
DROP FUNCTION IF EXISTS GetDurchschnittlicheZahlungenNachMarke;
GO

-- ******************************************************************
-- * Function GetDurchschnittlicheZahlungenNachMarke erstellen.                    
-- ******************************************************************
CREATE FUNCTION GetDurchschnittlicheZahlungenNachMarke ()
RETURNS @Table TABLE ([Marke] varchar(80), [DurchschnittlicheZahlung] decimal(9,2))
AS
BEGIN
    -- Überprüfung, ob Daten vorhanden sind
    IF (NOT EXISTS (SELECT 1 FROM Fahrzeug) OR NOT EXISTS (SELECT 1 FROM Leasingvertrag))
    BEGIN
        -- Keine Daten vorhanden, NULL als Ergebnis zurückgeben
        RETURN;
    END

    -- Die Funktion gibt eine Tabelle mit zwei Spalten zurück: "Marke" und "DurchschnittlicheZahlung"
	-- Eine temporäre Tabelle @Table wird erstellt, um die Ergebnisse zu speichern
    -- Die Spalten "Marke" und "DurchschnittlicheZahlung" werden in der Tabelle definiert.
	INSERT INTO @Table (Marke, DurchschnittlicheZahlung)
    SELECT F.Marke, AVG(LV.MonatlicheZahlungen) AS DurchschnittlicheZahlungen
    FROM Fahrzeug F
    INNER JOIN Leasingvertrag LV ON F.FahrzeugID = LV.fk_FahrzeugID
    GROUP BY F.Marke;   
    RETURN;
END;
go

-- ******************************************************************
-- * GetLeasingVertragDetails ausfuehren.              
-- ******************************************************************

-- Test 1.0: Führt die Function GetDurchschnittlicheZahlungenNachMarke 
-- aus.
SELECT * FROM GetDurchschnittlicheZahlungenNachMarke();

-- Test 2.0: Führt die Function GetDurchschnittlicheZahlungenNachMarke 
-- aus mit spezifischen spalten.
SELECT Marke, DurchschnittlicheZahlung FROM GetDurchschnittlicheZahlungenNachMarke();
