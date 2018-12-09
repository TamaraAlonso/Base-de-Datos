CREATE TABLE ALUMNOS (
 	DNI  VARCHAR2(10) CONSTRAINT alu_dni_nn NOT NULL,
	NOMBRE  VARCHAR2(30) CONSTRAINT alu_nombre_nn NOT NULL, 
 	EDAD NUMBER(2) CONSTRAINT edad_min CHECK (edad>5) CONSTRAINT edad_max CHECK (edad<20),
    CURSO NUMBER(1),
	CONSTRAINT DNI_PK PRIMARY KEY (DNI)
    CONSTRAINT alu_edad_mayusculas_ck CHECK (edad=upper(edad)),
   
	);
    
    
   