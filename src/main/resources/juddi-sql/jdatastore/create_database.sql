-- DROP TABLE ${prefix}BUSINESS_DESCR;
-- DROP TABLE ${prefix}BUSINESS_CATEGORY;
-- DROP TABLE ${prefix}BUSINESS_IDENTIFIER;
-- DROP TABLE ${prefix}BUSINESS_NAME;
-- DROP TABLE ${prefix}DISCOVERY_URL;
-- DROP TABLE ${prefix}ADDRESS_LINE;
-- DROP TABLE ${prefix}ADDRESS;
-- DROP TABLE ${prefix}PHONE;
-- DROP TABLE ${prefix}EMAIL;
-- DROP TABLE ${prefix}CONTACT_DESCR;
-- DROP TABLE ${prefix}CONTACT;
-- DROP TABLE ${prefix}SERVICE_DESCR;
-- DROP TABLE ${prefix}SERVICE_CATEGORY;
-- DROP TABLE ${prefix}SERVICE_NAME;
-- DROP TABLE ${prefix}BINDING_DESCR;
-- DROP TABLE ${prefix}BINDING_CATEGORY;
-- DROP TABLE ${prefix}INSTANCE_DETAILS_DESCR;
-- DROP TABLE ${prefix}INSTANCE_DETAILS_DOC_DESCR;
-- DROP TABLE ${prefix}TMODEL_CATEGORY;
-- DROP TABLE ${prefix}TMODEL_DESCR;
-- DROP TABLE ${prefix}TMODEL_DOC_DESCR;
-- DROP TABLE ${prefix}TMODEL_IDENTIFIER;
-- DROP TABLE ${prefix}TMODEL_INSTANCE_INFO_DESCR;
-- DROP TABLE ${prefix}TMODEL_INSTANCE_INFO;
-- DROP TABLE ${prefix}PUBLISHER_ASSERTION;
-- DROP TABLE ${prefix}TMODEL;
-- DROP TABLE ${prefix}BINDING_TEMPLATE;
-- DROP TABLE ${prefix}BUSINESS_SERVICE;
-- DROP TABLE ${prefix}BUSINESS_ENTITY;
-- DROP TABLE ${prefix}PUBLISHER;
-- DROP TABLE ${prefix}AUTH_TOKEN;

CREATE TABLE ${prefix}BUSINESS_ENTITY
(
  BUSINESS_KEY VARCHAR(41) NOT NULL,
  AUTHORIZED_NAME VARCHAR(255) NOT NULL,
  PUBLISHER_ID VARCHAR(20) NULL,
  OPERATOR VARCHAR(255) NOT NULL,
  LAST_UPDATE TIMESTAMP NOT NULL,
  PRIMARY KEY (BUSINESS_KEY)
);

CREATE TABLE ${prefix}BUSINESS_DESCR
(
  BUSINESS_KEY VARCHAR(41) NOT NULL,
  BUSINESS_DESCR_ID INT NOT NULL,
  LANG_CODE VARCHAR(5) NULL,
  DESCR VARCHAR(255) NOT NULL,
  PRIMARY KEY (BUSINESS_KEY,BUSINESS_DESCR_ID),
  FOREIGN KEY (BUSINESS_KEY)
    REFERENCES ${prefix}BUSINESS_ENTITY (BUSINESS_KEY)
);

CREATE TABLE ${prefix}BUSINESS_CATEGORY
(
  BUSINESS_KEY VARCHAR(41) NOT NULL,
  CATEGORY_ID INT NOT NULL,
  TMODEL_KEY_REF VARCHAR(41) NULL,
  KEY_NAME VARCHAR(255) NULL,
  KEY_VALUE VARCHAR(255) NOT NULL,
  PRIMARY KEY (BUSINESS_KEY,CATEGORY_ID),
  FOREIGN KEY (BUSINESS_KEY)
    REFERENCES ${prefix}BUSINESS_ENTITY (BUSINESS_KEY)
);

CREATE TABLE ${prefix}BUSINESS_IDENTIFIER
(
  BUSINESS_KEY VARCHAR(41) NOT NULL,
  IDENTIFIER_ID INT NOT NULL,
  TMODEL_KEY_REF VARCHAR(41) NULL,
  KEY_NAME VARCHAR(255) NULL,
  KEY_VALUE VARCHAR(255) NOT NULL,
  PRIMARY KEY (BUSINESS_KEY,IDENTIFIER_ID),
  FOREIGN KEY (BUSINESS_KEY)
    REFERENCES ${prefix}BUSINESS_ENTITY (BUSINESS_KEY)
);

CREATE TABLE ${prefix}BUSINESS_NAME
(
  BUSINESS_KEY VARCHAR(41) NOT NULL,
  BUSINESS_NAME_ID INT NOT NULL,
  LANG_CODE VARCHAR(5) NULL,
  NAME VARCHAR(255) NOT NULL,
  PRIMARY KEY (BUSINESS_KEY,BUSINESS_NAME_ID),
  FOREIGN KEY (BUSINESS_KEY)
    REFERENCES ${prefix}BUSINESS_ENTITY (BUSINESS_KEY)
);

CREATE TABLE ${prefix}CONTACT
(
  BUSINESS_KEY VARCHAR(41) NOT NULL,
  CONTACT_ID INT NOT NULL,
  USE_TYPE VARCHAR(255) NULL,
  PERSON_NAME VARCHAR(255) NOT NULL,
  PRIMARY KEY (BUSINESS_KEY,CONTACT_ID),
  FOREIGN KEY (BUSINESS_KEY)
    REFERENCES ${prefix}BUSINESS_ENTITY (BUSINESS_KEY)
);

CREATE TABLE ${prefix}CONTACT_DESCR
(
  BUSINESS_KEY VARCHAR(41) NOT NULL,
  CONTACT_ID INT NOT NULL,
  CONTACT_DESCR_ID INT NOT NULL,
  LANG_CODE VARCHAR(5) NULL,
  DESCR VARCHAR(255) NOT NULL,
  PRIMARY KEY (BUSINESS_KEY,CONTACT_ID,CONTACT_DESCR_ID),
  FOREIGN KEY (BUSINESS_KEY,CONTACT_ID)
    REFERENCES ${prefix}CONTACT (BUSINESS_KEY,CONTACT_ID)
);

CREATE TABLE ${prefix}ADDRESS
(
  BUSINESS_KEY VARCHAR(41) NOT NULL,
  CONTACT_ID INT NOT NULL,
  ADDRESS_ID INT NOT NULL,
  USE_TYPE VARCHAR(255) NULL,
  SORT_CODE VARCHAR(10) NULL,
  TMODEL_KEY VARCHAR(41) NULL,
  PRIMARY KEY (BUSINESS_KEY,CONTACT_ID,ADDRESS_ID),
  FOREIGN KEY (BUSINESS_KEY,CONTACT_ID)
    REFERENCES ${prefix}CONTACT (BUSINESS_KEY,CONTACT_ID)
);

CREATE TABLE ${prefix}ADDRESS_LINE
(
  BUSINESS_KEY VARCHAR(41) NOT NULL,
  CONTACT_ID INT NOT NULL,
  ADDRESS_ID INT NOT NULL,
  ADDRESS_LINE_ID INT NOT NULL,
  LINE VARCHAR(80) NOT NULL,
  KEY_NAME VARCHAR(255) NULL,
  KEY_VALUE VARCHAR(255) NULL,
  PRIMARY KEY (BUSINESS_KEY,CONTACT_ID,ADDRESS_ID,ADDRESS_LINE_ID),
  FOREIGN KEY (BUSINESS_KEY,CONTACT_ID,ADDRESS_ID)
    REFERENCES ${prefix}ADDRESS (BUSINESS_KEY,CONTACT_ID,ADDRESS_ID)
);

