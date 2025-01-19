use AirportReservations
-- Crearea tabelului Clienti

DROP TABLE Exceptii;
DROP TABLE Cupoane;
DROP TABLE Zboruri;
DROP TABLE Bilete;
DROP TABLE Clienti;

CREATE TABLE Clienti (
    idclient INT PRIMARY KEY,
    nume VARCHAR(255),
    statut VARCHAR(50),
    adresa VARCHAR(255),
);

-- Crearea tabelului Bilete
CREATE TABLE Bilete (
    nrbilet INT PRIMARY KEY,
    clasa VARCHAR(50),
    valoare DECIMAL(10, 2),
    sursa VARCHAR(255),
    destinatie VARCHAR(255),
    idclient INT,
    FOREIGN KEY (idclient) REFERENCES Clienti(idclient)
);

-- Crearea tabelului Zboruri
CREATE TABLE Zboruri (
    nrzbor VARCHAR(20),
    plecare DATETIME,
    sosire DATETIME,
    de_la VARCHAR(255),
    la VARCHAR(255),
    aparat_zbor VARCHAR(50),
    nr_locuri INT,
    PRIMARY KEY (nrzbor, plecare)
);

-- Crearea tabelului Cupoane
CREATE TABLE Cupoane (
    nrbilet INT,
    nrzbor VARCHAR(20),
    plecare DATETIME,
    clasa_efectiva VARCHAR(20),
    loc INT,
    PRIMARY KEY (nrbilet, nrzbor, plecare),
    FOREIGN KEY (nrbilet) REFERENCES Bilete(nrbilet),
    FOREIGN KEY (nrzbor, plecare) REFERENCES Zboruri(nrzbor, plecare)
);

-- Crearea tabelului Exceptii
CREATE TABLE Exceptii (
    nrbilet INT,
    nrzbor VARCHAR(50),
    plecare DATETIME,
    clasa_efectiva VARCHAR(50),
    loc INT,
    natura_exceptiei VARCHAR(50)
);


ALTER TABLE Clienti ADD email VARCHAR(255);

-- Inserting values into Clienti table
INSERT INTO Clienti (idclient, nume, statut, adresa, email) VALUES
(1, 'John Doe', 'VIP', '123 Main St', 'john.doe@example.com');
INSERT INTO Clienti (idclient, nume, statut, adresa, email) VALUES
(2, 'Jane Smith', 'C', '456 Oak St', 'jane.smith@example.com');
INSERT INTO Clienti (idclient, nume, statut, adresa, email) VALUES
(3, 'Mircea Lacu', 'VIP', '789 Pine St', 'lacu.mircea@example.com');
INSERT INTO Clienti (idclient, nume, statut, adresa, email) VALUES
(4, 'Alice Johnson', 'VIP', '456 Pine St', 'alice.johnson@example.com');
INSERT INTO Clienti (idclient, nume, statut, adresa, email) VALUES
(5, 'Bob Anderson', 'C', '789 Oak St', 'bob.anderson@example.com');
INSERT INTO Clienti (idclient, nume, statut, adresa, email) VALUES
(6, 'Charlie Brown', 'VIP', '101 Elm St', 'charlie.brown@example.com');
INSERT INTO Clienti (idclient, nume, statut, adresa, email) VALUES
(7, 'Jean Radu', 'VIP', '123 Main St', 'jean.radu@example.com');


-- Inserting values into Bilete table
INSERT INTO Bilete (nrbilet, clasa, valoare, sursa, destinatie, idclient) VALUES
(1, 'Economic', 550.00, 'New York', 'Paris', 1);
INSERT INTO Bilete (nrbilet, clasa, valoare, sursa, destinatie, idclient) VALUES
(2, 'Business', 610.00, 'London', 'Tokyo', 2);
INSERT INTO Bilete (nrbilet, clasa, valoare, sursa, destinatie, idclient) VALUES
(3, 'Economic', 500.00, 'Los Angeles', 'Sydney', 3);
INSERT INTO Bilete (nrbilet, clasa, valoare, sursa, destinatie, idclient) VALUES
(4, 'Economic', 550.00, 'Dortmund', 'Barcelona', 4);
INSERT INTO Bilete (nrbilet, clasa, valoare, sursa, destinatie, idclient) VALUES
(5, 'Business', 600.00, 'Madrid', 'Antalya', 5);
INSERT INTO Bilete (nrbilet, clasa, valoare, sursa, destinatie, idclient) VALUES
(6, 'Economic', 500.00, 'Beijing', 'Chicago', 6);
INSERT INTO Bilete (nrbilet, clasa, valoare, sursa, destinatie, idclient) VALUES
(7, 'Business', 750.00, 'Paris', 'Antalya', 7);
INSERT INTO Bilete (nrbilet, clasa, valoare, sursa, destinatie, idclient) VALUES 
(8, 'Economic', 300, 'Dubai', 'Milano', 1);
INSERT INTO Bilete (nrbilet, clasa, valoare, sursa, destinatie, idclient) VALUES 
(9, 'Business', 500, 'Dubai', 'Milano', 2);
INSERT INTO Bilete (nrbilet, clasa, valoare, sursa, destinatie, idclient) VALUES 
(10, 'Economic', 400, 'Dubai', 'Milano', 3);



