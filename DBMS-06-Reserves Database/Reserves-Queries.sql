-- To find the name of sailors whose reserved boats are red
SELECT DISTINCT s.sname
FROM sailors s
JOIN reserves r ON s.sid = r.sid
JOIN boats b ON r.bid = b.bid
WHERE b.color = 'red';

-- To find the name of sailors whose reserved boats are not colored by Amit
SELECT DISTINCT s.sname
FROM sailors s
JOIN reserves r ON s.sid = r.sid
JOIN boats b ON r.bid = b.bid
WHERE b.color <> 'red' AND s.sname = 'Amit';
