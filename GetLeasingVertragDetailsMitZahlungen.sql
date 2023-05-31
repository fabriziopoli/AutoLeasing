CREATE PROCEDURE GetLeasingVertragDetails
    @VertragsID INT
AS
BEGIN
    SELECT LV.VertragsID, F.Marke, F.Modell, K.Vorname, K.Nachname, LV.Vertragsbeginn, LV.Vertragsende, LV.Vertragslaufzeit, LV.MonatlicheZahlungen, LV.Restwert,
           Z.ZahlungsID, Z.Betrag, Z.Datum, Z.Status
    FROM Leasingvertrag LV
    INNER JOIN Fahrzeug F ON LV.FahrzeugID = F.FahrzeugID
    INNER JOIN Kunde K ON LV.KundenID = K.KundenID
    LEFT JOIN Zahlungshistorie Z ON LV.VertragsID = Z.VertragsID
    WHERE LV.VertragsID = @VertragsID;
END


EXEC GetLeasingVertragDetails
  @VertragsID = 11; 