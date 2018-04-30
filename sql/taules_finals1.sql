
--------------------------------------------------------
--  table countries
--------------------------------------------------------
drop table COUNTRIES;
CREATE TABLE PROJECT.COUNTRIES 
   (	
    ID_COUNTRY CHAR(4) NOT NULL, 
    COUNTRY_NAME VARCHAR(50)not null, 
    TOTAL FLOAT(8,3) DEFAULT 0 not null,
	PRIMARY KEY (ID_COUNTRY)
   );
   
      DESC COUNTRIES;

   
 insert into countries (ID_COUNTRY, COUNTRY_NAME) VALUES
   ('AND', 'Andorra');
   insert into countries (ID_COUNTRY, COUNTRY_NAME) VALUES
   ('CAT', 'Catalonia');
   insert into countries (ID_COUNTRY, COUNTRY_NAME) VALUES
   ('SPA', 'Spain');
   insert into countries (ID_COUNTRY, COUNTRY_NAME) VALUES
   ('USA', 'United States America');
   insert into countries (ID_COUNTRY, COUNTRY_NAME) VALUES
   ('UK', 'United Kingdom');
   insert into countries (ID_COUNTRY, COUNTRY_NAME) VALUES
   ('GER', 'Germany');
   insert into countries (ID_COUNTRY, COUNTRY_NAME) VALUES
   ('FRA', 'France');
   insert into countries (ID_COUNTRY, COUNTRY_NAME) VALUES
   ('JAP', 'Japan');
   insert into countries (ID_COUNTRY, COUNTRY_NAME) VALUES
   ('RUS', 'Russia');
   insert into countries (ID_COUNTRY, COUNTRY_NAME) VALUES
   ('ISR', 'Israel');
   
   SELECT * FROM COUNTRIES;
   SHOW TABLES;
   
--------------------------------------------------------
--  table info_history, sub-table of university to keep a back-up of changes
--------------------------------------------------------
DROP TABLE INFO_HISTORY;

CREATE TABLE INFO_HISTORY 
   (ID_HISTORY TINYINT(4) NOT NULL AUTO_INCREMENT,
	UNI_NAME VARCHAR(50), 
	INDEX1 INT(8) DEFAULT 0,  
	YEAR_DATA YEAR(4),
    PRIMARY KEY (ID_HISTORY)
  );


--------------------------------------------------------
--  table universities, sub-table of education.
--------------------------------------------------------

