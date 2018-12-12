
  ALTER TABLE ALUMNOS ADD(
  SEXO VARCHAR2(1) NOT NULL,
  IMPORTE NUMBER (10,2) DEFAULT 0, /*Definir la columna SEXO con la restricción NOT NULL. Sólo podrán introducir los valores M o F.*/
									/* La columna IMPORTE numerica entera de precisión 10 con dos decimales. Por defecto, contendrá el valor 0 .*/
  CONSTRAINT SEX_CK CHECK (SEXO = 'M' OR SEXO = 'H')
  );
  
  DESC ALUMNOS;
  
  ALTER TABLE ALUMNOS DROP (EDAD); /*Eliminar la columna EDAD.*/
    
    /*Añadir dos nuevas columnas:*/
  ALTER TABLE alumnos ADD (
  
  FECHA_NAC DATE,
  FECHA_ALTA DATE );/*FECHA_NAC que contiene la fecha de nacimiento.*/
    
  ALTER TABLE ALUMNOS MODIFY (
  CONSTRAINT FEC_ALTA_CK CHECK (FECHA_ALTA>TO_DATE(FECHA_NAC,'DD,MM,YYYY'));/*Añadir una restricción que haga cumplir que la FECHA_NAC sea siempre anterior a la FECHA_ALTA.*/
    
 --NO SERÍA POSIBLE ELIMINAR LA FECHA DE NACIMIENTO PORUE HACE REFERENCIA A LA COLUMNA DE LAS RESTRICCIONES
    
  ALTER TABLE alumnos RENAME COLUMN importe TO tasas /*Cambiar el nombre de la columna IMPORTE que pasará a denominarse TASAS.*/
	);
    
    
   