-- David Hurtgen, Final Project DB and Report Queries

CREATE DATABASE hungary_waters2;

USE hungary_waters2;

CREATE TABLE VENDOR (
	VEND_ID			VARCHAR(10)		NOT NULL,
    VEND_NAME		VARCHAR(25)		NOT NULL,
    VEND_STREET		VARCHAR(25)		NOT NULL,
    VEND_CITY		VARCHAR(25)		NOT NULL,
    VEND_STATE		CHAR(2)			NOT NULL,
    VEND_ZIP		CHAR(5)			NOT NULL,
    PRIMARY KEY (VEND_ID));
    
CREATE TABLE MANUFACTURER (
	MAN_ID			VARCHAR(10)		NOT NULL,
    MAN_NAME		VARCHAR(25)		NOT NULL,
    PRIMARY KEY (MAN_ID));
    
CREATE TABLE VEN_MAN_REL (
	VM_REL_ID		VARCHAR(10)		NOT NULL,
	VEND_ID			VARCHAR(10)		NOT NULL,
    MAN_ID			VARCHAR(10)		NOT NULL,
    PRIMARY KEY (VM_REL_ID),
    FOREIGN KEY (VEND_ID) REFERENCES VENDOR (VEND_ID),
    FOREIGN KEY (MAN_ID) REFERENCES MANUFACTURER (MAN_ID));
    
CREATE TABLE PRODUCT (
	PROD_ID       	VARCHAR(10)		NOT NULL,
	PROD_NAME     	VARCHAR(50)		NOT NULL,
	PROD_DESC     	VARCHAR(25)		NOT NULL,
	PROD_PRICE		DECIMAL(6, 2)	NOT NULL,
	PROD_QOH		SMALLINT		NOT NULL,
	VM_REL_ID		VARCHAR(10)		NOT NULL,
	PRIMARY KEY (PROD_ID),
	FOREIGN KEY (VM_REL_ID) REFERENCES VEN_MAN_REL(VM_REL_ID));
    
CREATE TABLE MEMBERS (
	MEM_ID			VARCHAR(10)		NOT NULL,
    MEM_LNAME		VARCHAR(25)		NOT NULL,
    MEM_FNAME		VARCHAR(25)		NOT NULL,
    MEM_STREET		VARCHAR(25)		NOT NULL,
    MEM_CITY		VARCHAR(25)		NOT NULL,
    MEM_STATE		CHAR(2)			NOT NULL,
    MEM_ZIP			CHAR(5)			NOT NULL,
    MEM_JOIN_DATE	DATE			NOT NULL,
    PRIMARY KEY (MEM_ID));
    
CREATE TABLE ORDERS (
	ORDER_ID		VARCHAR(10)		NOT NULL,
    MEM_ID			VARCHAR(10)		NOT NULL,
    ORDER_DATE		DATE			NOT NULL,
    BAL_DUE			DECIMAL(6, 2)	NOT NULL,
    BAL_PAID		DECIMAL(6, 2)	NOT NULL,
    BAL_OWED		DECIMAL(6, 2)	NOT NULL,
    PRIMARY KEY (ORDER_ID),
    FOREIGN KEY (MEM_ID) REFERENCES MEMBERS (MEM_ID));
    
CREATE TABLE ORDER_LINE (
	OL_ID			VARCHAR(10)		NOT NULL,
    ORDER_ID		VARCHAR(10)		NOT NULL,
    PROD_ID			VARCHAR(10)		NOT NULL,
    PROD_PRICE		DECIMAL(6, 2)	NOT NULL,
    PROD_QTY		SMALLINT		NOT NULL,
    PRIMARY KEY (OL_ID),
    FOREIGN KEY (ORDER_ID) REFERENCES ORDERS (ORDER_ID),
    FOREIGN KEY (PROD_ID) REFERENCES PRODUCT (PROD_ID));
    