DROP TABLE UNIVERSITY;
  CREATE TABLE UNIVERSITY 
   (
  ID_UNI TINYINT(4) NOT NULL AUTO_INCREMENT,
	UNI_NAME VARCHAR(50), 
	INDEX1 INT(8) DEFAULT 0,
	INDEX2 INT(8) DEFAULT 0, 
	YEAR_DATA YEAR(4),
    ID_COUNTRY CHAR(4),
    TOTAL FLOAT (8,2)DEFAULT 0,
       PRIMARY KEY (ID_UNI),
       FOREIGN KEY (ID_COUNTRY) REFERENCES COUNTRIES(ID_COUNTRY),
       CONSTRAINT UNIVERSITY_U UNIQUE (UNI_NAME, YEAR_DATA)
  );
  
  DESC UNIVERSITY;
  
   
   insert into UNIVERSITY (UNI_NAME, INDEX1,INDEX2, YEAR_DATA, ID_COUNTRY) VALUES
   ('UPC', 3,4,2002, 'CAT');
   insert into UNIVERSITY (UNI_NAME, INDEX1,INDEX2, YEAR_DATA, ID_COUNTRY) VALUES
   ('UM', 2,6,2002, 'SPA');
   insert into UNIVERSITY (UNI_NAME, INDEX1,INDEX2, YEAR_DATA, ID_COUNTRY) VALUES
   ('ANDORRA UNI.', 1,6,2002, 'AND');
   insert into UNIVERSITY (UNI_NAME, INDEX1,INDEX2, YEAR_DATA, ID_COUNTRY) VALUES
   ('UB', 3,6,2002, 'CAT');
   insert into UNIVERSITY (UNI_NAME, INDEX1,INDEX2, YEAR_DATA, ID_COUNTRY) VALUES
   ('UPC', 2,7,2003, 'CAT');
   insert into UNIVERSITY (UNI_NAME, INDEX1,INDEX2, YEAR_DATA, ID_COUNTRY) VALUES
   ('UM', 1,8,2003, 'SPA');
   insert into UNIVERSITY (UNI_NAME, INDEX1,INDEX2, YEAR_DATA, ID_COUNTRY) VALUES
   ('ANDORRA UNI.', 0,2,2003, 'AND');
   insert into UNIVERSITY (UNI_NAME, INDEX1,INDEX2, YEAR_DATA, ID_COUNTRY) VALUES
   ('UB', 1,5,2003, 'CAT');
   
   insert into UNIVERSITY (UNI_NAME, INDEX1,INDEX2, YEAR_DATA, ID_COUNTRY) VALUES
   ('COLUMBIA', 0.2,5,2003, 'USA');
   insert into UNIVERSITY (UNI_NAME, INDEX1,INDEX2, YEAR_DATA, ID_COUNTRY) VALUES
   ('HARVARD', 2.2,5,2003, 'UK');
   insert into UNIVERSITY (UNI_NAME, INDEX1,INDEX2, YEAR_DATA, ID_COUNTRY) VALUES
   ('UNI. PARIS', 0.2,3,2003, 'FRA');
   insert into UNIVERSITY (UNI_NAME, INDEX1,INDEX2, YEAR_DATA, ID_COUNTRY) VALUES
   ('TOKIO UNI.', 1.11,6,2003, 'JAP');
   
   insert into UNIVERSITY (UNI_NAME, INDEX1,INDEX2, YEAR_DATA, ID_COUNTRY) VALUES
   ('COLUMBIA', 0.9,9,2002, 'USA');
   insert into UNIVERSITY (UNI_NAME, INDEX1,INDEX2, YEAR_DATA, ID_COUNTRY) VALUES
   ('HARVARD', 2.9,0,2002, 'UK');
   insert into UNIVERSITY (UNI_NAME, INDEX1,INDEX2, YEAR_DATA, ID_COUNTRY) VALUES
   ('UNI. PARIS', 0.9,3,2002, 'FRA');
   insert into UNIVERSITY (UNI_NAME, INDEX1,INDEX2, YEAR_DATA, ID_COUNTRY) VALUES
   ('TOKIO UNI.', 1.9,2,2002, 'JAP');
   
   insert into UNIVERSITY (UNI_NAME, INDEX1,INDEX2, YEAR_DATA, ID_COUNTRY) VALUES
   ('UNI. JERUSALEM', 0.2,2,2003, 'ISR');
   insert into UNIVERSITY (UNI_NAME, INDEX1,INDEX2, YEAR_DATA, ID_COUNTRY) VALUES
   ('FREE UNI. BERLIN', 2.2,1,2003, 'GER');
   insert into UNIVERSITY (UNI_NAME, INDEX1,INDEX2, YEAR_DATA, ID_COUNTRY) VALUES
   ('TECH. MOSCOU', 0.2,0,2003, 'RUS');
    insert into UNIVERSITY (UNI_NAME, INDEX1,INDEX2, YEAR_DATA, ID_COUNTRY) VALUES
   ('UNI. JERUSALEM', 0.1,0,2002, 'ISR');
   insert into UNIVERSITY (UNI_NAME, INDEX1,INDEX2, YEAR_DATA, ID_COUNTRY) VALUES
   ('FREE UNI. BERLIN', 2.9,3,2002, 'GER');
   insert into UNIVERSITY (UNI_NAME, INDEX1,INDEX2, YEAR_DATA, ID_COUNTRY) VALUES
   ('TECH. MOSCOU', 2.2,0,2002, 'RUS');
   insert into UNIVERSITY (UNI_NAME, INDEX1,INDEX2, YEAR_DATA, ID_COUNTRY) VALUES
   ('CAMBRIDGE.', 1.11,9,2003, 'UK');
   insert into UNIVERSITY (UNI_NAME, INDEX1,INDEX2, YEAR_DATA, ID_COUNTRY) VALUES
   ('CAMBRIDGE.', 3,8,2002, 'UK');
   
      
   SELECT * FROM UNIVERSITY;
   SHOW TABLES;
  
