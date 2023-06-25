SELECT h.host, COUNT(p.eventid) AS problem_count
FROM hosts h
LEFT JOIN items i ON i.hostid = h.hostid
LEFT JOIN functions f ON f.itemid = i.itemid
LEFT JOIN triggers t ON t.triggerid = f.triggerid
LEFT JOIN problem p ON p.objectid = t.triggerid
LEFT JOIN hosts_groups hg ON hg.hostid = h.hostid
LEFT JOIN groups g ON g.groupid = hg.groupid
WHERE g.name = 'YourHostGroupName'
GROUP BY h.host;

SELECT h.host, COUNT(p.eventid) AS problem_count
FROM hosts h
JOIN items i ON h.hostid = i.hostid
JOIN functions f ON i.itemid = f.itemid
JOIN triggers t ON f.triggerid = t.triggerid
JOIN problem p ON t.triggerid = p.objectid
JOIN events e ON p.eventid = e.eventid
JOIN hosts_groups hg ON h.hostid = hg.hostid
JOIN groups g ON hg.groupid = g.groupid
WHERE g.name = 'YourHostGroupName'
AND e.clock >= UNIX_TIMESTAMP(DATE_SUB(NOW(), INTERVAL 1 DAY)) -- Change interval as needed
AND p.source = 0
GROUP BY h.host
ORDER BY problem_count DESC;

