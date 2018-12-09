CREATE TABLE PERSONAS (
 	DNI  NUMBER(8),
 	NOMBRE  VARCHAR2(15),
 	DIRECCION   VARCHAR2(25),
 	POBLACION  VARCHAR2(20) ,
 	COD_PROV	NUMBER(2), 	
	CONSTRAINT PERS_PK PRIMARY KEY (DNI),	
	CONSTRAINT ASS_1_FK FOREIGN KEY (COD_PROV)
				REFERENCES PROV(COD_PROV) ON DELETE CASCADE
);

CREATE TABLE PROVINCIAS (
 	COD_PROV  NUMBER(2),
 	NOM_PROV  VARCHAR2(15),
 	CONSTRAINT PROV_COD_PK PRIMARY KEY (COD_PROV)
);

RENAME PERSONAS TO CIUDADANOS; /*Cambia el nombre de la tabla PERSONAS a CIUDADANOS.*/

SELECT * FROM USER_CONSTRAINTS
WHERE TABLE_NAME='CIUDADANOS' AND TABLE_NAME='PROVINCIAS'; 