CREATE TABLE ${prefix}EMAIL
(
  BUSINESS_KEY VARCHAR(41) NOT NULL,
  CONTACT_ID INT NOT NULL,
  EMAIL_ID INT NOT NULL,
  USE_TYPE VARCHAR(255) NULL,
  EMAIL_ADDRESS VARCHAR(255) NOT NULL,
  PRIMARY KEY (BUSINESS_KEY,CONTACT_ID,EMAIL_ID),
  FOREIGN KEY (BUSINESS_KEY,CONTACT_ID)
    REFERENCES ${prefix}CONTACT (BUSINESS_KEY,CONTACT_ID)
);

CREATE TABLE ${prefix}PHONE
(
  BUSINESS_KEY VARCHAR(41) NOT NULL,
  CONTACT_ID INT NOT NULL,
  PHONE_ID INT NOT NULL,
  USE_TYPE VARCHAR(255) NULL,
  PHONE_NUMBER VARCHAR(50) NOT NULL,
  PRIMARY KEY (BUSINESS_KEY,CONTACT_ID,PHONE_ID),
  FOREIGN KEY (BUSINESS_KEY,CONTACT_ID)
    REFERENCES ${prefix}CONTACT (BUSINESS_KEY,CONTACT_ID)
);

CREATE TABLE ${prefix}DISCOVERY_URL
(
  BUSINESS_KEY VARCHAR(41) NOT NULL,
  DISCOVERY_URL_ID INT NOT NULL,
  USE_TYPE VARCHAR(255) NOT NULL,
  URL VARCHAR(255) NOT NULL,
  PRIMARY KEY (BUSINESS_KEY,DISCOVERY_URL_ID),
  FOREIGN KEY (BUSINESS_KEY)
    REFERENCES ${prefix}BUSINESS_ENTITY (BUSINESS_KEY)
);

CREATE TABLE ${prefix}BUSINESS_SERVICE
(
  BUSINESS_KEY VARCHAR(41) NOT NULL,
  SERVICE_KEY VARCHAR(41) NOT NULL,
  LAST_UPDATE TIMESTAMP NOT NULL,
  PRIMARY KEY (SERVICE_KEY),
  FOREIGN KEY (BUSINESS_KEY)
    REFERENCES ${prefix}BUSINESS_ENTITY (BUSINESS_KEY)
);

CREATE TABLE ${prefix}SERVICE_DESCR
(
  SERVICE_KEY VARCHAR(41) NOT NULL,
  SERVICE_DESCR_ID INT NOT NULL,
  LANG_CODE VARCHAR(5) NULL,
  DESCR VARCHAR(255) NOT NULL,
  PRIMARY KEY (SERVICE_KEY,SERVICE_DESCR_ID),
  FOREIGN KEY (SERVICE_KEY)
    REFERENCES ${prefix}BUSINESS_SERVICE (SERVICE_KEY)
);

CREATE TABLE ${prefix}SERVICE_CATEGORY
(
  SERVICE_KEY VARCHAR(41) NOT NULL,
  CATEGORY_ID INT NOT NULL,
  TMODEL_KEY_REF VARCHAR(41) NULL,
  KEY_NAME VARCHAR(255) NULL,
  KEY_VALUE VARCHAR(255) NOT NULL,
  PRIMARY KEY (SERVICE_KEY,CATEGORY_ID),
  FOREIGN KEY (SERVICE_KEY)
    REFERENCES ${prefix}BUSINESS_SERVICE (SERVICE_KEY)
);

CREATE TABLE ${prefix}SERVICE_NAME
(
  SERVICE_KEY VARCHAR(41) NOT NULL,
  SERVICE_NAME_ID INT NOT NULL,
  LANG_CODE VARCHAR(5) NULL,
  NAME VARCHAR(255) NOT NULL,
  PRIMARY KEY (SERVICE_KEY,SERVICE_NAME_ID),
  FOREIGN KEY (SERVICE_KEY)
    REFERENCES ${prefix}BUSINESS_SERVICE (SERVICE_KEY)
);

CREATE TABLE ${prefix}BINDING_TEMPLATE
(
  SERVICE_KEY VARCHAR(41) NOT NULL,
  BINDING_KEY VARCHAR(41) NOT NULL,
  ACCESS_POINT_TYPE VARCHAR(20) NULL,
  ACCESS_POINT_URL VARCHAR(2000) NULL,
  HOSTING_REDIRECTOR VARCHAR(255) NULL,
  LAST_UPDATE TIMESTAMP NOT NULL,
  PRIMARY KEY (BINDING_KEY),
  FOREIGN KEY (SERVICE_KEY)
    REFERENCES ${prefix}BUSINESS_SERVICE (SERVICE_KEY)
);

CREATE TABLE ${prefix}BINDING_CATEGORY
(
  BINDING_KEY VARCHAR(41) NOT NULL,
  CATEGORY_ID INT NOT NULL,
  TMODEL_KEY_REF VARCHAR(41) NULL,
  KEY_NAME VARCHAR(255) NULL,
  KEY_VALUE VARCHAR(255) NOT NULL,
  PRIMARY KEY (BINDING_KEY,CATEGORY_ID),
  FOREIGN KEY (BINDING_KEY)
    REFERENCES ${prefix}BINDING_TEMPLATE (BINDING_KEY)
);

CREATE TABLE ${prefix}BINDING_DESCR
(
  BINDING_KEY VARCHAR(41) NOT NULL,
  BINDING_DESCR_ID INT NOT NULL,
  LANG_CODE VARCHAR(5) NULL,
  DESCR VARCHAR(255) NOT NULL,
  PRIMARY KEY (BINDING_KEY,BINDING_DESCR_ID),
  FOREIGN KEY (BINDING_KEY)
    REFERENCES ${prefix}BINDING_TEMPLATE (BINDING_KEY)
);

CREATE TABLE ${prefix}TMODEL_INSTANCE_INFO
(
  BINDING_KEY VARCHAR(41) NOT NULL,
  TMODEL_INSTANCE_INFO_ID INT NOT NULL,
  TMODEL_KEY VARCHAR(41) NOT NULL,
  OVERVIEW_URL VARCHAR(255) NULL,
  INSTANCE_PARMS VARCHAR(255) NULL,
  PRIMARY KEY (BINDING_KEY,TMODEL_INSTANCE_INFO_ID),
  FOREIGN KEY (BINDING_KEY)
    REFERENCES ${prefix}BINDING_TEMPLATE (BINDING_KEY)
);

CREATE TABLE ${prefix}TMODEL_INSTANCE_INFO_DESCR
(
  BINDING_KEY VARCHAR(41) NOT NULL,
  TMODEL_INSTANCE_INFO_ID INT NOT NULL,
  TMODEL_INSTANCE_INFO_DESCR_ID INT NOT NULL,
  LANG_CODE VARCHAR(5) NULL,
  DESCR VARCHAR(255) NOT NULL,
  PRIMARY KEY (BINDING_KEY,TMODEL_INSTANCE_INFO_ID,TMODEL_INSTANCE_INFO_DESCR_ID),
  FOREIGN KEY (BINDING_KEY,TMODEL_INSTANCE_INFO_ID)
    REFERENCES ${prefix}TMODEL_INSTANCE_INFO (BINDING_KEY,TMODEL_INSTANCE_INFO_ID)
);

CREATE TABLE ${prefix}INSTANCE_DETAILS_DESCR
(
  BINDING_KEY VARCHAR(41) NOT NULL,
  TMODEL_INSTANCE_INFO_ID INT NOT NULL,
  INSTANCE_DETAILS_DESCR_ID INT NOT NULL,
  LANG_CODE VARCHAR(5) NULL,
  DESCR VARCHAR(255) NOT NULL,
  PRIMARY KEY (BINDING_KEY,TMODEL_INSTANCE_INFO_ID,INSTANCE_DETAILS_DESCR_ID),
  FOREIGN KEY (BINDING_KEY,TMODEL_INSTANCE_INFO_ID)
    REFERENCES ${prefix}TMODEL_INSTANCE_INFO (BINDING_KEY,TMODEL_INSTANCE_INFO_ID)
);

