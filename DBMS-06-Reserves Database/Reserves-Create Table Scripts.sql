-- Create sailors table
CREATE TABLE sailors (
    sid INT PRIMARY KEY,
    sname VARCHAR(255) NOT NULL
);

-- Create boats table
CREATE TABLE boats (
    bid INT PRIMARY KEY,
    bname VARCHAR(255) NOT NULL,
    color VARCHAR(50) NOT NULL
);

-- Create reserves table
CREATE TABLE reserves (
    sid INT,
    bid INT,
    rdate DATE,
    FOREIGN KEY (sid) REFERENCES sailors(sid),
    FOREIGN KEY (bid) REFERENCES boats(bid),
    PRIMARY KEY (sid, bid, rdate)
);