--------------------------------------------------------
--  Information on table university
--------------------------------------------------------

COMMENT ON TABLE UNIVERSITY  IS 'Table that stores ratings information of the universitites and renders a total rating which is an index compensate average. The compensations are index1 0.X%, index2 0.X%,index3 0.X%. If a univerity name is deleted or altered a trigger will launch a copy of the old information.
Contains a simple primary key: ID_UNI. References with EDUCATION and INF_HISTORY TABLES';

--------------------------------------------------------
--  Constraints and information for columns in table universities
--------------------------------------------------------

THERE IS A UNIQUE CONSTRAIN AND A TRIGGER IN THIS TABLE

DROP PROCEDURE IF EXISTS pr_update_total_university;

DELIMITER //

CREATE PROCEDURE pr_update_total_university()
BEGIN
	DECLARE cu_id_uni INT(10);
	DECLARE cu_index1 Float(10,2);
    DECLARE cu_index2 Float(10,2);
    DECLARE cu_total Float(10,2);
    
	DECLARE findebucle INTEGER DEFAULT 1;
		
	DECLARE Cursor_total CURSOR FOR SELECT ID_UNI, INDEX1, INDEX2 FROM UNIVERSITY;
    
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET findebucle = 0;

	
	OPEN Cursor_total;
	WHILE findebucle DO
    
		FETCH Cursor_total INTO cu_id_uni, cu_index1, cu_index2;
        
		UPDATE UNIVERSITY SET TOTAL= cu_index1 + cu_index2 WHERE ID_UNI = cu_id_uni;
        
        
	END WHILE;
    
	CLOSE Cursor_total;
END
// 

DELIMITER ;

-- call pr_update_total_university();	

DELIMITER //
DROP TRIGGER IF EXISTS PROJECT.FER_TOTAL //

create TRIGGER project.FER_TOTAL
AFTER insert on 'UNIVERSITY'
FOR EACH ROW
BEGIN
        set new.TOTAL = new.INDEX1+new.INDEX2;
        
END FER_TOTAL;
//
DELIMITER ;



--------------------------------------------------------
--  table EDUCATION
--------------------------------------------------------
DROP TABLE EDUCATION;
  CREATE TABLE EDUCATION 
   (
	ID_EDU TINYINT(4) NOT NULL AUTO_INCREMENT,
    YEAR_DATA YEAR(4), 
	DROP_OUT_PC FLOAT(8,2)DEFAULT 0 COMMENT 'pc stands for X per cent', 
	PISA INT (8)DEFAULT 0, 
	TOTAL_UNIV FLOAT (8,2),
    ID_COUNTRY CHAR(4),
	EDU_COEFICIENT FLOAT(6,2)DEFAULT 0,
       primary key (ID_EDU),
       FOREIGN KEY (ID_COUNTRY) REFERENCES COUNTRIES(ID_COUNTRY),
       CONSTRAINT COUNTRY_U UNIQUE (ID_COUNTRY, YEAR_DATA)
   ) ;
   
  