-- Inserting values into Zboruri table
INSERT INTO Zboruri (nrzbor, plecare, sosire, de_la, la, aparat_zbor, nr_locuri) VALUES
('AIF213', CONVERT(DATETIME, '2023-09-15 14:15:00', 120), CONVERT(DATETIME, '2023-09-15 18:30:00', 120), 'New York', 'Paris', 'Boeing 777', 150);
INSERT INTO Zboruri (nrzbor, plecare, sosire, de_la, la, aparat_zbor, nr_locuri) VALUES
('BIF314', CONVERT(DATETIME, '2023-09-16 08:30:00', 120), CONVERT(DATETIME, '2023-09-16 14:45:00', 120), 'London', 'Tokyo', 'Airbus A380', 200);
INSERT INTO Zboruri (nrzbor, plecare, sosire, de_la, la, aparat_zbor, nr_locuri) VALUES
('CIF415', CONVERT(DATETIME, '2023-09-17 12:00:00', 120), CONVERT(DATETIME, '2023-09-17 20:00:00', 120), 'Los Angeles', 'Sydney', 'Boeing 747', 180);
INSERT INTO Zboruri (nrzbor, plecare, sosire, de_la, la, aparat_zbor, nr_locuri) VALUES
('DIF516', CONVERT(DATETIME, '2023-09-18 16:45:00', 120), CONVERT(DATETIME, '2023-09-18 22:00:00', 120), 'Dortmund', 'Barcelona', 'Airbus A320', 120);
INSERT INTO Zboruri (nrzbor, plecare, sosire, de_la, la, aparat_zbor, nr_locuri) VALUES
('EIF617', CONVERT(DATETIME, '2023-09-19 10:00:00', 120), CONVERT(DATETIME, '2023-09-19 18:30:00', 120), 'Madrid', 'Antalya', 'Boeing 787', 180);
INSERT INTO Zboruri (nrzbor, plecare, sosire, de_la, la, aparat_zbor, nr_locuri) VALUES
('FIF718', CONVERT(DATETIME, '2023-09-20 14:30:00', 120), CONVERT(DATETIME, '2023-09-20 20:45:00', 120), 'Beijing', 'Chicago', 'Airbus A330', 150);
INSERT INTO Zboruri (nrzbor, plecare, sosire, de_la, la, aparat_zbor, nr_locuri) VALUES
('PAA123', CONVERT(DATETIME, '2023-09-22 10:00:00', 120), CONVERT(DATETIME, '2023-09-22 14:30:00', 120), 'Paris', 'Antalya', 'Boeing 787', 300);

-- Inserting values into Exceptii table
INSERT INTO Exceptii (nrbilet, nrzbor, plecare, clasa_efectiva, loc, natura_exceptiei) VALUES
(1, 'AIF213', CONVERT(DATETIME, '2023-09-15 14:15:00', 120), 'Business', 1, 'Upgrade');
INSERT INTO Exceptii (nrbilet, nrzbor, plecare, clasa_efectiva, loc, natura_exceptiei) VALUES
(2, 'BIF314', CONVERT(DATETIME, '2023-09-16 08:30:00', 120), 'First', 2, 'Overbooking');
INSERT INTO Exceptii (nrbilet, nrzbor, plecare, clasa_efectiva, loc, natura_exceptiei) VALUES
(3, 'CIF415', CONVERT(DATETIME, '2023-09-17 12:00:00', 120), 'Business', 3, 'Upgrade');
INSERT INTO Exceptii (nrbilet, nrzbor, plecare, clasa_efectiva, loc, natura_exceptiei) VALUES
(4, 'DIF516', CONVERT(DATETIME, '2023-09-18 16:45:00', 120), 'First', 4, 'Overbooking');
INSERT INTO Exceptii (nrbilet, nrzbor, plecare, clasa_efectiva, loc, natura_exceptiei) VALUES
(5, 'EIF617', CONVERT(DATETIME, '2023-09-19 10:00:00', 120), 'Business', 5, 'Upgrade');
INSERT INTO Exceptii (nrbilet, nrzbor, plecare, clasa_efectiva, loc, natura_exceptiei) VALUES
(6, 'FIF718', CONVERT(DATETIME, '2023-09-20 14:30:00', 120), 'First', 6, 'Overbooking');


--view-ul este creat pentru a afișa numele clienților, clasa biletelor și locațiile de plecare și sosire ale zborurilor.
CREATE VIEW D_zborurii1 AS
SELECT c.nume, b.clasa, z.de_la, z.la
FROM Clienti c
INNER JOIN Bilete b ON c.idclient = b.idclient
INNER JOIN Zboruri z ON b.sursa = z.de_la;

