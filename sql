SELECT h.host, COUNT(*) AS problem_count
FROM hosts h
JOIN hosts_groups hg ON h.hostid = hg.hostid
JOIN groups g ON hg.groupid = g.groupid
JOIN triggers t ON h.hostid = t.hostid
JOIN functions f ON t.triggerid = f.triggerid
JOIN items i ON f.itemid = i.itemid
JOIN events e ON t.triggerid = e.objectid
WHERE g.name = 'YourHostGroupName'
  AND e.value = 1
GROUP BY h.host;