-------------------------------
   
   DESC EDUCATION;
   
   INSERT INTO EDUCATION (YEAR_DATA, DROP_OUT_PC, PISA,ID_COUNTRY)  VALUES (2002, 8, 64, 'AND' );
   
   INSERT INTO EDUCATION (YEAR_DATA, DROP_OUT_PC, PISA,ID_COUNTRY)  VALUES (2003, 2, 67, 'AND' );
   
   INSERT INTO EDUCATION (YEAR_DATA, DROP_OUT_PC, PISA,ID_COUNTRY)  VALUES (2002, 5, 11,'CAT' );
   
   INSERT INTO EDUCATION (YEAR_DATA, DROP_OUT_PC, PISA,ID_COUNTRY)  VALUES (2003, 7, 11, 'CAT' );
   
   INSERT INTO EDUCATION (YEAR_DATA, DROP_OUT_PC, PISA,ID_COUNTRY)  VALUES (2002, 15, 55, 'FRA' );
   
   INSERT INTO EDUCATION (YEAR_DATA, DROP_OUT_PC, PISA,ID_COUNTRY)  VALUES (2003, 15, 45,'FRA' );
 
 
   INSERT INTO EDUCATION (YEAR_DATA, DROP_OUT_PC, PISA,ID_COUNTRY)  VALUES (2002, 10, 4, 'GER' );
   
   INSERT INTO EDUCATION (YEAR_DATA, DROP_OUT_PC, PISA,ID_COUNTRY)  VALUES (2003, 9, 6, 'GER' );
   
   INSERT INTO EDUCATION (YEAR_DATA, DROP_OUT_PC, PISA,ID_COUNTRY)  VALUES (2002, 5, 1,'ISR' );
   
   INSERT INTO EDUCATION (YEAR_DATA, DROP_OUT_PC, PISA,ID_COUNTRY)  VALUES (2003, 7, 1, 'ISR' );
   
   INSERT INTO EDUCATION (YEAR_DATA, DROP_OUT_PC, PISA,ID_COUNTRY)  VALUES (2002, 2, 5, 'JAP' );
   
   INSERT INTO EDUCATION (YEAR_DATA, DROP_OUT_PC, PISA,ID_COUNTRY)  VALUES (2003, 2, 5,'JAP' );
   
   
   INSERT INTO EDUCATION (YEAR_DATA, DROP_OUT_PC, PISA,ID_COUNTRY)  VALUES (2002, 25, 34, 'RUS' );
   
   INSERT INTO EDUCATION (YEAR_DATA, DROP_OUT_PC, PISA,ID_COUNTRY)  VALUES (2003, 26, 37, 'RUS' );
   
   INSERT INTO EDUCATION (YEAR_DATA, DROP_OUT_PC, PISA,ID_COUNTRY)  VALUES (2002, 5, 19,'SPA' );
   
   INSERT INTO EDUCATION (YEAR_DATA, DROP_OUT_PC, PISA,ID_COUNTRY)  VALUES (2003, 7, 21, 'SPA' );
   
   INSERT INTO EDUCATION (YEAR_DATA, DROP_OUT_PC, PISA,ID_COUNTRY)  VALUES (2002, 10, 65, 'UK' );
   
   INSERT INTO EDUCATION (YEAR_DATA, DROP_OUT_PC, PISA,ID_COUNTRY)  VALUES (2003, 10, 65,'UK' );
   
   INSERT INTO EDUCATION (YEAR_DATA, DROP_OUT_PC, PISA,ID_COUNTRY)  VALUES (2001, 18, 64, 'AND' );
   
   INSERT INTO EDUCATION (YEAR_DATA, DROP_OUT_PC, PISA,ID_COUNTRY)  VALUES (2000, 20, 67, 'AND' );
   
   INSERT INTO EDUCATION (YEAR_DATA, DROP_OUT_PC, PISA,ID_COUNTRY)  VALUES (2000, 5, 11,'CAT' );
   
   INSERT INTO EDUCATION (YEAR_DATA, DROP_OUT_PC, PISA,ID_COUNTRY)  VALUES (2001, 7, 11, 'CAT' );
   
   INSERT INTO EDUCATION (YEAR_DATA, DROP_OUT_PC, PISA,ID_COUNTRY)  VALUES (2002, 9, 77, 'USA' );
   
   INSERT INTO EDUCATION (YEAR_DATA, DROP_OUT_PC, PISA,ID_COUNTRY)  VALUES (2003, 9.5, 75,'USA' );
   
   SELECT * FROM EDUCATION;

--------------------------------------------------------
--  Information on table EDUCATION
--------------------------------------------------------
 -- COMMENT ON TABLE PROJECT.EDUCATION  IS 'education table. Renders the education 
 -- coeficient estimator. References with table universities and country. Contains a self -- reference.';

