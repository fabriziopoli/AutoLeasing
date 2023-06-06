
USE AutoleasingDB;
GO

DROP FUNCTION IF EXISTS GetKundeFahrzeuge

GO

CREATE FUNCTION dbo.GetKundeFahrzeuge (
    @KundenID INT
)
RETURNS TABLE
AS
RETURN
(
        SELECT K.KundenID, K.Vorname, K.Nachname, K.Adresse, K.Geburtsdatum,
               COUNT(LV.VertragsID) AS AnzahlFahrzeuge,
               STUFF(
                   (
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
);
go

--selects zum testen der function

SELECT * FROM dbo.GetKundeFahrzeuge(1);

SELECT * FROM dbo.GetKundeFahrzeuge(3);

SELECT * FROM dbo.GetKundeFahrzeuge(5);