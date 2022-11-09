
SET SEARCH_PATH TO 

SET SEARCH_PATH TO 

CREATE TABLE act_fo_databasechangeloglock (ID INTEGER NOT NULL, LOCKED BOOLEAN NOT NULL, LOCKGRANTED TIMESTAMP WITHOUT TIME ZONE, LOCKEDBY VARCHAR(255), CONSTRAINT ACT_FO_DATABASECHANGELOGLOCK_PKEY PRIMARY KEY (ID));

DELETE FROM act_fo_databasechangeloglock;

INSERT INTO act_fo_databasechangeloglock (ID, LOCKED) VALUES (1, FALSE);

UPDATE act_fo_databasechangeloglock SET LOCKED = TRUE, LOCKEDBY = '192.168.68.111 (192.168.68.111)', LOCKGRANTED = '2021-12-28 10:31:33.378' WHERE ID = 1 AND LOCKED = FALSE;

SET SEARCH_PATH TO 

CREATE TABLE act_fo_databasechangelog (ID VARCHAR(255) NOT NULL, AUTHOR VARCHAR(255) NOT NULL, FILENAME VARCHAR(255) NOT NULL, DATEEXECUTED TIMESTAMP WITHOUT TIME ZONE NOT NULL, ORDEREXECUTED INTEGER NOT NULL, EXECTYPE VARCHAR(10) NOT NULL, MD5SUM VARCHAR(35), DESCRIPTION VARCHAR(255), COMMENTS VARCHAR(255), TAG VARCHAR(255), LIQUIBASE VARCHAR(20), CONTEXTS VARCHAR(255), LABELS VARCHAR(255), DEPLOYMENT_ID VARCHAR(10));

SET SEARCH_PATH TO 

SET SEARCH_PATH TO 

SET SEARCH_PATH TO 

CREATE TABLE ACT_FO_FORM_DEPLOYMENT (ID_ VARCHAR(255) NOT NULL, NAME_ VARCHAR(255), CATEGORY_ VARCHAR(255), DEPLOY_TIME_ TIMESTAMP WITHOUT TIME ZONE, TENANT_ID_ VARCHAR(255), PARENT_DEPLOYMENT_ID_ VARCHAR(255), CONSTRAINT ACT_FO_FORM_DEPLOYMENT_PKEY PRIMARY KEY (ID_));

CREATE TABLE ACT_FO_FORM_RESOURCE (ID_ VARCHAR(255) NOT NULL, NAME_ VARCHAR(255), DEPLOYMENT_ID_ VARCHAR(255), RESOURCE_BYTES_ BYTEA, CONSTRAINT ACT_FO_FORM_RESOURCE_PKEY PRIMARY KEY (ID_));

CREATE TABLE ACT_FO_FORM_DEFINITION (ID_ VARCHAR(255) NOT NULL, NAME_ VARCHAR(255), VERSION_ INTEGER, KEY_ VARCHAR(255), CATEGORY_ VARCHAR(255), DEPLOYMENT_ID_ VARCHAR(255), PARENT_DEPLOYMENT_ID_ VARCHAR(255), TENANT_ID_ VARCHAR(255), RESOURCE_NAME_ VARCHAR(255), DESCRIPTION_ VARCHAR(255), CONSTRAINT ACT_FO_FORM_DEFINITION_PKEY PRIMARY KEY (ID_));

CREATE TABLE ACT_FO_FORM_INSTANCE (ID_ VARCHAR(255) NOT NULL, FORM_DEFINITION_ID_ VARCHAR(255) NOT NULL, TASK_ID_ VARCHAR(255), PROC_INST_ID_ VARCHAR(255), PROC_DEF_ID_ VARCHAR(255), SUBMITTED_DATE_ TIMESTAMP WITHOUT TIME ZONE, SUBMITTED_BY_ VARCHAR(255), FORM_VALUES_ID_ VARCHAR(255), TENANT_ID_ VARCHAR(255), CONSTRAINT ACT_FO_FORM_INSTANCE_PKEY PRIMARY KEY (ID_));

