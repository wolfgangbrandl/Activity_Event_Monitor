set event monitor DB2ACTIVITIES state = 1;
ALTER WORKLOAD SYSDEFAULTUSERWORKLOAD COLLECT ACTIVITY DATA ON COORDINATOR WITH DETAILS and VALUES;
