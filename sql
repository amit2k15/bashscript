SELECT h.host, COUNT(*) AS problem_count
FROM hosts h
JOIN items i ON i.hostid = h.hostid
JOIN functions f ON f.itemid = i.itemid
JOIN triggers t ON t.triggerid = f.triggerid
JOIN hosts_groups hg ON hg.hostid = h.hostid
JOIN groups g ON g.groupid = hg.groupid
JOIN problem p ON p.objectid = t.triggerid
WHERE g.name = 'your_host_group_name'
GROUP BY h.host;
