
--------------------------------------------------------
--  table countries
--------------------------------------------------------
drop table COUNTRIES;
CREATE TABLE PROJECT.COUNTRIES 
   (	
    ID_COUNTRY CHAR(4) NOT NULL, 
    COUNTRY_NAME VARCHAR(50)not null, 
    HAPPINESS FLOAT(8,3) DEFAULT 0 not null,
	PRIMARY KEY (ID_COUNTRY)
   );
   
      DESC COUNTRIES;

   
  SELECT * FROM COUNTRIES;
   SHOW TABLES;
   
--------------------------------------------------------
--  table info_history, sub-table of university to keep a back-up of changes
-- so far it is not implemented
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
	INDEX1 float(8,3) DEFAULT 0,
	INDEX2 float(8,3) DEFAULT 0, 
	YEAR_DATA YEAR(4),
    ID_COUNTRY CHAR(4),
    TOTAL FLOAT (8,2)DEFAULT 0,
       PRIMARY KEY (ID_UNI),
       FOREIGN KEY (ID_COUNTRY) REFERENCES COUNTRIES(ID_COUNTRY),
       CONSTRAINT UNIVERSITY_U UNIQUE (UNI_NAME, YEAR_DATA)
  );
  
  DESC UNIVERSITY;
  
   
   
  
--------------------------------------------------------
--  Information on table university
--------------------------------------------------------

COMMENT ON TABLE UNIVERSITY  IS 'Table that stores ratings information of the universitites and renders a total rating which is an index compensate average. The compensations are index1 0.X%, index2 0.X%,index3 0.X%. If a univerity name is deleted or altered a trigger will launch a copy of the old information.
Contains a simple primary key: ID_UNI. References with EDUCATION and INF_HISTORY TABLES';

--------------------------------------------------------
--  Constraints and information for columns in table universities
--------------------------------------------------------

THERE IS A UNIQUE CONSTRAIN. 
THERE IS A TRIGGER IN THIS TABLE
THERE IS A PROCEDURE IN THIS TABLE: The procedure creates the coeficients.

--------------------------------------------------------
--  Procedure that produces the coeficients
--------------------------------------------------------


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

call pr_update_total_university();	


-- TRIGGER THAT CALCULATES THE UNIVERSITY TOTAL VALUE ONCE 
-- SOMEBODY UPDATES THE INDEXS AND SENDS THE NEW TOTAL VALUES 
-- GROUPED BY COUNTRY, TO EDUCATION AND UPDATES THE EDU COEFICIENT


DELIMITER //

DROP TRIGGER IF EXISTS PROJECT.TRI_UPDATE_TOTAL //

create TRIGGER project.TRI_UPDATE_TOTAL

BEFORE insert on UNIVERSITY

FOR EACH ROW
BEGIN
	DECLARE TOTAL_COUNTRY INT(10);
    
 
       set new.TOTAL = new.INDEX1 + new.INDEX2;
        
       SELECT AVG(TOTAL) INTO TOTAL_COUNTRY FROM UNIVERSITY WHERE ID_COUNTRY=NEW.ID_COUNTRY GROUP BY ID_COUNTRY;
        
        UPDATE EDUCATION SET TOTAL_UNIV = NEW.TOTAL WHERE YEAR_DATA=NEW.YEAR_DATA AND ID_COUNTRY=NEW.ID_COUNTRY;
        
        UPDATE EDUCATION SET EDU_COEFICIENT = NEW.TOTAL + PISA + DROP_OUT_PC WHERE YEAR_DATA=NEW.YEAR_DATA AND ID_COUNTRY=NEW.ID_COUNTRY;
    END 
//

DELIMITER ;


   
      
   SELECT * FROM UNIVERSITY;
   SHOW TABLES;

--------------------------------------------------------
--  table EDUCATION
--------------------------------------------------------
DROP TABLE EDUCATION;
  CREATE TABLE EDUCATION 
   (
	ID_EDU TINYINT(4) NOT NULL AUTO_INCREMENT,
    YEAR_DATA YEAR(4), 
	DROP_OUT_PC float(8,3) DEFAULT 0 COMMENT 'pc stands for X per cent', 
	PISA float(8,3) DEFAULT 0, 
	TOTAL_UNIV FLOAT (8,2),
    ID_COUNTRY CHAR(4),
	EDU_COEFICIENT FLOAT(6,2)DEFAULT 0,
       primary key (ID_EDU),
       FOREIGN KEY (ID_COUNTRY) REFERENCES COUNTRIES(ID_COUNTRY),
       CONSTRAINT COUNTRY_U UNIQUE (ID_COUNTRY, YEAR_DATA)
   ) ;
   
  


--------------------------------------------------------
--  Information on table EDUCATION
--------------------------------------------------------
 -- Some data (total_univ) is updated via a trigger in the university table.
-- The trigger also updates the Edu_coeficient for those values.
 
--------------------------------------------------------
--  Constraints and information for columns in table EDUCATION
--------------------------------------------------------
-- there is a procedure to calculate the totals
-- there is no trigger because the trigger in univerity already updates
-- the changes in this table
--------------------------------------------------------
--  Procedure that produces the coeficients
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
-- so far there is no need for this trigger,
-- but just in case there is a need for a manual update
----------------------------
   