INSERT INTO act_fo_databasechangelog (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1', 'activiti', 'org/flowable/form/db/liquibase/flowable-form-db-changelog.xml', NOW(), 1, '8:033ebf9380889aed7c453927ecc3250d', 'createTable tableName=ACT_FO_FORM_DEPLOYMENT; createTable tableName=ACT_FO_FORM_RESOURCE; createTable tableName=ACT_FO_FORM_DEFINITION; createTable tableName=ACT_FO_FORM_INSTANCE', '', 'EXECUTED', NULL, NULL, '4.3.5', '0683893454');

SET SEARCH_PATH TO 

ALTER TABLE ACT_FO_FORM_INSTANCE ADD SCOPE_ID_ VARCHAR(255);

ALTER TABLE ACT_FO_FORM_INSTANCE ADD SCOPE_TYPE_ VARCHAR(255);

ALTER TABLE ACT_FO_FORM_INSTANCE ADD SCOPE_DEFINITION_ID_ VARCHAR(255);

INSERT INTO act_fo_databasechangelog (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('2', 'flowable', 'org/flowable/form/db/liquibase/flowable-form-db-changelog.xml', NOW(), 2, '8:986365ceb40445ce3b27a8e6b40f159b', 'addColumn tableName=ACT_FO_FORM_INSTANCE', '', 'EXECUTED', NULL, NULL, '4.3.5', '0683893454');

SET SEARCH_PATH TO 

ALTER TABLE ACT_FO_FORM_DEFINITION DROP COLUMN PARENT_DEPLOYMENT_ID_;

INSERT INTO act_fo_databasechangelog (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('3', 'flowable', 'org/flowable/form/db/liquibase/flowable-form-db-changelog.xml', NOW(), 3, '8:abf482518ceb09830ef674e52c06bf15', 'dropColumn columnName=PARENT_DEPLOYMENT_ID_, tableName=ACT_FO_FORM_DEFINITION', '', 'EXECUTED', NULL, NULL, '4.3.5', '0683893454');

SET SEARCH_PATH TO 

CREATE UNIQUE INDEX ACT_IDX_FORM_DEF_UNIQ ON ACT_FO_FORM_DEFINITION(KEY_, VERSION_, TENANT_ID_);

INSERT INTO act_fo_databasechangelog (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('5', 'flowable', 'org/flowable/form/db/liquibase/flowable-form-db-changelog.xml', NOW(), 4, '8:b4be732b89e5ca028bdd520c6ad4d446', 'createIndex indexName=ACT_IDX_FORM_DEF_UNIQ, tableName=ACT_FO_FORM_DEFINITION', '', 'EXECUTED', NULL, NULL, '4.3.5', '0683893454');

SET SEARCH_PATH TO 

CREATE INDEX ACT_IDX_FORM_TASK ON ACT_FO_FORM_INSTANCE(TASK_ID_);

CREATE INDEX ACT_IDX_FORM_PROC ON ACT_FO_FORM_INSTANCE(PROC_INST_ID_);

CREATE INDEX ACT_IDX_FORM_SCOPE ON ACT_FO_FORM_INSTANCE(SCOPE_ID_, SCOPE_TYPE_);

INSERT INTO act_fo_databasechangelog (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('6', 'flowable', 'org/flowable/form/db/liquibase/flowable-form-db-changelog.xml', NOW(), 5, '8:384bbd364a649b67c3ca1bcb72fe537f', 'createIndex indexName=ACT_IDX_FORM_TASK, tableName=ACT_FO_FORM_INSTANCE; createIndex indexName=ACT_IDX_FORM_PROC, tableName=ACT_FO_FORM_INSTANCE; createIndex indexName=ACT_IDX_FORM_SCOPE, tableName=ACT_FO_FORM_INSTANCE', '', 'EXECUTED', NULL, NULL, '4.3.5', '0683893454');

SET SEARCH_PATH TO 

UPDATE act_fo_databasechangeloglock SET LOCKED = FALSE, LOCKEDBY = NULL, LOCKGRANTED = NULL WHERE ID = 1;

SET SEARCH_PATH TO 

