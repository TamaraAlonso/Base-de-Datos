DESC USER_CONSTRAINTS;;

SELECT*
FROM USER_CONSTRAINTS
WHERE TABLE_NAME = 'ALUMNOS';

/*Para cada restricción debes indicar el nombre de la restricción, el nombre de la tabla y el tipo de restricción.

¿Hay alguna restricción NOT NULL?. ¿De qué tipo es?.

Nos dán las siguientes sentencias INSERT, para añadir al final de nuestro script SQL.*/

SELECT TABLE_NAME, CONSTRAINT_NAME,CONSTRAINT_TYPE
FROM USER_CONSTRAINTS
WHERE TABLE_NAME = 'ALUMNOS';

INSERT   INTO   ALUMNOS VALUES('1111','Pepe',4,1);
--ERROR PORQUE EL NOMBRE DEBE ESTAR EN MAYUS

INSERT   INTO   ALUMNOS VALUES('1111','PEPE',4,1);
--ERROR PORQUE HEMOS PREDETERMINADO QUE LA EDAD TIENE QUE ESTAR ENTRE 5 Y 20

INSERT   INTO   ALUMNOS VALUES('1112','PEPE',10,2);
--BIEN

INSERT   INTO   ALUMNOS VALUES('1113','MARIA',32,2);
--ERROR PORQUE HEMOS PUESTO LA EDAD TIENE QUE SER ENTRE 5 Y 20

INSERT   INTO   ALUMNOS VALUES('2222','MARIA',12,5);
--ERROR PORQUE HEMOS DETERMINADO QUE EL CURSO DEBE SER O 1, O 2 O 3

INSERT   INTO   ALUMNOS VALUES('2224','MARiA',22,3);
--ERROR PORQUE LA I DEL NOMBRE ESTÁ EN MINÚSCULAS Y LA EDAD SE PASA DE 20