CREATE TABLE ${prefix}INSTANCE_DETAILS_DOC_DESCR
(
  BINDING_KEY VARCHAR(41) NOT NULL,
  TMODEL_INSTANCE_INFO_ID INT NOT NULL,
  INSTANCE_DETAILS_DOC_DESCR_ID INT NOT NULL,
  LANG_CODE VARCHAR(5) NULL,
  DESCR VARCHAR(255) NOT NULL,
  PRIMARY KEY (BINDING_KEY,TMODEL_INSTANCE_INFO_ID,INSTANCE_DETAILS_DOC_DESCR_ID),
  FOREIGN KEY (BINDING_KEY,TMODEL_INSTANCE_INFO_ID)
    REFERENCES ${prefix}TMODEL_INSTANCE_INFO (BINDING_KEY,TMODEL_INSTANCE_INFO_ID)
);

CREATE TABLE ${prefix}TMODEL
(
  TMODEL_KEY VARCHAR(41) NOT NULL,
  AUTHORIZED_NAME VARCHAR(255) NOT NULL,
  PUBLISHER_ID VARCHAR(20) NULL,
  OPERATOR VARCHAR(255) NOT NULL,
  NAME VARCHAR(255) NOT NULL,
  LANG_CODE VARCHAR(5) NULL,
  OVERVIEW_URL VARCHAR(255) NULL,
  DELETED VARCHAR(5) NULL,
  LAST_UPDATE TIMESTAMP NOT NULL,
  PRIMARY KEY (TMODEL_KEY)
);

CREATE TABLE ${prefix}TMODEL_DESCR
(
  TMODEL_KEY VARCHAR(41) NOT NULL,
  TMODEL_DESCR_ID INT NOT NULL,
  LANG_CODE VARCHAR(5) NULL,
  DESCR VARCHAR(255) NOT NULL,
  PRIMARY KEY (TMODEL_KEY,TMODEL_DESCR_ID),
  FOREIGN KEY (TMODEL_KEY)
    REFERENCES ${prefix}TMODEL (TMODEL_KEY)
);

CREATE TABLE ${prefix}TMODEL_CATEGORY
(
  TMODEL_KEY VARCHAR(41) NOT NULL,
  CATEGORY_ID INT NOT NULL,
  TMODEL_KEY_REF VARCHAR(255) NULL,
  KEY_NAME VARCHAR(255) NULL,
  KEY_VALUE VARCHAR(255) NOT NULL,
  PRIMARY KEY (TMODEL_KEY,CATEGORY_ID),
  FOREIGN KEY (TMODEL_KEY)
    REFERENCES ${prefix}TMODEL (TMODEL_KEY)
);

CREATE TABLE ${prefix}TMODEL_IDENTIFIER
(
  TMODEL_KEY VARCHAR(41) NOT NULL,
  IDENTIFIER_ID INT NOT NULL,
  TMODEL_KEY_REF VARCHAR(255) NULL,
  KEY_NAME VARCHAR(255) NULL,
  KEY_VALUE VARCHAR(255) NOT NULL,
  PRIMARY KEY (TMODEL_KEY,IDENTIFIER_ID),
  FOREIGN KEY (TMODEL_KEY)
    REFERENCES ${prefix}TMODEL (TMODEL_KEY)
);

CREATE TABLE ${prefix}TMODEL_DOC_DESCR
(
  TMODEL_KEY VARCHAR(41) NOT NULL,
  TMODEL_DOC_DESCR_ID INT NOT NULL,
  LANG_CODE VARCHAR(5) NULL,
  DESCR VARCHAR(255) NOT NULL,
  PRIMARY KEY (TMODEL_KEY,TMODEL_DOC_DESCR_ID),
  FOREIGN KEY (TMODEL_KEY)
    REFERENCES ${prefix}TMODEL (TMODEL_KEY)
);

CREATE TABLE ${prefix}PUBLISHER_ASSERTION
(
  FROM_KEY VARCHAR(41) NOT NULL,
  TO_KEY VARCHAR(41) NOT NULL,
  TMODEL_KEY VARCHAR(41) NOT NULL,
  KEY_NAME VARCHAR(255) NOT NULL,
  KEY_VALUE VARCHAR(255) NOT NULL,
  FROM_CHECK VARCHAR(5) NOT NULL,
  TO_CHECK VARCHAR(5) NOT NULL,
  FOREIGN KEY (FROM_KEY)
    REFERENCES ${prefix}BUSINESS_ENTITY (BUSINESS_KEY),
  FOREIGN KEY (TO_KEY)
    REFERENCES ${prefix}BUSINESS_ENTITY (BUSINESS_KEY)
);

CREATE TABLE ${prefix}PUBLISHER
(
PUBLISHER_ID VARCHAR(20) NOT NULL,
PUBLISHER_NAME VARCHAR(255) NOT NULL,
EMAIL_ADDRESS VARCHAR(255) NULL,
IS_ADMIN VARCHAR(5) NULL,
IS_ENABLED VARCHAR(5) NULL,
MAX_BUSINESSES INT NULL,
MAX_SERVICES_PER_BUSINESS INT NULL,
MAX_BINDINGS_PER_SERVICE INT NULL,
MAX_TMODELS INT NULL,
PRIMARY KEY (PUBLISHER_ID)
);

CREATE TABLE ${prefix}AUTH_TOKEN
(
AUTH_TOKEN VARCHAR(51) NOT NULL,
PUBLISHER_ID VARCHAR(20) NOT NULL,
PUBLISHER_NAME VARCHAR(255) NOT NULL,
CREATED TIMESTAMP NOT NULL,
LAST_USED TIMESTAMP NOT NULL,
NUMBER_OF_USES INT NOT NULL,
TOKEN_STATE INT NOT NULL,
PRIMARY KEY (AUTH_TOKEN)
);

INSERT INTO ${prefix}TMODEL (TMODEL_KEY,AUTHORIZED_NAME,PUBLISHER_ID,OPERATOR,NAME,OVERVIEW_URL,LAST_UPDATE)
VALUES ('uuid:C1ACF26D-9672-4404-9D70-39B756E62AB4','Administrator','admin','jUDDI.org','uddi-org:types','http://www.uddi.org/taxonomies/UDDI_Taxonomy_tModels.htm#UDDItypes',CURRENT_DATE);

INSERT INTO ${prefix}TMODEL_DESCR (TMODEL_KEY,TMODEL_DESCR_ID,LANG_CODE,DESCR)
VALUES ('uuid:C1ACF26D-9672-4404-9D70-39B756E62AB4',0,'en','UDDI Type Taxonomy');

INSERT INTO ${prefix}TMODEL_DOC_DESCR (TMODEL_KEY,TMODEL_DOC_DESCR_ID,LANG_CODE,DESCR)
VALUES ('uuid:C1ACF26D-9672-4404-9D70-39B756E62AB4',0,'en','Taxonomy used to categorize Service Descriptions.');

INSERT INTO ${prefix}TMODEL_CATEGORY (TMODEL_KEY,CATEGORY_ID,TMODEL_KEY_REF,KEY_NAME,KEY_VALUE)
VALUES ('uuid:C1ACF26D-9672-4404-9D70-39B756E62AB4',0,'uuid:C1ACF26D-9672-4404-9D70-39B756E62AB4','types','categorization');

INSERT INTO ${prefix}TMODEL_CATEGORY (TMODEL_KEY,CATEGORY_ID,TMODEL_KEY_REF,KEY_NAME,KEY_VALUE)
VALUES ('uuid:C1ACF26D-9672-4404-9D70-39B756E62AB4',1,'uuid:C1ACF26D-9672-4404-9D70-39B756E62AB4','types','checked');

INSERT INTO ${prefix}TMODEL (TMODEL_KEY,AUTHORIZED_NAME,PUBLISHER_ID,OPERATOR,NAME,OVERVIEW_URL,LAST_UPDATE)
VALUES ('uuid:DB77450D-9FA8-45D4-A7BC-04411D14E384','Administrator','admin','jUDDI.org','unspsc-org:unspsc:3-1','http://www.uddi.org/taxonomies/UDDI_Taxonomy_tModels.htm#UNSPSC31',CURRENT_DATE);

