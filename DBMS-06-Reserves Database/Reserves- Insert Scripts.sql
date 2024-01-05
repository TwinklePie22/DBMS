-- Insert sailors
INSERT INTO sailors (sid, sname) VALUES
(1, 'John'),
(2, 'Amit'),
(3, 'Maria'),
(4, 'David');

-- Insert boats
INSERT INTO boats (bid, bname, color) VALUES
(101, 'Sailboat1', 'red'),
(102, 'Canoe1', 'blue'),
(103, 'Yacht1', 'green'),
(104, 'Kayak1', 'red');

-- Insert reserves
INSERT INTO reserves (sid, bid, rdate) VALUES
(1, 101, '2024-01-05'),
(2, 102, '2024-01-10'),
(3, 103, '2024-01-15'),
(4, 104, '2024-01-20');