--------------------------------------------------------
--  Constraints and information for columns in table EDUCATION
--------------------------------------------------------
  DROP PROCEDURE IF EXISTS pr_update_total_education;

DELIMITER //

CREATE PROCEDURE pr_update_total_education()
BEGIN
	DECLARE cu_id_edu INT(10);
	DECLARE cu_drop_out_pc Float(10,2);
    DECLARE cu_pisa Float(10,2);
    DECLARE cu_total_univ Float(10,2);
    
	DECLARE findebucle INTEGER DEFAULT 1;
		
	DECLARE Cursor_total CURSOR FOR SELECT ID_EDU, DROP_OUT_PC, PISA, TOTAL_UNIV FROM EDUCATION;
    
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET findebucle = 0;

	
	OPEN Cursor_total;
	WHILE findebucle DO
    
		FETCH Cursor_total INTO cu_id_edu, cu_drop_out_pc, cu_pisa, cu_total_univ;
        
		UPDATE EDUCATION SET EDU_COEFICIENT= cu_drop_out_pc + cu_pisa + cu_total_univ WHERE ID_EDU = cu_id_edu;
        
        
	END WHILE;
    
	CLOSE Cursor_total;
END
// 

DELIMITER ;

-- call pr_update_total_education();	

----------------------
   
DELIMITER //

DROP TRIGGER IF EXISTS PROJECT.FER_EDU_COEFICIENT //

create TRIGGER PROJECT.FER_EDU_COEFICIENT
before insert on EDUCATION
FOR EACH ROW
BEGIN
        set new.EDU_COEFICIENT= new.PISA+new.DROP_OUT_PC+ new.TOTAL_UNIV;
END 
//
DELIMITER ;



-------------------------------------------------------
--  table SOCIODEMO
--------------------------------------------------------
DROP TABLE SOCIODEMO;
  CREATE TABLE SOCIODEMO 
   (
	ID_SOCIO TINYINT(4) NOT NULL AUTO_INCREMENT,
    YEAR_DATA YEAR(4), 
	FREEDOM FLOAT(8,3)DEFAULT 0 COMMENT 'A value between -1(no freedom) and 1(freedom)', 
	CIVIL_RISKS FLOAT(4,3) DEFAULT 0 COMMENT 'A value between -1(Weaknesses) and 1(Strengths)',
    RELIGION FLOAT (4,3)DEFAULT 0 COMMENT 'a value between -1(religious) and 1(secular)',
    ID_COUNTRY CHAR(4),
	SOCIO_COEFICIENT FLOAT(6,2)DEFAULT 0,
       primary key (ID_SOCIO),
       FOREIGN KEY (ID_COUNTRY) REFERENCES COUNTRIES(ID_COUNTRY),
       CONSTRAINT COUNTRY_U UNIQUE (ID_COUNTRY, YEAR_DATA)
   ) ;
   
   DESC SOCIODEMO;

insert into SOCIODEMO (YEAR_DATA, FREEDOM, CIVIL_RISKS, RELIGION, ID_COUNTRY) VALUES (2002,75, -0.5,-0.1, 'AND');
insert into SOCIODEMO (YEAR_DATA, FREEDOM, CIVIL_RISKS, RELIGION, ID_COUNTRY) VALUES (2002,79, 0.5,0.1, 'CAT');
insert into SOCIODEMO (YEAR_DATA, FREEDOM, CIVIL_RISKS, RELIGION, ID_COUNTRY) VALUES (2002,79, 0.9,0.1, 'FRA');
insert into SOCIODEMO (YEAR_DATA, FREEDOM, CIVIL_RISKS, RELIGION, ID_COUNTRY) VALUES (2002,55.9, -0.5,-0.1, 'GER');
insert into SOCIODEMO (YEAR_DATA, FREEDOM, CIVIL_RISKS, RELIGION, ID_COUNTRY) VALUES (2002,45.6, 0.8,0.1, 'ISR');
insert into SOCIODEMO (YEAR_DATA, FREEDOM, CIVIL_RISKS, RELIGION, ID_COUNTRY) VALUES (2002,76.6, 0.5,0.1, 'JAP');
insert into SOCIODEMO (YEAR_DATA, FREEDOM, CIVIL_RISKS, RELIGION, ID_COUNTRY) VALUES (2002,65, -0.4,-0.4, 'RUS');
insert into SOCIODEMO (YEAR_DATA, FREEDOM, CIVIL_RISKS, RELIGION, ID_COUNTRY) VALUES (2002,59, 0.5,0.6, 'SPA');
insert into SOCIODEMO (YEAR_DATA, FREEDOM, CIVIL_RISKS, RELIGION, ID_COUNTRY) VALUES (2002,69, 0.1,0.8, 'UK');
insert into SOCIODEMO (YEAR_DATA, FREEDOM, CIVIL_RISKS, RELIGION, ID_COUNTRY) VALUES (2002,70.9, -0.1,-0.1,'USA');