INSERT INTO ${prefix}TMODEL_DESCR (TMODEL_KEY,TMODEL_DESCR_ID,LANG_CODE,DESCR)
VALUES ('uuid:DB77450D-9FA8-45D4-A7BC-04411D14E384',0,'en','Product Taxonomy: UNSPSC (Version 3.1)');

INSERT INTO ${prefix}TMODEL_DOC_DESCR (TMODEL_KEY,TMODEL_DOC_DESCR_ID,LANG_CODE,DESCR)
VALUES ('uuid:DB77450D-9FA8-45D4-A7BC-04411D14E384',0,'en','This tModel defines the UNSPSC product taxonomy.');

INSERT INTO ${prefix}TMODEL_CATEGORY (TMODEL_KEY,CATEGORY_ID,TMODEL_KEY_REF,KEY_NAME,KEY_VALUE)
VALUES ('uuid:DB77450D-9FA8-45D4-A7BC-04411D14E384',0,'uuid:C1ACF26D-9672-4404-9D70-39B756E62AB4','types','categorization');

INSERT INTO ${prefix}TMODEL (TMODEL_KEY,AUTHORIZED_NAME,PUBLISHER_ID,OPERATOR,NAME,OVERVIEW_URL,LAST_UPDATE)
VALUES ('uuid:CD153257-086A-4237-B336-6BDCBDCC6634','Administrator','admin','jUDDI.org','unspsc-org:unspsc','http://www.uddi.org/taxonomies/UDDI_Taxonomy_tModels.htm#UNSPSC',CURRENT_DATE);

INSERT INTO ${prefix}TMODEL_DESCR (TMODEL_KEY,TMODEL_DESCR_ID,LANG_CODE,DESCR)
VALUES ('uuid:CD153257-086A-4237-B336-6BDCBDCC6634',0,'en','Product Taxonomy: UNSPSC (Version 7.3)');

INSERT INTO ${prefix}TMODEL_DOC_DESCR (TMODEL_KEY,TMODEL_DOC_DESCR_ID,LANG_CODE,DESCR)
VALUES ('uuid:CD153257-086A-4237-B336-6BDCBDCC6634',0,'en','This tModel defines Version 7.3 of the UNSPSC product taxonomy.');

INSERT INTO ${prefix}TMODEL_CATEGORY (TMODEL_KEY,CATEGORY_ID,TMODEL_KEY_REF,KEY_NAME,KEY_VALUE)
VALUES ('uuid:CD153257-086A-4237-B336-6BDCBDCC6634',0,'uuid:C1ACF26D-9672-4404-9D70-39B756E62AB4','types','categorization');

INSERT INTO ${prefix}TMODEL_CATEGORY (TMODEL_KEY,CATEGORY_ID,TMODEL_KEY_REF,KEY_NAME,KEY_VALUE)
VALUES ('uuid:CD153257-086A-4237-B336-6BDCBDCC6634',1,'uuid:C1ACF26D-9672-4404-9D70-39B756E62AB4','types','Checked');

INSERT INTO ${prefix}TMODEL (TMODEL_KEY,AUTHORIZED_NAME,PUBLISHER_ID,OPERATOR,NAME,OVERVIEW_URL,LAST_UPDATE)
VALUES ('uuid:C0B9FE13-179F-413D-8A5B-5004DB8E5BB2','Administrator','admin','jUDDI.org','ntis-gov:naics:1997','http://www.uddi.org/taxonomies/UDDI_Taxonomy_tModels.htm#NAICS',CURRENT_DATE);

INSERT INTO ${prefix}TMODEL_DESCR (TMODEL_KEY,TMODEL_DESCR_ID,LANG_CODE,DESCR)
VALUES ('uuid:C0B9FE13-179F-413D-8A5B-5004DB8E5BB2',0,'en','Business Taxonomy: NAICS(1997 Release)');

INSERT INTO ${prefix}TMODEL_DOC_DESCR (TMODEL_KEY,TMODEL_DOC_DESCR_ID,LANG_CODE,DESCR)
VALUES ('uuid:C0B9FE13-179F-413D-8A5B-5004DB8E5BB2',0,'en','This tModel defines the NAICS industry taxonomy.');

INSERT INTO ${prefix}TMODEL_CATEGORY (TMODEL_KEY,CATEGORY_ID,TMODEL_KEY_REF,KEY_NAME,KEY_VALUE)
VALUES ('uuid:C0B9FE13-179F-413D-8A5B-5004DB8E5BB2',0,'uuid:C1ACF26D-9672-4404-9D70-39B756E62AB4','types','categorization');

INSERT INTO ${prefix}TMODEL_CATEGORY (TMODEL_KEY,CATEGORY_ID,TMODEL_KEY_REF,KEY_NAME,KEY_VALUE)
VALUES ('uuid:C0B9FE13-179F-413D-8A5B-5004DB8E5BB2',1,'uuid:C1ACF26D-9672-4404-9D70-39B756E62AB4','types','checked');

INSERT INTO ${prefix}TMODEL (TMODEL_KEY,AUTHORIZED_NAME,PUBLISHER_ID,OPERATOR,NAME,OVERVIEW_URL,LAST_UPDATE)
VALUES ('uuid:4E49A8D6-D5A2-4FC2-93A0-0411D8D19E88','Administrator','admin','jUDDI.org','uddi-org:iso-ch:3166-1999','http://www.uddi.org/taxonomies/UDDI_Taxonomy_tModels.htm#ISO3166',CURRENT_DATE);

INSERT INTO ${prefix}TMODEL_DESCR (TMODEL_KEY,TMODEL_DESCR_ID,LANG_CODE,DESCR)
VALUES ('uuid:4E49A8D6-D5A2-4FC2-93A0-0411D8D19E88',0,'en','ISO 3166-1:1997 and 3166-2:1998. Codes for names of countries and their subdivisions. Part 1: Country codes. Part 2:Country subdivision codes. Update newsletters include ISO 3166-1 V-1 (1998-02-05), V-2 (1999-10-01), ISO 3166-2 I-1 (1998)');

INSERT INTO ${prefix}TMODEL_DOC_DESCR (TMODEL_KEY,TMODEL_DOC_DESCR_ID,LANG_CODE,DESCR)
VALUES ('uuid:4E49A8D6-D5A2-4FC2-93A0-0411D8D19E88',0,'en','Taxonomy used to categorize entries by geographic location.');

INSERT INTO ${prefix}TMODEL_CATEGORY (TMODEL_KEY,CATEGORY_ID,TMODEL_KEY_REF,KEY_NAME,KEY_VALUE)
VALUES ('uuid:4E49A8D6-D5A2-4FC2-93A0-0411D8D19E88',0,'uuid:C1ACF26D-9672-4404-9D70-39B756E62AB4','types','categorization');

INSERT INTO ${prefix}TMODEL_CATEGORY (TMODEL_KEY,CATEGORY_ID,TMODEL_KEY_REF,KEY_NAME,KEY_VALUE)
VALUES ('uuid:4E49A8D6-D5A2-4FC2-93A0-0411D8D19E88',1,'uuid:C1ACF26D-9672-4404-9D70-39B756E62AB4','types','checked');

INSERT INTO ${prefix}TMODEL (TMODEL_KEY,AUTHORIZED_NAME,PUBLISHER_ID,OPERATOR,NAME,OVERVIEW_URL,LAST_UPDATE)
VALUES ('uuid:A035A07C-F362-44DD-8F95-E2B134BF43B4','Administrator','admin','jUDDI.org','uddi-org:general_keywords','http://www.uddi.org/taxonomies/UDDI_Taxonomy_tModels.htm#GenKW',CURRENT_DATE);

INSERT INTO ${prefix}TMODEL_DESCR (TMODEL_KEY,TMODEL_DESCR_ID,LANG_CODE,DESCR)
VALUES ('uuid:A035A07C-F362-44DD-8F95-E2B134BF43B4',0,'en','Special taxonomy consisting of namespace identifiers and the keywords associated with the namespaces');

