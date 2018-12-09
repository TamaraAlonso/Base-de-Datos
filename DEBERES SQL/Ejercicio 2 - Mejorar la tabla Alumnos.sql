CREATE TABLE alumnos (
 	dni  VARCHAR2(10) CONSTRAINT alu_dni_nn NOT NULL,
	nombre  VARCHAR2(30) CONSTRAINT alu_nombre_nn NOT NULL, 
 	edad NUMBER(2) CONSTRAINT edad_min CHECK (edad>5) CONSTRAINT edad_max CHECK (edad<20),
    curso NUMBER(1),
	CONSTRAINT dni_PK PRIMARY KEY (dni)
    CONSTRAINT alu_edad_mayusculas_ck CHECK (edad=upper(edad)),
	
    INSERT INTO alumnos (sexo) CONSTRAINT sexo_fem('F') CONSTRAINT sexo_masc ('M'), /*Definir la columna SEXO con la restricción NOT NULL. Sólo podrán introducir los valores M o F.*/
    INSERT INTO alumnos (importe) NUMBER (10,2) DEFAULT 0, /* La columna IMPORTE numerica entera de precisión 10 con dos decimales. Por defecto, contendrá el valor 0 .*/
    ALTER TABLE alumnos DROP (edad), /*Eliminar la columna EDAD.*/
    
    /*Añadir dos nuevas columnas:*/
    ALTER TABLE alumnos ADD (fecha_nac VARCHAR2() NOT NULL), /*FECHA_NAC que contiene la fecha de nacimiento.*/
    ALTER TABLE alumnos ADD (fecha_alta VARCHAR2() NOT NULL), /*FECHA_ALTA que es la fecha de ingreso en la escuela.*/
    /*Añadir una restricción que haga cumplir que la FECHA_NAC sea siempre anterior a la FECHA_ALTA.*/
    

    ALTER TABLE alumnos RENAME COLUMN importe TO tasas /*Cambiar el nombre de la columna IMPORTE que pasará a denominarse TASAS.*/
	);
    
    
   