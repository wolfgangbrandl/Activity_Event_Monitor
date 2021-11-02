drop event monitor DB2ACTIVITIES;
create event monitor DB2ACTIVITIES for activities write to table manualstart;
set event monitor DB2ACTIVITIES state = 1;
ALTER WORKLOAD SYSDEFAULTUSERWORKLOAD COLLECT ACTIVITY DATA ON ALL database partitions WITH DETAILS and values;
select current timestamp from sysibm.sysdummy1;
