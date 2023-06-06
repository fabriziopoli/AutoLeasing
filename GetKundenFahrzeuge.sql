-- AutoLeasing --

USE AutoleasingDB;
GO

CREATE FUNCTION dbo.GetKundeFahrzeuge (
    @KundenID INT
)
RETURNS TABLE
AS
RETURN
(
    BEGIN TRY
        SELECT K.KundenID, K.Vorname, K.Nachname, K.Adresse, K.Geburtsdatum,
               COUNT(LV.VertragsID) AS AnzahlFahrzeuge,
               STUFF(
                   (
                       SELECT ', ' + F.Marke + ' ' + F.Modell
                       FROM Leasingvertrag LV
                       INNER JOIN Fahrzeug F ON LV.fk_FahrzeugID = F.FahrzeugID
                       WHERE LV.fk_KundenID = K.KundenID
                       FOR XML PATH(''), TYPE
                   ).value('.', 'NVARCHAR(MAX)'), 1, 2, ''
               ) AS GemieteteFahrzeuge
        FROM Kunde K
        LEFT JOIN Leasingvertrag LV ON K.KundenID = LV.fk_KundenID
        WHERE K.KundenID = @KundenID
        GROUP BY K.KundenID, K.Vorname, K.Nachname, K.Adresse, K.Geburtsdatum;
    END TRY
    BEGIN CATCH
        -- Error Handling: Fehlermeldung zurückgeben
        DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
        THROW 50000, @ErrorMessage, 1;
    END CATCH
);

--selects zum testen der function

SELECT * FROM dbo.GetKundeFahrzeuge(1);

SELECT * FROM dbo.GetKundeFahrzeuge(3);

SELECT * FROM dbo.GetKundeFahrzeuge(5);