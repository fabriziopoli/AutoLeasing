-- AutoLeasing --

use AutoleasingDB;
go

-- ******************************************************************
-- * Stored Procedure GetLeasingVertragDetails löschen 
-- * falls es schon existiert.                       
-- ******************************************************************
drop procedure if exists GetLeasingVertragDetails;
go

-- ******************************************************************
-- * Stored Procedure GetLeasingVertragDetails erstellen.                    
-- ******************************************************************
CREATE PROCEDURE GetLeasingVertragDetails
    @VertragsID INT
AS
BEGIN
    -- Überprüfen, ob der Parameter befüllt ist
    IF @VertragsID IS NULL
    BEGIN
        RAISERROR('Der Parameter @VertragsID darf nicht NULL sein.', 16, 1)
        RETURN
    END

    -- Abfrage ausführen
    SELECT LV.VertragsID, F.Marke, F.Modell, K.Vorname, K.Nachname, LV.Vertragsbeginn, LV.Vertragsende, LV.Vertragslaufzeit, LV.MonatlicheZahlungen, LV.Restwert,
           Z.ZahlungsID, Z.Betrag, Z.Datum, Z.Status
    FROM Leasingvertrag LV
    INNER JOIN Fahrzeug F ON LV.fk_FahrzeugID = F.FahrzeugID
    INNER JOIN Kunde K ON LV.fk_KundenID = K.KundenID
    LEFT JOIN Zahlungshistorie Z ON LV.VertragsID = Z.fk_VertragsID
    WHERE LV.VertragsID = @VertragsID;
END

-- ******************************************************************
-- * GetLeasingVertragDetails ausfuehren.              
-- ******************************************************************
EXEC GetLeasingVertragDetails
  @VertragsID = 11; 

EXEC GetLeasingVertragDetails
 @VertragsID = 13; 

EXEC GetLeasingVertragDetails
  @VertragsID = 15; 