INSERT INTO MEMBERS VALUES('MEM101','Owens','Edna','8156 Hamilton Ave','Roseburg','MD','80408','2015-08-23');
INSERT INTO MEMBERS VALUES('MEM102','Mason','Jeffrey','1359 McClellan Rd','Fullerton','AK','91163','2021-11-04');
INSERT INTO MEMBERS VALUES('MEM103','Bennett','Greg','7931 E North St','Vernon','WY','30863','2007-02-27');
INSERT INTO MEMBERS VALUES('MEM104','Simmons','Miguel','7585 Timber Wolf Trail','Temecula','WA','18335','2015-09-21');
INSERT INTO MEMBERS VALUES('MEM105','Gray','Dale','1946 Blossom Hill Rd','Santa Clarita','NV','43947','2016-08-12');
INSERT INTO MEMBERS VALUES('MEM106','McCoy','Edward','3124 Hamilton Ave','Oceanside','OH','84454','2002-11-29');
INSERT INTO MEMBERS VALUES('MEM107','Morgan','Scott','9028 Cherry St','Manchester','GA','74793','2021-09-27');
INSERT INTO MEMBERS VALUES('MEM108','Cole','Terry','7201 Elgin St','Nashville','AZ','98732','2002-03-23');
INSERT INTO MEMBERS VALUES('MEM109','Caldwell','Sam','9121 Wheeler Ridge Dr','Durham','NV','65586','2002-06-12');
INSERT INTO MEMBERS VALUES('MEM110','Roberts','Dolores','2079 Hunters Creek Dr','Brownsville','AR','16434','2003-09-27');

INSERT INTO VENDOR VALUES('VEN101', 'Faire', '100 Potrero Ave','San Francisco','CA','94103');
INSERT INTO VENDOR VALUES('VEN102', 'J&M Golf, Inc.', '319 Industrial Dr','Griffith','IN','46319');
INSERT INTO VENDOR VALUES('VEN103', 'TGW', '8851 E 34th St North','Wichita','KS','67226');

INSERT INTO MANUFACTURER VALUES('MAN101', 'Titleist');
INSERT INTO MANUFACTURER VALUES('MAN102', 'Wilson');
INSERT INTO MANUFACTURER VALUES('MAN103', 'Adidas');
INSERT INTO MANUFACTURER VALUES('MAN104', 'PGA Tour Apparel');
INSERT INTO MANUFACTURER VALUES('MAN105', 'Nike');

INSERT INTO VEN_MAN_REL VALUES('VMR101','VEN101','MAN101');
INSERT INTO VEN_MAN_REL VALUES('VMR102','VEN101','MAN102');
INSERT INTO VEN_MAN_REL VALUES('VMR103','VEN102','MAN103');
INSERT INTO VEN_MAN_REL VALUES('VMR104','VEN102','MAN104');
INSERT INTO VEN_MAN_REL VALUES('VMR105','VEN103','MAN105');

INSERT INTO PRODUCT VALUES('PRD101','Pro V1 Special Play Number Golf Balls','Golf Balls',49.99,40,'VMR101');
INSERT INTO PRODUCT VALUES('PRD102','Velocity 2022 Golf Balls','Golf Balls',29.99,32,'VMR101');
INSERT INTO PRODUCT VALUES('PRD103','DUO Professional Matte Green Golf Balls','Golf Balls',32.99,56,'VMR102');
INSERT INTO PRODUCT VALUES('PRD104','Triad Golf Balls','Golf Balls',39.99,27,'VMR102');
INSERT INTO PRODUCT VALUES('PRD105','Long Sleeve Polo Shirt','Men\'s Polo Shirt',48.75,36,'VMR103');
INSERT INTO PRODUCT VALUES('PRD106','Feeder Strip Short Sleeve Golf Polo Shirt','Men\'s Polo Shirt',24.99,41,'VMR104');
INSERT INTO PRODUCT VALUES('PRD107','Live Under Par Solid Crew Neck Shirt','Men\'s T-Shirt',24.99,33,'VMR104');
INSERT INTO PRODUCT VALUES('PRD108','Dri-FIT Victory Golf Polo','Men\'s Polo Shirt',55.00,21,'VMR105');

INSERT INTO ORDERS VALUES('ORD101','MEM101','2022-03-15',0,100.00,0);
INSERT INTO ORDERS VALUES('ORD102','MEM103','2022-05-21',0,109.98,0);
INSERT INTO ORDERS VALUES('ORD103','MEM106','2022-05-23',0,75.00,0);
INSERT INTO ORDERS VALUES('ORD104','MEM103','2022-06-10',0,79.97,0);
INSERT INTO ORDERS VALUES('ORD105','MEM109','2022-07-17',0,179.24,0);
INSERT INTO ORDERS VALUES('ORD106','MEM106','2022-07-28',0,80.00,0);
INSERT INTO ORDERS VALUES('ORD107','MEM110','2022-08-13',0,49.99,0.00);
INSERT INTO ORDERS VALUES('ORD108','MEM102','2022-08-17',0,50.00,0);

