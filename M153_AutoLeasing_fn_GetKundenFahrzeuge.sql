-- AutoLeasing --

USE AutoleasingDB;
GO

-- ******************************************************************
-- * Function GetKundeFahrzeuge löschen 
-- * falls es schon existiert.                       
-- ******************************************************************
DROP FUNCTION IF EXISTS GetKundeFahrzeuge
GO

-- ******************************************************************
-- * Function GetKundeFahrzeuge erstellen.                    
-- ******************************************************************
CREATE FUNCTION GetKundeFahrzeuge (
    @KundenID INT
)
RETURNS TABLE
AS
RETURN
(
    -- Die Funktion gibt eine Tabelle zurück, daher wird der SELECT-Anweisung eine Tabelle zugewiesen.
    BEGIN
        SELECT K.KundenID, K.Vorname, K.Nachname, K.Adresse, K.Geburtsdatum,
            COUNT(LV.VertragsID) AS AnzahlFahrzeuge,
            STUFF(
                (
                    -- Die STUFF-Funktion wird verwendet, um die Liste der gemieteten Fahrzeuge zu generieren.
                    -- Die FOR XML PATH-Klausel dient zum Konkatenieren der Fahrzeugmarken und -modelle.
                    SELECT ', ' + F.Marke + ' ' + F.Modell
                    FROM Leasingvertrag LV
                    INNER JOIN Fahrzeug F ON LV.FahrzeugID = F.FahrzeugID
                    WHERE LV.FahrzeugID = K.KundenID
                    FOR XML PATH(''), TYPE
                ).value('.', 'NVARCHAR(MAX)'), 1, 2, ''
            ) AS GemieteteFahrzeuge
        FROM Kunde K
        LEFT JOIN Leasingvertrag LV ON K.KundenID = LV.FahrzeugID
        WHERE K.KundenID = @KundenID
        GROUP BY K.KundenID, K.Vorname, K.Nachname, K.Adresse, K.Geburtsdatum
    END
);
go


-- ******************************************************************
-- * Tests zur Function GetKundeFahrzeuge.            
-- ******************************************************************

-- Test 1.0: Führt die Funktion aus und gibt die Fahrezeuge aus 
-- welche der Kunde mit der Id 1 gemietet hat.
SELECT * FROM GetKundeFahrzeuge(1);

-- Test 2.0: Führt die Funktion aus und gibt die Fahrezeuge aus 
-- welche der Kunde mit der Id 3 gemietet hat.
SELECT * FROM GetKundeFahrzeuge(3);

-- Test 3.0: Führt die Funktion aus und gibt die Fahrezeuge aus 
-- welche der Kunde mit der Id 5 gemietet hat.
SELECT * FROM GetKundeFahrzeuge(5);