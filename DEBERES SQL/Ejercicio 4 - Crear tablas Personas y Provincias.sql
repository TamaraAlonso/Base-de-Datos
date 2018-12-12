DROP TABLE personas CASCADE CONSTRAINTS;
DROP TABLE provincias CASCADE CONSTRAINTS;

CREATE TABLE personas(
 	dni  NUMBER(8),
 	nombre  VARCHAR2(15),
 	direccion   VARCHAR2(25),
 	poblacion  VARCHAR2(20) ,
 	cod_prov	NUMBER(2), 	
	CONSTRAINT dni_PK PRIMARY KEY (dni),	
	CONSTRAINT cod_prov_FK FOREIGN KEY (cod_prov)
  REFERENCES provincias(cod_prov) ON DELETE CASCADE
);

CREATE TABLE provincias (
 	cod_prov  NUMBER(2),
 	nom_prov VARCHAR2(15),
 	CONSTRAINT cod_prov_PK PRIMARY KEY (cod_prov)
);

SELECT * 
FROM USER_CONSTRAINTS
WHERE TABLE_NAME='personas'; 


SELECT*
FROM USER_CONSTRAINTS
WHERE TABLE_NAME='provincias'; /*las consultas necesarias para visualizar las restricciones definidas
 para las tablas PROVINCIAS y PERSONAS.*/