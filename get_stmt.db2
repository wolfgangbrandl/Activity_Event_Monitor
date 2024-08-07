SELECT VARCHAR(A.APPL_NAME, 15) as APPL_NAME,
       VARCHAR(A.TPMON_CLIENT_APP, 20) AS CLIENT_APP_NAME,
       VARCHAR(A.APPL_ID, 30) as APPL_ID,
       A.ACTIVITY_ID,
       A.UOW_ID, V.STMT_VALUE_DATA,
       VARCHAR(S.STMT_TEXT, 300) AS STMT_TEXT
FROM ACTIVITY_DB2ACTIVITIES AS A,
     ACTIVITYSTMT_DB2ACTIVITIES AS S,
     ACTIVITYVALS_DB2ACTIVITIES AS V
WHERE A.APPL_ID = S.APPL_ID AND
      A.APPL_ID = V.APPL_ID AND
      A.ACTIVITY_ID = S.ACTIVITY_ID AND
      A.ACTIVITY_ID = V.ACTIVITY_ID AND
      A.UOW_ID = S.UOW_ID AND
      A.UOW_ID = V.UOW_ID;