DELIMITER //

DROP TRIGGER IF EXISTS PROJECT.FER_EDU_COEFICIENT //

create TRIGGER PROJECT.FER_EDU_COEFICIENT
after insert on EDUCATION
FOR EACH ROW
BEGIN
        set new.EDU_COEFICIENT= new.PISA+new.DROP_OUT_PC+ new.TOTAL_UNIV;
END 
//
DELIMITER ;

-------------------------------
-- data for education table
--------------------------------
   
   DESC EDUCATION;
   
   SELECT * FROM EDUCATION;

-------------------------------------------------------
--  table SOCIODEMO
--------------------------------------------------------
DROP TABLE SOCIODEMO;
  CREATE TABLE SOCIODEMO 
   (
	ID_SOCIO TINYINT(4) NOT NULL AUTO_INCREMENT,
    YEAR_DATA YEAR(4), 
	FREEDOM FLOAT(8,3)DEFAULT 0 COMMENT 'A value between -1(no freedom) and 1(freedom)', 
	CIVIL_RISKS float(8,3) DEFAULT 0 COMMENT 'A value between -1(Weaknesses) and 1(Strengths)',
    RELIGION float(8,3)DEFAULT 0 COMMENT 'a value between -1(religious) and 1(secular)',
    ID_COUNTRY CHAR(4),
	SOCIO_COEFICIENT FLOAT(6,2)DEFAULT 0,
       primary key (ID_SOCIO),
       FOREIGN KEY (ID_COUNTRY) REFERENCES COUNTRIES(ID_COUNTRY),
       CONSTRAINT COUNTRY_U UNIQUE (ID_COUNTRY, YEAR_DATA)
   ) ;
   
   
--------------------------------------------------------
--  Information on table SOCIODEMO
--------------------------------------------------------
 COMMENT ON TABLE 'PROJECT'.'SOCIODEMO'  IS 'SOCIODEMO table. Renders the SOCIODEMOGRAPHIC coeficient estimator. References with table countries';

--------------------------------------------------------
--  Constraints and information for columns in table sociodemo
--------------------------------------------------------

--------------------------------------------------------
--  Constraints and information for columns in table universities
--------------------------------------------------------

THERE IS A UNIQUE CONSTRAIN. 
THERE IS A TRIGGER IN THIS TABLE
THERE IS A PROCEDURE IN THIS TABLE: The procedure creates the coeficients.

--------------------------------------------------------
--  Procedure that produces the coeficients
--------------------------------------------------------
-- Procedure to updata the SOCIO_COEFICIENT columns

 DROP PROCEDURE IF EXISTS pr_update_total_socio;
DELIMITER //




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


-----------------------------
-- TRIGGER THAT UPDATES THE COEFICIENT ONCE VALUES ARE UPDATED FROM WEB
----------------------


DELIMITER //

DROP TRIGGER IF EXISTS PROJECT.TRI_UPD_SOCIO_COEFICIENT //

create TRIGGER project.TRI_UPD_SOCIO_COEFICIENT

AFTER insert on SOCIODEMO

FOR EACH ROW
BEGIN
	DECLARE TOTAL_COUNTRY INT(10);
     
       set new.SOCIO_COEFICIENT = new.FREEDOM + new.CIVIL_RISKS + new.RELIGION;
        
       UPDATE SOCIODEMO SET SOCIO_COEFICIENT = NEW.SOCIO_COEFICIENT WHERE YEAR_DATA=NEW.YEAR_DATA AND ID_COUNTRY=NEW.ID_COUNTRY;
               
    END 
//

DELIMITER ;




------------------
-- data for sociodemo table
------------------

DESC SOCIODEMO;


SELECT * FROM SOCIODEMO;

  
--------------------------------------------------------
--  table WEALTH
--------------------------------------------------------
DROP TABLE WEALTH;
  CREATE TABLE WEALTH 
   (
	ID_WEALTH TINYINT(4) NOT NULL AUTO_INCREMENT,
    YEAR_DATA YEAR(4), 
	PIB float(8,3) DEFAULT 0 COMMENT 'A value between 0 (LOWEST PIB) and 1(HIGHEST PIB)', 
	RESOURCES float(8,3)DEFAULT -1 COMMENT 'A value between -1(poor in resources) and 1(rich in resources)', 
	DEPENDENCY float(8,3) DEFAULT 0 COMMENT 'A value between -1(Threats) and 1(Opportunities)', 
	ID_COUNTRY CHAR(4),
	WEALTH_COEFICIENT FLOAT(6,2)DEFAULT 0,
       primary key (ID_WEALTH),
       FOREIGN KEY (ID_COUNTRY) REFERENCES COUNTRIES(ID_COUNTRY),
       CONSTRAINT COUNTRY_U UNIQUE (ID_COUNTRY, YEAR_DATA)
   ) ;

DESC WEALTH;
   
SELECT * FROM WEALTH;
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