INSERT INTO ${prefix}TMODEL_DOC_DESCR (TMODEL_KEY,TMODEL_DOC_DESCR_ID,LANG_CODE,DESCR)
VALUES ('uuid:A035A07C-F362-44DD-8F95-E2B134BF43B4',0,'en','This tModel defines an unidentified taxonomy.');

INSERT INTO ${prefix}TMODEL_CATEGORY (TMODEL_KEY,CATEGORY_ID,TMODEL_KEY_REF,KEY_NAME,KEY_VALUE)
VALUES ('uuid:A035A07C-F362-44DD-8F95-E2B134BF43B4',0,'uuid:C1ACF26D-9672-4404-9D70-39B756E62AB4','types','categorization');

INSERT INTO ${prefix}TMODEL (TMODEL_KEY,AUTHORIZED_NAME,PUBLISHER_ID,OPERATOR,NAME,OVERVIEW_URL,LAST_UPDATE)
VALUES ('uuid:4064C064-6D14-4F35-8953-9652106476A9','Administrator','admin','jUDDI.org','uddi-org:owningBusiness','http://www.uddi.org/taxonomies/UDDI_Taxonomy_tModels.htm#owningBusiness',CURRENT_DATE);

INSERT INTO ${prefix}TMODEL_DESCR (TMODEL_KEY,TMODEL_DESCR_ID,LANG_CODE,DESCR)
VALUES ('uuid:4064C064-6D14-4F35-8953-9652106476A9',0,'en','A pointer to a businessEntity that owns the tagged data.');

INSERT INTO ${prefix}TMODEL_DOC_DESCR (TMODEL_KEY,TMODEL_DOC_DESCR_ID,LANG_CODE,DESCR)
VALUES ('uuid:4064C064-6D14-4F35-8953-9652106476A9',0,'en','This tModel indicates the businessEntity that published or owns the tagged tModel. Used with tModels to establish an "owned" relationship with a registered businessEntity.');

INSERT INTO ${prefix}TMODEL_CATEGORY (TMODEL_KEY,CATEGORY_ID,TMODEL_KEY_REF,KEY_NAME,KEY_VALUE)
VALUES ('uuid:4064C064-6D14-4F35-8953-9652106476A9',0,'uuid:C1ACF26D-9672-4404-9D70-39B756E62AB4','types','categorization');

INSERT INTO ${prefix}TMODEL_CATEGORY (TMODEL_KEY,CATEGORY_ID,TMODEL_KEY_REF,KEY_NAME,KEY_VALUE)
VALUES ('uuid:4064C064-6D14-4F35-8953-9652106476A9',1,'uuid:C1ACF26D-9672-4404-9D70-39B756E62AB4','types','checked');

INSERT INTO ${prefix}TMODEL (TMODEL_KEY,AUTHORIZED_NAME,PUBLISHER_ID,OPERATOR,NAME,OVERVIEW_URL,LAST_UPDATE)
VALUES ('uuid:807A2C6A-EE22-470D-ADC7-E0424A337C03','Administrator','admin','jUDDI.org','uddi-org:relationships','http://www.uddi.org/taxonomies/UDDI_Taxonomy_tModels.htm#Relationships',CURRENT_DATE);

INSERT INTO ${prefix}TMODEL_DESCR (TMODEL_KEY,TMODEL_DESCR_ID,LANG_CODE,DESCR)
VALUES ('uuid:807A2C6A-EE22-470D-ADC7-E0424A337C03',0,'en','Starter set classifications of businessEntity relationships');

INSERT INTO ${prefix}TMODEL_DOC_DESCR (TMODEL_KEY,TMODEL_DOC_DESCR_ID,LANG_CODE,DESCR)
VALUES ('uuid:807A2C6A-EE22-470D-ADC7-E0424A337C03',0,'en','This tModel is used to describe business relationships. Used in the publisher assertion messages.');

INSERT INTO ${prefix}TMODEL_CATEGORY (TMODEL_KEY,CATEGORY_ID,TMODEL_KEY_REF,KEY_NAME,KEY_VALUE)
VALUES ('uuid:807A2C6A-EE22-470D-ADC7-E0424A337C03',0,'uuid:C1ACF26D-9672-4404-9D70-39B756E62AB4','types','relationship');

INSERT INTO ${prefix}TMODEL (TMODEL_KEY,AUTHORIZED_NAME,PUBLISHER_ID,OPERATOR,NAME,OVERVIEW_URL,LAST_UPDATE)
VALUES ('uuid:327A56F0-3299-4461-BC23-5CD513E95C55','Administrator','admin','jUDDI.org','uddi-org:operators','http://www.uddi.org/taxonomies/UDDI_Taxonomy_tModels.htm#Operators',CURRENT_DATE);

INSERT INTO ${prefix}TMODEL_DESCR (TMODEL_KEY,TMODEL_DESCR_ID,LANG_CODE,DESCR)
VALUES ('uuid:327A56F0-3299-4461-BC23-5CD513E95C55',0,'en','Taxonomy for categorizing the businessEntity of an operator of a registry.');

INSERT INTO ${prefix}TMODEL_DOC_DESCR (TMODEL_KEY,TMODEL_DOC_DESCR_ID,LANG_CODE,DESCR)
VALUES ('uuid:327A56F0-3299-4461-BC23-5CD513E95C55',0,'en','This checked value set is used to identify UDDI operators.');

INSERT INTO ${prefix}TMODEL_CATEGORY (TMODEL_KEY,CATEGORY_ID,TMODEL_KEY_REF,KEY_NAME,KEY_VALUE)
VALUES ('uuid:327A56F0-3299-4461-BC23-5CD513E95C55',0,'uuid:C1ACF26D-9672-4404-9D70-39B756E62AB4','types','categorization');

INSERT INTO ${prefix}TMODEL_CATEGORY (TMODEL_KEY,CATEGORY_ID,TMODEL_KEY_REF,KEY_NAME,KEY_VALUE)
VALUES ('uuid:327A56F0-3299-4461-BC23-5CD513E95C55',1,'uuid:C1ACF26D-9672-4404-9D70-39B756E62AB4','types','checked');

INSERT INTO ${prefix}TMODEL (TMODEL_KEY,AUTHORIZED_NAME,PUBLISHER_ID,OPERATOR,NAME,OVERVIEW_URL,LAST_UPDATE)
VALUES ('uuid:E59AE320-77A5-11D5-B898-0004AC49CC1E','Administrator','admin','jUDDI.org','uddi-org:isReplacedBy','http://www.uddi.org/taxonomies/UDDI_Taxonomy_tModels.htm#IsReplacedBy',CURRENT_DATE);

INSERT INTO ${prefix}TMODEL_DESCR (TMODEL_KEY,TMODEL_DESCR_ID,LANG_CODE,DESCR)
VALUES ('uuid:E59AE320-77A5-11D5-B898-0004AC49CC1E',0,'en','An identifier system used to point (using UDDI keys) to the tModel (or businessEntity) that is the logical replacement for the one in which isReplacedBy is used');

INSERT INTO ${prefix}TMODEL_DOC_DESCR (TMODEL_KEY,TMODEL_DOC_DESCR_ID,LANG_CODE,DESCR)
VALUES ('uuid:E59AE320-77A5-11D5-B898-0004AC49CC1E',0,'en','This is a checked value set.');

INSERT INTO ${prefix}TMODEL_CATEGORY (TMODEL_KEY,CATEGORY_ID,TMODEL_KEY_REF,KEY_NAME,KEY_VALUE)
VALUES ('uuid:E59AE320-77A5-11D5-B898-0004AC49CC1E',0,'uuid:C1ACF26D-9672-4404-9D70-39B756E62AB4','types','identifier');

INSERT INTO ${prefix}TMODEL_CATEGORY (TMODEL_KEY,CATEGORY_ID,TMODEL_KEY_REF,KEY_NAME,KEY_VALUE)
VALUES ('uuid:E59AE320-77A5-11D5-B898-0004AC49CC1E',1,'uuid:C1ACF26D-9672-4404-9D70-39B756E62AB4','types','checked');

