DROP TABLE ALUMNOS CASCADE CONSTRAINTS;

CREATE TABLE ALUMNOS (
 	DNI  VARCHAR2(10),
	NOMBRE  VARCHAR2(30) CONSTRAINT alu_nombre_nn NOT NULL, 
 	EDAD NUMBER(2) ,
    CURSO NUMBER(1),
	CONSTRAINT DNI_PK PRIMARY KEY (DNI),
    CONSTRAINT EDA_CK CHECK (EDAD BETWEEN 5 AND 20),
	CONSTRAINT ALU_NOM_CK CHECK (NOMBRE=UPPER(NOMBRE)),
    CONSTRAINT CUR_CK CHECK (CURSO IN (1,2,3))
	);
    
    
   