-- Selectarea biletelor cu valoare între 500 și 600, ordonat descrescător după valoare și crescător după sursa   (interogare)
SELECT *
FROM Bilete
WHERE valoare BETWEEN 500 AND 600
ORDER BY valoare DESC, sursa ASC;

-- functie pentru selectarea zborurilor cu număr locuri peste 100 ordonat crescător după nr_locuri.
CREATE FUNCTION dbo.GetFlightsWithSeatOver100_4()
RETURNS TABLE
AS
RETURN
(
    SELECT *
    FROM Zboruri
    WHERE nr_locuri > 100
);

SELECT *
FROM dbo.GetFlightsWithSeatOver100_4()
ORDER BY nr_locuri ASC;

-- afișează doar numele și adresa clienților împreună cu valoarea biletelor pe care le-au achiziționat (inner join)
SELECT 
    c.nume,
    c.adresa,
    b.valoare AS valoare_bilet
FROM 
    Clienti c
INNER JOIN 
    Bilete b ON c.idclient = b.idclient;

--adaugare pentru zborul ’AIF213’ ce pleacă de la ‘A’ la ‘B’, folosește aparatul de zbor ‘AIRBUS 310-325’, cu plecare la ora 10:45 și sosire la ora 13:05 în data de ’15-AUG-2023’, cu 100 locuri, biletul 123, clasa ’Economic’, locul 89.
-- Adăugarea unui client
INSERT INTO Clienti (idclient, nume, statut, adresa, email)
VALUES (13, 'Bogdan Adina', 'VIP', 'Strada Observatorului', 'adina@gmail.com');

-- Adăugarea unui bilet
INSERT INTO Bilete (nrbilet, clasa, valoare, sursa, destinatie, idclient)
VALUES (123, 'Economic', 150, 'Airport99', 'Airport100', 13);

-- Adăugarea unui zbor
INSERT INTO Zboruri (nrzbor, plecare, sosire, de_la, la, aparat_zbor, nr_locuri)
VALUES ('AIF213', '2023-08-15 10:45:00', '2023-08-15 13:05:00', 'A', 'B', 'AIRBUS 310-325', 100);

-- Adăugarea unui cupon
INSERT INTO Cupoane (nrbilet, nrzbor, plecare, clasa_efectiva, loc)
VALUES (123, 'AIF213', '2023-08-15 10:45:00', 'Economic', 89);

--se ștearg clienții fără bilete.
DELETE FROM Clienti
WHERE idclient NOT IN (SELECT DISTINCT idclient FROM Bilete);

-- Să se modifice ora de plecare pentru zborul zborul ’AIF213’ cu plecarea ’30-SEP-2023 14:00’ astfel încât ora de plecare să devină 14:15.
CREATE PROCEDURE ActualizareOraPlecare3
AS
BEGIN
    UPDATE Zboruri
    SET plecare = CONVERT(DATETIME, '30-SEP-2023 14:15', 120)
    WHERE nrzbor = 'AIF213' AND plecare = CONVERT(DATETIME, '30-SEP-2023 14:00', 120);
END;
--executarea ei
EXEC ActualizareOraPlecare3;
--verificare
SELECT plecare
FROM Zboruri
WHERE nrzbor = 'AIF213';


--trigger asigura că la adăugarea sau ștergerea în tabela Cupoane, se va actualiza coloana nr_locuri a zborului corespunzător.
CREATE TRIGGER ActualizareNrLocuri2s
ON Cupoane
AFTER INSERT, DELETE
AS
BEGIN
    IF (EXISTS (SELECT 1 FROM inserted)) BEGIN
        UPDATE Zboruri
        SET nr_locuri = nr_locuri - 1
        WHERE nrzbor IN (SELECT nrzbor FROM inserted);
    END
    ELSE IF (EXISTS (SELECT 1 FROM deleted)) BEGIN
        UPDATE Zboruri
        SET nr_locuri = nr_locuri + 1
        WHERE nrzbor IN (SELECT nrzbor FROM deleted);
    END
END;

--pt a verifca inseram in 
-- Adaugăm un rând nou în tabelul "Cupoane"
INSERT INTO Cupoane (nrbilet, nrzbor, plecare, clasa_efectiva, loc)
VALUES (3, 'AIF213', '2023-09-15 14:15:00', 'Economic', 10);

-- Verificăm dacă numărul de locuri pentru zborul 'AIF213' a fost actualizat corespunzător
SELECT * FROM Cupoane WHERE nrzbor = 'AIF213';

-- Ștergem rândul inserat din tabela Cupoane
DELETE FROM Cupoane WHERE nrbilet = 3;

-- Verificăm din nou dacă numărul de locuri pentru zborul 'AIF213' a fost actualizat corespunzător
SELECT * FROM Cupoane WHERE nrzbor = 'AIF213';