INSERT INTO ${prefix}TMODEL (TMODEL_KEY,AUTHORIZED_NAME,PUBLISHER_ID,OPERATOR,NAME,OVERVIEW_URL,LAST_UPDATE)
VALUES ('uuid:8609C81E-EE1F-4D5A-B202-3EB13AD01823','Administrator','admin','jUDDI.org','dnb-com:D-U-N-S','http://www.uddi.org/taxonomies/UDDI_Taxonomy_tModels.htm#D-U-N-S',CURRENT_DATE);

INSERT INTO ${prefix}TMODEL_DESCR (TMODEL_KEY,TMODEL_DESCR_ID,LANG_CODE,DESCR)
VALUES ('uuid:8609C81E-EE1F-4D5A-B202-3EB13AD01823',0,'en','Dun&Bradstreet D-U-N-S� Number');

INSERT INTO ${prefix}TMODEL_DOC_DESCR (TMODEL_KEY,TMODEL_DOC_DESCR_ID,LANG_CODE,DESCR)
VALUES ('uuid:8609C81E-EE1F-4D5A-B202-3EB13AD01823',0,'en','This tModel is used for the Dun&Bradstreet D-U-N-S� Number identifier.');

INSERT INTO ${prefix}TMODEL_CATEGORY (TMODEL_KEY,CATEGORY_ID,TMODEL_KEY_REF,KEY_NAME,KEY_VALUE)
VALUES ('uuid:8609C81E-EE1F-4D5A-B202-3EB13AD01823',0,'uuid:C1ACF26D-9672-4404-9D70-39B756E62AB4','types','identifier');

INSERT INTO ${prefix}TMODEL (TMODEL_KEY,AUTHORIZED_NAME,PUBLISHER_ID,OPERATOR,NAME,OVERVIEW_URL,LAST_UPDATE)
VALUES ('uuid:B1B1BAF5-2329-43E6-AE13-BA8E97195039','Administrator','admin','jUDDI.org','thomasregister-com:supplierID','http://www.uddi.org/taxonomies/UDDI_Taxonomy_tModels.htm#Thomas',CURRENT_DATE);

INSERT INTO ${prefix}TMODEL_DESCR (TMODEL_KEY,TMODEL_DESCR_ID,LANG_CODE,DESCR)
VALUES ('uuid:B1B1BAF5-2329-43E6-AE13-BA8E97195039',0,'en','Thomas Registry Suppliers');

INSERT INTO ${prefix}TMODEL_DOC_DESCR (TMODEL_KEY,TMODEL_DOC_DESCR_ID,LANG_CODE,DESCR)
VALUES ('uuid:B1B1BAF5-2329-43E6-AE13-BA8E97195039',0,'en','This tModel is used for the Thomas Register supplier identifier codes.');

INSERT INTO ${prefix}TMODEL_CATEGORY (TMODEL_KEY,CATEGORY_ID,TMODEL_KEY_REF,KEY_NAME,KEY_VALUE)
VALUES ('uuid:B1B1BAF5-2329-43E6-AE13-BA8E97195039',0,'uuid:C1ACF26D-9672-4404-9D70-39B756E62AB4','types','identifier');


INSERT INTO ${prefix}TMODEL (TMODEL_KEY,AUTHORIZED_NAME,PUBLISHER_ID,OPERATOR,NAME,OVERVIEW_URL,LAST_UPDATE)
VALUES ('uuid:6E090AFA-33E5-36EB-81B7-1CA18373F457','Administrator','admin','jUDDI.org','uddi-org:wsdl:types','http://www.oasis-open.org/committees/uddi-spec/doc/tn/uddi-spec-tc-tn-wsdl-v2.htm#wsdlTypes',CURRENT_DATE);

INSERT INTO ${prefix}TMODEL_DESCR (TMODEL_KEY,TMODEL_DESCR_ID,LANG_CODE,DESCR)
VALUES ('uuid:6E090AFA-33E5-36EB-81B7-1CA18373F457',0,'en','WSDL Type Category System');

INSERT INTO ${prefix}TMODEL_DOC_DESCR (TMODEL_KEY,TMODEL_DOC_DESCR_ID,LANG_CODE,DESCR)
VALUES ('uuid:6E090AFA-33E5-36EB-81B7-1CA18373F457',0,'en','The WSDL Entity Type tModel uses a number of UDDI entities to represent the various entities within a WSDL document.');

INSERT INTO ${prefix}TMODEL_CATEGORY (TMODEL_KEY,CATEGORY_ID,TMODEL_KEY_REF,KEY_NAME,KEY_VALUE)
VALUES ('uuid:6E090AFA-33E5-36EB-81B7-1CA18373F457',0,'uuid:C1ACF26D-9672-4404-9D70-39B756E62AB4','uddi-org:types','unchecked');

INSERT INTO ${prefix}TMODEL_CATEGORY (TMODEL_KEY,CATEGORY_ID,TMODEL_KEY_REF,KEY_NAME,KEY_VALUE)
VALUES ('uuid:6E090AFA-33E5-36EB-81B7-1CA18373F457',1,'uuid:C1ACF26D-9672-4404-9D70-39B756E62AB4','uddi-org:types','categorization');


INSERT INTO ${prefix}TMODEL (TMODEL_KEY,AUTHORIZED_NAME,PUBLISHER_ID,OPERATOR,NAME,OVERVIEW_URL,LAST_UPDATE)
VALUES ('uuid:D01987D1-AB2E-3013-9BE2-2A66EB99D824','Administrator','admin','jUDDI.org','uddi-org:xml:namespace','http://www.oasis-open.org/committees/uddi-spec/doc/tn/uddi-spec-tc-tn-wsdl-v2.htm#xmlNamespace',CURRENT_DATE);

INSERT INTO ${prefix}TMODEL_DESCR (TMODEL_KEY,TMODEL_DESCR_ID,LANG_CODE,DESCR)
VALUES ('uuid:D01987D1-AB2E-3013-9BE2-2A66EB99D824',0,'en','A category system used to indicate namespaces');

INSERT INTO ${prefix}TMODEL_DOC_DESCR (TMODEL_KEY,TMODEL_DOC_DESCR_ID,LANG_CODE,DESCR)
VALUES ('uuid:D01987D1-AB2E-3013-9BE2-2A66EB99D824',0,'en','A namespace provides necessary qualifying information about a technical concept or model. The XML Namespace tModel provides a mechanism to associate a namespace with a UDDI entity.');

INSERT INTO ${prefix}TMODEL_CATEGORY (TMODEL_KEY,CATEGORY_ID,TMODEL_KEY_REF,KEY_NAME,KEY_VALUE)
VALUES ('uuid:D01987D1-AB2E-3013-9BE2-2A66EB99D824',0,'uuid:C1ACF26D-9672-4404-9D70-39B756E62AB4','uddi-org:types','unchecked');

INSERT INTO ${prefix}TMODEL_CATEGORY (TMODEL_KEY,CATEGORY_ID,TMODEL_KEY_REF,KEY_NAME,KEY_VALUE)
VALUES ('uuid:D01987D1-AB2E-3013-9BE2-2A66EB99D824',1,'uuid:C1ACF26D-9672-4404-9D70-39B756E62AB4','uddi-org:types','categorization');


INSERT INTO ${prefix}TMODEL (TMODEL_KEY,AUTHORIZED_NAME,PUBLISHER_ID,OPERATOR,NAME,OVERVIEW_URL,LAST_UPDATE)
VALUES ('uuid:2EC65201-9109-3919-9BEC-C9DBEFCACCF6','Administrator','admin','jUDDI.org','uddi-org:xml:localName','http://www.oasis-open.org/committees/uddi-spec/doc/tn/uddi-spec-tc-tn-wsdl-v2.htm#xmlLocalName',CURRENT_DATE);

