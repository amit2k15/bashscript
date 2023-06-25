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
