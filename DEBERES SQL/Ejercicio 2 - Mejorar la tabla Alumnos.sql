
  DESC ALUMNOS;
  
  ALTER TABLE ALUMNOS ADD(
  SEXO VARCHAR2(1) NOT NULL,
  IMPORTE NUMBER (10,2) DEFAULT 0, /*Definir la columna SEXO con la restricción NOT NULL. Sólo podrán introducir los valores M o F.*/
									/* La columna IMPORTE numerica entera de precisión 10 con dos decimales. Por defecto, contendrá el valor 0 .*/
  CONSTRAINT SEX_CK CHECK (SEXO IN ('M','F')
  );
  

  DESC ALUMNOS;
  
SELECT CONSTRAINT_TYPE,CONSTRAINT_NAME,SEARCH_CONDITION --PARA SABER SI HA COGIDO BIEN EL ALTER QUE HA HECHO
FROM USER_CONSTRAINTS
WHERE UPPER(TABLE_NAME)='ALUMNOS';	  

  DESC ALUMNOS	  
  ALTER TABLE ALUMNOS DROP (EDAD); /*Eliminar la columna EDAD.*/
  DESC ALUMNOS
	  
    /*Añadir dos nuevas columnas:*/
  DESC ALUMNOS
	  
  ALTER TABLE alumnos ADD (
  
  FECHA_NAC DATE,
  FECHA_ALTA DATE );/*FECHA_NAC que contiene la fecha de nacimiento.*/
    
  ALTER TABLE ALUMNOS ADD
  CONSTRAINT FEC_ALTA_CK CHECK (FECHA_ALTA>FECHA_NAC);/*Añadir una restricción que haga cumplir que la FECHA_NAC sea siempre anterior a la FECHA_ALTA.*/
    
	  DESC ALUMNOS
	  
	  SELECT OWNER,                   
CONSTRAINT_NAME,          
CONSTRAINT_TYPE,       
TABLE_NAME,      
SEARCH_CONDITION 
	  FROM USER_CONSTRAINTS
	  WHERE UPPER(CONSTRAINT_NAME)='FEC_ALTA';
 --NO SERÍA POSIBLE ELIMINAR LA FECHA DE NACIMIENTO PORQUE HACE REFERENCIA A LA COLUMNA DE LAS RESTRICCIONES
    
	  DESC ALUMNOS
  ALTER TABLE alumnos RENAME COLUMN importe TO tasas /*Cambiar el nombre de la columna IMPORTE que pasará a denominarse TASAS.*/
	);
    
    DESC ALUMNOS
   