INSERT INTO ORDER_LINE VALUES('OL101','ORD101','PRD101',49.99,2);
INSERT INTO ORDER_LINE VALUES('OL102','ORD101','PRD105',48.75,1);
INSERT INTO ORDER_LINE VALUES('OL103','ORD102','PRD102',29.99,1);
INSERT INTO ORDER_LINE VALUES('OL104','ORD102','PRD107',24.99,1);
INSERT INTO ORDER_LINE VALUES('OL105','ORD102','PRD108',55.00,1);
INSERT INTO ORDER_LINE VALUES('OL106','ORD103','PRD101',49.99,1);
INSERT INTO ORDER_LINE VALUES('OL107','ORD103','PRD104',39.99,1);
INSERT INTO ORDER_LINE VALUES('OL108','ORD103','PRD106',24.99,1);
INSERT INTO ORDER_LINE VALUES('OL109','ORD104','PRD102',29.99,1);
INSERT INTO ORDER_LINE VALUES('OL110','ORD104','PRD107',24.99,2);
INSERT INTO ORDER_LINE VALUES('OL111','ORD105','PRD103',32.99,1);
INSERT INTO ORDER_LINE VALUES('OL112','ORD105','PRD105',48.75,3);
INSERT INTO ORDER_LINE VALUES('OL113','ORD106','PRD104',39.99,2);
INSERT INTO ORDER_LINE VALUES('OL114','ORD106','PRD108',55.00,1);
INSERT INTO ORDER_LINE VALUES('OL115','ORD107','PRD101',49.99,1);
INSERT INTO ORDER_LINE VALUES('OL116','ORD108','PRD106',24.99,1);
INSERT INTO ORDER_LINE VALUES('OL117','ORD108','PRD107',24.99,1);
INSERT INTO ORDER_LINE VALUES('OL118','ORD108','PRD108',55.00,1);

-- Determine BAL_DUE from ORDER_LINE
UPDATE ORDERS
SET BAL_DUE = 
	(SELECT SUM(PROD_PRICE * PROD_QTY) FROM ORDER_LINE 
    GROUP BY ORDER_ID HAVING ORDER_LINE.ORDER_ID = ORDERS.ORDER_ID);

-- Determined BAL_OWED from BAL_DUE and BAL_PAID
UPDATE ORDERS
SET BAL_OWED = 
	BAL_DUE - BAL_PAID;

-- First Report
SELECT VEND_NAME, PROD_ID, PROD_PRICE, PROD_QOH
FROM PRODUCT
LEFT OUTER JOIN VEN_MAN_REL ON PRODUCT.VM_REL_ID = VEN_MAN_REL.VM_REL_ID
LEFT OUTER JOIN VENDOR ON VEN_MAN_REL.VEND_ID = VENDOR.VEND_ID
ORDER BY VEND_NAME;

-- Second Report
SELECT MEM_LNAME, MEM_FNAME, MEM_STREET, MEM_CITY, MEM_STATE, MEM_ZIP, ROUND(DATEDIFF(SYSDATE(), MEM_JOIN_DATE) / 365, 2) AS YRS_MEM
FROM MEMBERS;

-- Third Report
SELECT MEM_LNAME, MEM_FNAME, MEM_STREET, MEM_CITY, MEM_STATE, MEM_ZIP, ROUND(DATEDIFF(SYSDATE(), MEM_JOIN_DATE) / 365, 2) AS YRS_MEM
FROM MEMBERS
WHERE ROUND(DATEDIFF(SYSDATE(), MEM_JOIN_DATE) / 365, 2) > 10
ORDER BY MEM_LNAME;

-- Fourth Report
SELECT MAN_NAME, PROD_NAME, PROD_PRICE, PROD_QOH
FROM PRODUCT
LEFT JOIN VEN_MAN_REL ON PRODUCT.VM_REL_ID = VEN_MAN_REL.VM_REL_ID
LEFT JOIN MANUFACTURER ON VEN_MAN_REL.MAN_ID = MANUFACTURER.MAN_ID
WHERE LOWER(PROD_DESC) LIKE '%ball%'
ORDER BY MAN_NAME;

-- Fifth Report
SELECT MEM_LNAME, MEM_FNAME, SUM(BAL_OWED) AS TOT_BAL
FROM MEMBERS
LEFT JOIN ORDERS ON MEMBERS.MEM_ID = ORDERS.MEM_ID
GROUP BY MEM_LNAME
HAVING TOT_BAL > 0;

-- Sixth Report
SELECT * FROM VENDOR
ORDER BY VEND_STATE;
