SELECT COUNT(*) AS problem_count
FROM events
WHERE objectid IN (
    SELECT hosts.hostid
    FROM hosts
    WHERE hosts.host = 'your_host_name'
)
AND value = 1;