INSERT INTO ${prefix}TMODEL_DESCR (TMODEL_KEY,TMODEL_DESCR_ID,LANG_CODE,DESCR)
VALUES ('uuid:2EC65201-9109-3919-9BEC-C9DBEFCACCF6',0,'en','A category system used to indicate XML local names');

INSERT INTO ${prefix}TMODEL_DOC_DESCR (TMODEL_KEY,TMODEL_DOC_DESCR_ID,LANG_CODE,DESCR)
VALUES ('uuid:2EC65201-9109-3919-9BEC-C9DBEFCACCF6',0,'en','The XML Local Name tModel provides a mechanism to indicate the name attribute for the uddi:businessService.');

INSERT INTO ${prefix}TMODEL_CATEGORY (TMODEL_KEY,CATEGORY_ID,TMODEL_KEY_REF,KEY_NAME,KEY_VALUE)
VALUES ('uuid:2EC65201-9109-3919-9BEC-C9DBEFCACCF6',0,'uuid:C1ACF26D-9672-4404-9D70-39B756E62AB4','uddi-org:types','unchecked');

INSERT INTO ${prefix}TMODEL_CATEGORY (TMODEL_KEY,CATEGORY_ID,TMODEL_KEY_REF,KEY_NAME,KEY_VALUE)
VALUES ('uuid:2EC65201-9109-3919-9BEC-C9DBEFCACCF6',1,'uuid:C1ACF26D-9672-4404-9D70-39B756E62AB4','uddi-org:types','categorization');


INSERT INTO ${prefix}TMODEL (TMODEL_KEY,AUTHORIZED_NAME,PUBLISHER_ID,OPERATOR,NAME,OVERVIEW_URL,LAST_UPDATE)
VALUES ('uuid:082B0851-25D8-303C-B332-F24A6D53E38E','Administrator','admin','jUDDI.org','uddi-org:wsdl:portTypeReference','http://www.oasis-open.org/committees/uddi-spec/doc/tn/uddi-spec-tc-tn-wsdl-v2.htm#portTypeReference',CURRENT_DATE);

INSERT INTO ${prefix}TMODEL_DESCR (TMODEL_KEY,TMODEL_DESCR_ID,LANG_CODE,DESCR)
VALUES ('uuid:082B0851-25D8-303C-B332-F24A6D53E38E',0,'en','A category system used to reference a wsdl:portType tModel');

INSERT INTO ${prefix}TMODEL_DOC_DESCR (TMODEL_KEY,TMODEL_DOC_DESCR_ID,LANG_CODE,DESCR)
VALUES ('uuid:082B0851-25D8-303C-B332-F24A6D53E38E',0,'en','The WSDL portType Reference category system provides a mechanism to indicate that a UDDI entity has a relationship with a certain wsdl:portType tModel.');

INSERT INTO ${prefix}TMODEL_CATEGORY (TMODEL_KEY,CATEGORY_ID,TMODEL_KEY_REF,KEY_NAME,KEY_VALUE)
VALUES ('uuid:082B0851-25D8-303C-B332-F24A6D53E38E',0,'uuid:C1ACF26D-9672-4404-9D70-39B756E62AB4','uddi-org:types','checked');

INSERT INTO ${prefix}TMODEL_CATEGORY (TMODEL_KEY,CATEGORY_ID,TMODEL_KEY_REF,KEY_NAME,KEY_VALUE)
VALUES ('uuid:082B0851-25D8-303C-B332-F24A6D53E38E',1,'uuid:C1ACF26D-9672-4404-9D70-39B756E62AB4','uddi-org:types','categorization');


INSERT INTO ${prefix}TMODEL (TMODEL_KEY,AUTHORIZED_NAME,PUBLISHER_ID,OPERATOR,NAME,OVERVIEW_URL,LAST_UPDATE)
VALUES ('uuid:AA254698-93DE-3870-8DF3-A5C075D64A0E','Administrator','admin','jUDDI.org','uddi-org:protocol:soap','http://www.oasis-open.org/committees/uddi-spec/doc/tn/uddi-spec-tc-tn-wsdl-v2.htm#soap',CURRENT_DATE);

INSERT INTO ${prefix}TMODEL_DESCR (TMODEL_KEY,TMODEL_DESCR_ID,LANG_CODE,DESCR)
VALUES ('uuid:AA254698-93DE-3870-8DF3-A5C075D64A0E',0,'en','A tModel that represents the SOAP 1.1 protocol');

INSERT INTO ${prefix}TMODEL_DOC_DESCR (TMODEL_KEY,TMODEL_DOC_DESCR_ID,LANG_CODE,DESCR)
VALUES ('uuid:AA254698-93DE-3870-8DF3-A5C075D64A0E',0,'en','The SOAP Protocol tModel can be used to indicate that a Web service supports the SOAP 1.1 protocol.');

INSERT INTO ${prefix}TMODEL_CATEGORY (TMODEL_KEY,CATEGORY_ID,TMODEL_KEY_REF,KEY_NAME,KEY_VALUE)
VALUES ('uuid:AA254698-93DE-3870-8DF3-A5C075D64A0E',0,'uuid:C1ACF26D-9672-4404-9D70-39B756E62AB4','uddi-org:types','protocol');


INSERT INTO ${prefix}TMODEL (TMODEL_KEY,AUTHORIZED_NAME,PUBLISHER_ID,OPERATOR,NAME,OVERVIEW_URL,LAST_UPDATE)
VALUES ('uuid:6E10B91B-BABC-3442-B8FC-5A3C8FDE0794','Administrator','admin','jUDDI.org','uddi-org:protocol:http','http://www.oasis-open.org/committees/uddi-spec/doc/tn/uddi-spec-tc-tn-wsdl-v2.htm#http',CURRENT_DATE);

INSERT INTO ${prefix}TMODEL_DESCR (TMODEL_KEY,TMODEL_DESCR_ID,LANG_CODE,DESCR)
VALUES ('uuid:6E10B91B-BABC-3442-B8FC-5A3C8FDE0794',0,'en','A tModel that represents the HTTP protocol');

INSERT INTO ${prefix}TMODEL_DOC_DESCR (TMODEL_KEY,TMODEL_DOC_DESCR_ID,LANG_CODE,DESCR)
VALUES ('uuid:6E10B91B-BABC-3442-B8FC-5A3C8FDE0794',0,'en','The HTTP Protocol tModel can be used to indicate that a Web service supports the HTTP protocol.');

INSERT INTO ${prefix}TMODEL_CATEGORY (TMODEL_KEY,CATEGORY_ID,TMODEL_KEY_REF,KEY_NAME,KEY_VALUE)
VALUES ('uuid:6E10B91B-BABC-3442-B8FC-5A3C8FDE0794',0,'uuid:C1ACF26D-9672-4404-9D70-39B756E62AB4','uddi-org:types','protocol');


INSERT INTO ${prefix}TMODEL (TMODEL_KEY,AUTHORIZED_NAME,PUBLISHER_ID,OPERATOR,NAME,OVERVIEW_URL,LAST_UPDATE)
VALUES ('uuid:4DC74177-7806-34D9-AECD-33C57DC3A865','Administrator','admin','jUDDI.org','uddi-org:wsdl:categorization:protocol','http://www.oasis-open.org/committees/uddi-spec/doc/tn/uddi-spec-tc-tn-wsdl-v2.htm#protocol',CURRENT_DATE);

INSERT INTO ${prefix}TMODEL_DESCR (TMODEL_KEY,TMODEL_DESCR_ID,LANG_CODE,DESCR)
VALUES ('uuid:4DC74177-7806-34D9-AECD-33C57DC3A865',0,'en','Category system used to describe the protocol supported by a wsdl:binding.');

INSERT INTO ${prefix}TMODEL_DOC_DESCR (TMODEL_KEY,TMODEL_DOC_DESCR_ID,LANG_CODE,DESCR)
VALUES ('uuid:4DC74177-7806-34D9-AECD-33C57DC3A865',0,'en','The Protocol Categorization tModel provides a mechanism to capture this protocol information in the UDDI binding tModel.');