insert into SOCIODEMO (YEAR_DATA, FREEDOM, CIVIL_RISKS, RELIGION, ID_COUNTRY) VALUES (2003,76, -0.5,0.1, 'AND');
insert into SOCIODEMO (YEAR_DATA, FREEDOM, CIVIL_RISKS, RELIGION, ID_COUNTRY) VALUES (2003,76, 0.5,0.1, 'CAT');
insert into SOCIODEMO (YEAR_DATA, FREEDOM, CIVIL_RISKS, RELIGION, ID_COUNTRY) VALUES (2003,77, 0.9,0.1, 'FRA');
insert into SOCIODEMO (YEAR_DATA, FREEDOM, CIVIL_RISKS, RELIGION, ID_COUNTRY) VALUES (2003,57.9, -0.5,0.1, 'GER');
insert into SOCIODEMO (YEAR_DATA, FREEDOM, CIVIL_RISKS, RELIGION, ID_COUNTRY) VALUES (2003,48.6, 0.8,0.1, 'ISR');
insert into SOCIODEMO (YEAR_DATA, FREEDOM, CIVIL_RISKS, RELIGION, ID_COUNTRY) VALUES (2003,88.6, 0.5,0.1, 'JAP');
insert into SOCIODEMO (YEAR_DATA, FREEDOM, CIVIL_RISKS, RELIGION, ID_COUNTRY) VALUES (2003,69, -0.4,-0.2, 'RUS');
insert into SOCIODEMO (YEAR_DATA, FREEDOM, CIVIL_RISKS, RELIGION, ID_COUNTRY) VALUES (2003,99, 0.5,0.6, 'SPA');
insert into SOCIODEMO (YEAR_DATA, FREEDOM, CIVIL_RISKS, RELIGION, ID_COUNTRY) VALUES (2003,99, 0.1,0.8, 'UK');
insert into SOCIODEMO (YEAR_DATA, FREEDOM, CIVIL_RISKS, RELIGION, ID_COUNTRY) VALUES (2003,40.9, -0.1,-0.1,'USA');

SELECT * FROM SOCIODEMO;
--------------------------------------------------------
--  Information on table SOCIODEMO
--------------------------------------------------------
 COMMENT ON TABLE 'PROJECT'.'SOCIODEMO'  IS 'SOCIODEMO table. Renders the SOCIODEMOGRAPHIC coeficient estimator. References with table countries';

--------------------------------------------------------
--  Constraints and information for columns in table sociodemo
--------------------------------------------------------
     
COMMENT ON COLUMN 'PROJECT'.'SOCIODEMO'.'SOCIO_COEFICIENT' IS 'Must be greater than zero (enforced by constraint socio_coefi_min)';
ALTER TABLE 'PROJECT'.'SOCIODEMO' ADD CONSTRAINT 'SOCIO_COEFI_MIN' CHECK ('SOCIO_COEFICIENT' >= 0);





 DROP PROCEDURE IF EXISTS pr_update_total_socio;
DELIMITER //

-- Procedure to updata the SOCIO_COEFICIENT columns


