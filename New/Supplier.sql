-- Create tables
CREATE TABLE Suppliers (
    Sid INT PRIMARY KEY,
    Address VARCHAR(255)
);

CREATE TABLE Parts (
    Pid INT PRIMARY KEY,
    Pname VARCHAR(255),
    Color VARCHAR(255)
);

CREATE TABLE Catalog (
    Sid INT,
    Pid INT,
    Cost DECIMAL(10, 2),
    PRIMARY KEY (Sid, Pid),
    FOREIGN KEY (Sid) REFERENCES Suppliers(Sid),
    FOREIGN KEY (Pid) REFERENCES Parts(Pid)
);

-- Insert sample data
INSERT INTO Suppliers VALUES (1, '123 Main St');
INSERT INTO Suppliers VALUES (2, '456 Oak St');
INSERT INTO Suppliers VALUES (3, '221 Packer Street');

INSERT INTO Parts VALUES (101, 'PartA', 'Red');
INSERT INTO Parts VALUES (102, 'PartB', 'Green');
INSERT INTO Parts VALUES (103, 'PartC', 'Red');
INSERT INTO Parts VALUES (104, 'PartD', 'Blue');

INSERT INTO Catalog VALUES (1, 101, 150.00);
INSERT INTO Catalog VALUES (1, 102, 180.00);
INSERT INTO Catalog VALUES (2, 101, 160.00);
INSERT INTO Catalog VALUES (2, 103, 190.00);
INSERT INTO Catalog VALUES (3, 101, 170.00);
INSERT INTO Catalog VALUES (3, 102, 200.00);

-- Queries
-- i. Find the Sids of suppliers who supply some red part.
SELECT DISTINCT Sid
FROM Catalog
WHERE Pid IN (SELECT Pid FROM Parts WHERE Color = 'Red');

-- ii. Find Pid of parts supplied by every supplier at less than $200.
SELECT Pid
FROM Parts
WHERE NOT EXISTS (
    SELECT Sid
    FROM Suppliers
    WHERE NOT EXISTS (
        SELECT 1
        FROM Catalog
        WHERE Catalog.Sid = Suppliers.Sid AND Catalog.Pid = Parts.Pid AND Cost < 200.00
    )
);

-- iii. Find Sids of suppliers who supply every red or green part
SELECT DISTINCT Sid
FROM Catalog
WHERE NOT EXISTS (
    SELECT Pid
    FROM Parts
    WHERE Color IN ('Red', 'Green')
      AND Pid NOT IN (SELECT Pid FROM Catalog WHERE Sid = Catalog.Sid)
);

-- iv. Find the names of suppliers who supply some red part.
SELECT DISTINCT S.Address
FROM Suppliers S
JOIN Catalog C ON S.Sid = C.Sid
JOIN Parts P ON C.Pid = P.Pid
WHERE P.Color = 'Red';

-- v. Find the Sids of suppliers who supply some red part or are at 221 packer street.
SELECT DISTINCT Sid
FROM Catalog
WHERE Pid IN (SELECT Pid FROM Parts WHERE Color = 'Red')
   OR Sid IN (SELECT Sid FROM Suppliers WHERE Address = '221 Packer Street');