INSERT INTO ${prefix}TMODEL_CATEGORY (TMODEL_KEY,CATEGORY_ID,TMODEL_KEY_REF,KEY_NAME,KEY_VALUE)
VALUES ('uuid:4DC74177-7806-34D9-AECD-33C57DC3A865',0,'uuid:C1ACF26D-9672-4404-9D70-39B756E62AB4','uddi-org:types','categorization');

INSERT INTO ${prefix}TMODEL_CATEGORY (TMODEL_KEY,CATEGORY_ID,TMODEL_KEY_REF,KEY_NAME,KEY_VALUE)
VALUES ('uuid:4DC74177-7806-34D9-AECD-33C57DC3A865',1,'uuid:C1ACF26D-9672-4404-9D70-39B756E62AB4','uddi-org:types','checked');


INSERT INTO ${prefix}TMODEL (TMODEL_KEY,AUTHORIZED_NAME,PUBLISHER_ID,OPERATOR,NAME,OVERVIEW_URL,LAST_UPDATE)
VALUES ('uuid:E5C43936-86E4-37BF-8196-1D04B35C0099','Administrator','admin','jUDDI.org','uddi-org:wsdl:categorization:transport','http://www.oasis-open.org/committees/uddi-spec/doc/tn/uddi-spec-tc-tn-wsdl-v2.htm#transport',CURRENT_DATE);

INSERT INTO ${prefix}TMODEL_DESCR (TMODEL_KEY,TMODEL_DESCR_ID,LANG_CODE,DESCR)
VALUES ('uuid:E5C43936-86E4-37BF-8196-1D04B35C0099',0,'en','Category system used to describe the transport supported by a wsdl:binding.');

INSERT INTO ${prefix}TMODEL_DOC_DESCR (TMODEL_KEY,TMODEL_DOC_DESCR_ID,LANG_CODE,DESCR)
VALUES ('uuid:E5C43936-86E4-37BF-8196-1D04B35C0099',0,'en','The Transport Categorization tModel provides a mechanism to capture transport information in the UDDI binding tModel which allows a user to search for bindings that implement a specific transport protocol.');

INSERT INTO ${prefix}TMODEL_CATEGORY (TMODEL_KEY,CATEGORY_ID,TMODEL_KEY_REF,KEY_NAME,KEY_VALUE)
VALUES ('uuid:E5C43936-86E4-37BF-8196-1D04B35C0099',0,'uuid:C1ACF26D-9672-4404-9D70-39B756E62AB4','uddi-org:types','categorization');

INSERT INTO ${prefix}TMODEL_CATEGORY (TMODEL_KEY,CATEGORY_ID,TMODEL_KEY_REF,KEY_NAME,KEY_VALUE)
VALUES ('uuid:E5C43936-86E4-37BF-8196-1D04B35C0099',1,'uuid:C1ACF26D-9672-4404-9D70-39B756E62AB4','uddi-org:types','checked');


INSERT INTO ${prefix}TMODEL (TMODEL_KEY,AUTHORIZED_NAME,PUBLISHER_ID,OPERATOR,NAME,OVERVIEW_URL,LAST_UPDATE)
VALUES ('uuid:AD61DE98-4DB8-31B2-A299-A2373DC97212','Administrator','admin','jUDDI.org','uddi-org:wsdl:address','http://www.oasis-open.org/committees/uddi-spec/doc/tn/uddi-spec-tc-tn-wsdl-v2.htm#Address',CURRENT_DATE);

INSERT INTO ${prefix}TMODEL_DESCR (TMODEL_KEY,TMODEL_DESCR_ID,LANG_CODE,DESCR)
VALUES ('uuid:AD61DE98-4DB8-31B2-A299-A2373DC97212',0,'en','A tModel used to indicate the WSDL address option.');

INSERT INTO ${prefix}TMODEL_DOC_DESCR (TMODEL_KEY,TMODEL_DOC_DESCR_ID,LANG_CODE,DESCR)
VALUES ('uuid:AD61DE98-4DB8-31B2-A299-A2373DC97212',0,'en','The WSDL Address tModel provides A mechanism to indicate that the endpoint address should be obtained from a WSDL document.');

-- ** http transport **
INSERT INTO ${prefix}TMODEL (TMODEL_KEY,AUTHORIZED_NAME,PUBLISHER_ID,OPERATOR,NAME,OVERVIEW_URL,LAST_UPDATE)
VALUES ('uuid:68DE9E80-AD09-469D-8A37-088422BFBC36','Administrator','admin','jUDDI.org','uddi-org:http','http://www.uddi.org/taxonomies/UDDI_CoreOther_tModels.htm#overHTTP',CURRENT_DATE);
INSERT INTO ${prefix}TMODEL_DESCR (TMODEL_KEY,TMODEL_DESCR_ID,LANG_CODE,DESCR)
VALUES ('uuid:68DE9E80-AD09-469D-8A37-088422BFBC36',0,'en','An HTTP or web browser-based web service');
INSERT INTO ${prefix}TMODEL_CATEGORY (TMODEL_KEY,CATEGORY_ID,TMODEL_KEY_REF,KEY_NAME,KEY_VALUE)
VALUES ('uuid:68DE9E80-AD09-469D-8A37-088422BFBC36',0,'uuid:C1ACF26D-9672-4404-9D70-39B756E62AB4','tModelType','transport');

-- ** uddi inquiry **
INSERT INTO ${prefix}TMODEL (TMODEL_KEY,AUTHORIZED_NAME,PUBLISHER_ID,OPERATOR,NAME,OVERVIEW_URL,LAST_UPDATE)
VALUES ('uuid:AC104DCC-D623-452F-88A7-F8ACD94D9B2B','Administrator','admin','jUDDI.org','uddi-org:inquiry_v2','http://www.uddi.org/wsdl/inquire_v2.wsdl',CURRENT_DATE);
INSERT INTO ${prefix}TMODEL_DESCR (TMODEL_KEY,TMODEL_DESCR_ID,LANG_CODE,DESCR)
VALUES ('uuid:AC104DCC-D623-452F-88A7-F8ACD94D9B2B',0,'en','UDDI Inquiry API Version 2 - Core Specification');
INSERT INTO ${prefix}TMODEL_DOC_DESCR (TMODEL_KEY,TMODEL_DOC_DESCR_ID,LANG_CODE,DESCR)
VALUES ('uuid:AC104DCC-D623-452F-88A7-F8ACD94D9B2B',0,'en','This tModel defines the inquiry API calls for interacting with a V2 UDDI node.');
INSERT INTO ${prefix}TMODEL_CATEGORY (TMODEL_KEY,CATEGORY_ID,TMODEL_KEY_REF,KEY_NAME,KEY_VALUE)
VALUES ('uuid:AC104DCC-D623-452F-88A7-F8ACD94D9B2B',0,'uuid:C1ACF26D-9672-4404-9D70-39B756E62AB4','types','specification');
INSERT INTO ${prefix}TMODEL_CATEGORY (TMODEL_KEY,CATEGORY_ID,TMODEL_KEY_REF,KEY_NAME,KEY_VALUE)
VALUES ('uuid:AC104DCC-D623-452F-88A7-F8ACD94D9B2B',1,'uuid:C1ACF26D-9672-4404-9D70-39B756E62AB4','types','xmlSpec');
INSERT INTO ${prefix}TMODEL_CATEGORY (TMODEL_KEY,CATEGORY_ID,TMODEL_KEY_REF,KEY_NAME,KEY_VALUE)
VALUES ('uuid:AC104DCC-D623-452F-88A7-F8ACD94D9B2B',2,'uuid:C1ACF26D-9672-4404-9D70-39B756E62AB4','types','soapSpec');
INSERT INTO ${prefix}TMODEL_CATEGORY (TMODEL_KEY,CATEGORY_ID,TMODEL_KEY_REF,KEY_NAME,KEY_VALUE)
VALUES ('uuid:AC104DCC-D623-452F-88A7-F8ACD94D9B2B',3,'uuid:C1ACF26D-9672-4404-9D70-39B756E62AB4','types','wsdlSpec');