CREATE PROCEDURE pr_update_total_socio()
BEGIN
	DECLARE cu_id_socio INT(10);
	DECLARE cu_freedom Float(10,2);
    DECLARE cu_civil_risks Float(10,2);
    DECLARE cu_religion Float(10,2);
    
	DECLARE findebucle INTEGER DEFAULT 1;
		
	DECLARE Cursor_total CURSOR FOR SELECT ID_SOCIO, FREEDOM, CIVIL_RISKS, RELIGION FROM sociodemo;
    
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET findebucle = 0;

	
	OPEN Cursor_total;
	WHILE findebucle DO
    
		FETCH Cursor_total INTO cu_id_socio, cu_freedom, cu_civil_risks, cu_religion;
        
		UPDATE sociodemo SET SOCIO_COEFICIENT = cu_freedom + cu_civil_risks + cu_religion WHERE ID_SOCIO = cu_id_socio;
        
        
	END WHILE;
    
	CLOSE Cursor_total;
END
// 

DELIMITER ;

-- call pr_update_total_socio();	



  
--------------------------------------------------------
--  table WEALTH
--------------------------------------------------------
DROP TABLE WEALTH;
  CREATE TABLE WEALTH 
   (
	ID_WEALTH TINYINT(4) NOT NULL AUTO_INCREMENT,
    YEAR_DATA YEAR(4), 
	PIB FLOAT(4,3) DEFAULT 0 COMMENT 'A value between 0 (LOWEST PIB) and 1(HIGHEST PIB)', 
	RESOURCES FLOAT(4,3)DEFAULT -1 COMMENT 'A value between -1(poor in resources) and 1(rich in resources)', 
	DEPENDENCY FLOAT(4,3)DEFAULT 0 COMMENT 'A value between -1(Threats) and 1(Opportunities)', 
	ID_COUNTRY CHAR(4),
	WEALTH_COEFICIENT FLOAT(6,2)DEFAULT 0,
       primary key (ID_WEALTH),
       FOREIGN KEY (ID_COUNTRY) REFERENCES COUNTRIES(ID_COUNTRY),
       CONSTRAINT COUNTRY_U UNIQUE (ID_COUNTRY, YEAR_DATA)
   ) ;

insert into WEALTH (YEAR_DATA, PIB, RESOURCES, DEPENDENCY, ID_COUNTRY) VALUES (2002,0.643, -0.3, -0.5, 'SPA');
insert into WEALTH (YEAR_DATA, PIB, RESOURCES, DEPENDENCY, ID_COUNTRY) VALUES (2003,0.655, -0.3, -0.2, 'SPA');
insert into WEALTH (YEAR_DATA, PIB, RESOURCES, DEPENDENCY, ID_COUNTRY) VALUES (2001,0.645, -0.3, -0.2, 'SPA');
insert into WEALTH (YEAR_DATA, PIB, RESOURCES, DEPENDENCY, ID_COUNTRY) VALUES (2001,0.455, 0.3, 0.5,'AND');
insert into WEALTH (YEAR_DATA, PIB, RESOURCES, DEPENDENCY, ID_COUNTRY) VALUES (2002,0.935, 0.3, 0.5,'AND');
insert into WEALTH (YEAR_DATA, PIB, RESOURCES, DEPENDENCY, ID_COUNTRY) VALUES (2003,0.943, 0.3, 0.5,'AND');
insert into WEALTH (YEAR_DATA, PIB, RESOURCES, DEPENDENCY, ID_COUNTRY) VALUES (2001,0.743, -0.3, 0, 'CAT');
insert into WEALTH (YEAR_DATA, PIB, RESOURCES, DEPENDENCY, ID_COUNTRY) VALUES (2002,0.749, -0.33, 0, 'CAT');
insert into WEALTH (YEAR_DATA, PIB, RESOURCES, DEPENDENCY, ID_COUNTRY) VALUES (2003,0.823, -0.4, 0,'CAT');

