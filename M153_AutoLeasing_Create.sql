-- AutoLeasing --

use master;
go

-- ******************************************************************
-- * Datenbank AutoLeasingDBlöschen falls sie schon existiert.                        
-- ******************************************************************
drop database if exists AutoleasingDB;
go

-- ******************************************************************
-- * Datenbank AutoLeasingDB erstellen.                    
-- ******************************************************************
CREATE DATABASE AutoleasingDB;
go

USE AutoleasingDB;
go

-- ******************************************************************
-- * Fahrzeug Tabelle erstellen.            
-- ******************************************************************
CREATE TABLE Fahrzeug (
    FahrzeugID INT PRIMARY KEY IDENTITY(1,1),
    Marke VARCHAR(50),
    Modell VARCHAR(50),
    Baujahr INT,
    Preis INT
);
go

-- ******************************************************************
-- * Kunde Tabelle erstellen.            
-- ******************************************************************
CREATE TABLE Kunde (
    KundenID INT PRIMARY KEY IDENTITY(1,1),
    Vorname VARCHAR(50),
    Nachname VARCHAR(50),
    Adresse VARCHAR(100),
    Geburtsdatum DATE
);
go

-- ******************************************************************
-- * Leasingvertrag Tabelle erstellen.            
-- ******************************************************************
CREATE TABLE Leasingvertrag (
    VertragsID INT PRIMARY KEY IDENTITY(1,1),
    fk_FahrzeugID INT,
    fk_KundenID INT,
    Vertragsbeginn DATE,
    Vertragsende DATE,
    Vertragslaufzeit INT,
    MonatlicheZahlungen DECIMAL(10, 2),
    Restwert DECIMAL(10, 2),
    FOREIGN KEY (fk_FahrzeugID) REFERENCES Fahrzeug (FahrzeugID),
    FOREIGN KEY (fk_KundenID) REFERENCES Kunde (KundenID)
);
go

-- ******************************************************************
-- * Wartung_Reparatur Tabelle erstellen.            
-- ******************************************************************
CREATE TABLE Wartung_Reparatur (
    ReparaturID INT PRIMARY KEY IDENTITY(1,1),
    fk_FahrzeugID INT,
    Beschreibung VARCHAR(200),
    Datum DATE,
    Kosten DECIMAL(10, 2),
    FOREIGN KEY (fk_FahrzeugID) REFERENCES Fahrzeug (FahrzeugID)
);
go

-- ******************************************************************
-- * Wartung_Reparatur_Fahrzeug Tabelle erstellen.            
-- ******************************************************************
CREATE TABLE Wartung_Reparatur_Fahrzeug (
    fk_ReparaturID INT,
    fk_FahrzeugID INT,
    PRIMARY KEY (fk_ReparaturID, fk_FahrzeugID),
    FOREIGN KEY (fk_ReparaturID) REFERENCES Wartung_Reparatur (ReparaturID),
    FOREIGN KEY (fk_FahrzeugID) REFERENCES Fahrzeug (FahrzeugID)
);
go

-- ******************************************************************
-- * Zahlungshistorie Tabelle erstellen.            
-- ******************************************************************
CREATE TABLE Zahlungshistorie (
    ZahlungsID INT PRIMARY KEY IDENTITY(1,1),
    fk_VertragsID INT,
    Betrag DECIMAL(10, 2),
    Datum DATE,
    Status BIT,
    FOREIGN KEY (fk_VertragsID) REFERENCES Leasingvertrag (VertragsID)
);
go