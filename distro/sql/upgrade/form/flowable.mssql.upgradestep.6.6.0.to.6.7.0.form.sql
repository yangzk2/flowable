

UPDATE ACT_FO_DATABASECHANGELOGLOCK SET LOCKED = 1, LOCKEDBY = '192.168.10.1 (192.168.10.1)', LOCKGRANTED = '2021-08-30T15:50:26.189' WHERE ID = 1 AND LOCKED = 0

CREATE NONCLUSTERED INDEX ACT_IDX_FORM_TASK ON ACT_FO_FORM_INSTANCE(TASK_ID_)

CREATE NONCLUSTERED INDEX ACT_IDX_FORM_PROC ON ACT_FO_FORM_INSTANCE(PROC_INST_ID_)

CREATE NONCLUSTERED INDEX ACT_IDX_FORM_SCOPE ON ACT_FO_FORM_INSTANCE(SCOPE_ID_, SCOPE_TYPE_)

INSERT INTO ACT_FO_DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('6', 'flowable', 'org/flowable/form/db/liquibase/flowable-form-db-changelog.xml', GETDATE(), 5, '8:384bbd364a649b67c3ca1bcb72fe537f', 'createIndex indexName=ACT_IDX_FORM_TASK, tableName=ACT_FO_FORM_INSTANCE; createIndex indexName=ACT_IDX_FORM_PROC, tableName=ACT_FO_FORM_INSTANCE; createIndex indexName=ACT_IDX_FORM_SCOPE, tableName=ACT_FO_FORM_INSTANCE', '', 'EXECUTED', NULL, NULL, '4.3.5', '0331426509')

UPDATE ACT_FO_DATABASECHANGELOGLOCK SET LOCKED = 0, LOCKEDBY = NULL, LOCKGRANTED = NULL WHERE ID = 1

