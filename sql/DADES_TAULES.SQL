-- DADES TAULES PROJECTE.

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
--  data for table EDUCATION
--------------------------------------------------------

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
   
   
-------------------------------
-- data for education table
--------------------------------
   
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