insert into WEALTH (YEAR_DATA, PIB, RESOURCES, DEPENDENCY, ID_COUNTRY) VALUES (2002,0.643, -0.2, -0.5, 'FRA');
insert into WEALTH (YEAR_DATA, PIB, RESOURCES, DEPENDENCY, ID_COUNTRY) VALUES (2003,0.455, -0.3, -0.2, 'FRA');
insert into WEALTH (YEAR_DATA, PIB, RESOURCES, DEPENDENCY, ID_COUNTRY) VALUES (2002,0.645, -0.2, -0.2, 'GER');
insert into WEALTH (YEAR_DATA, PIB, RESOURCES, DEPENDENCY, ID_COUNTRY) VALUES (2003,0.955, 0.3, 0.5,'GER');
insert into WEALTH (YEAR_DATA, PIB, RESOURCES, DEPENDENCY, ID_COUNTRY) VALUES (2002,0.945, 0.3, 0.2,'ISR');
insert into WEALTH (YEAR_DATA, PIB, RESOURCES, DEPENDENCY, ID_COUNTRY) VALUES (2003,0.943, 0.3, 0.5,'ISR');
insert into WEALTH (YEAR_DATA, PIB, RESOURCES, DEPENDENCY, ID_COUNTRY) VALUES (2002,0.443, -0.3, 0.2, 'JAP');
insert into WEALTH (YEAR_DATA, PIB, RESOURCES, DEPENDENCY, ID_COUNTRY) VALUES (2003,0.749, -0.33, 0.7, 'JAP');
insert into WEALTH (YEAR_DATA, PIB, RESOURCES, DEPENDENCY, ID_COUNTRY) VALUES (2002,0.843, -0.4, 0.8,'RUS');

insert into WEALTH (YEAR_DATA, PIB, RESOURCES, DEPENDENCY, ID_COUNTRY) VALUES (2003,0.243, -0.2, -0.25, 'RUS');
insert into WEALTH (YEAR_DATA, PIB, RESOURCES, DEPENDENCY, ID_COUNTRY) VALUES (2002,0.425, -0.23, -0.2, 'UK');
insert into WEALTH (YEAR_DATA, PIB, RESOURCES, DEPENDENCY, ID_COUNTRY) VALUES (2003,0.645, -0.2, -0.22, 'UK');
insert into WEALTH (YEAR_DATA, PIB, RESOURCES, DEPENDENCY, ID_COUNTRY) VALUES (2002,0.255, 0.32, 0.52,'USA');
insert into WEALTH (YEAR_DATA, PIB, RESOURCES, DEPENDENCY, ID_COUNTRY) VALUES (2003,0.245, 0.2, 0.2,'USA');

--------------------------------------------------------
--  Information on table WEALTH
--------------------------------------------------------
 COMMENT ON TABLE 'PROJECT'.'WEALTH'  IS 'WEALTH table. Renders the country wealth coeficient estimator. References with table countries';

--------------------------------------------------------
--  Constraints and information for columns in table WEALTH
--------------------------------------------------------
 COMMENT ON COLUMN 'PROJECT'.'WEALTH'.'WEALTH_COEFICIENT' IS 'Must be greater than zero (enforced by constraint socio_coefi_min)';
   
 DROP PROCEDURE IF EXISTS pr_update_total_wealth;

DELIMITER //

CREATE PROCEDURE pr_update_total_wealth()
BEGIN
	DECLARE cu_id_wealth INT(10);
	DECLARE cu_pib Float(10,2);
    DECLARE cu_resources Float(10,2);
    DECLARE cu_dependency Float(10,2);
    
	DECLARE findebucle INTEGER DEFAULT 1;
		
	DECLARE Cursor_total CURSOR FOR SELECT ID_WEALTH, PIB, RESOURCES, DEPENDENCY FROM WEALTH;
    
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET findebucle = 0;

	
	OPEN Cursor_total;
	WHILE findebucle DO
    
		FETCH Cursor_total INTO cu_id_wealth, cu_pib, cu_resources, cu_dependency;
        
		UPDATE WEALTH SET WEALTH_COEFICIENT= cu_pib + cu_resources + cu_dependency WHERE ID_WEALTH = cu_id_wealth;
        
        
	END WHILE;
    
	CLOSE Cursor_total;
END
// 

DELIMITER ;

-- call pr_update_total_wealth();	
