--1
 /*A partir de la tabla EMPLE, obtener el APELLIDO, SALARIO y DEPT_NO 
de los empleados cuyo salario sea mayor de 200000 de los departamentos 10 y 20.*/

SELECT APELLIDO, SALARIO, DEPT_NO -- no poner nunca el select*from emple; si queremos consultar las tablas debería ser: desc*tables;
FROM EMPLE
WHERE SALARIO > 200000 AND DEPT_NO IN (10, 20);

--2
/*A partir de la tabla EMPLE, obtener aquellos 
empleados cuyo apellido empiece por una ‘J’. */

SELECT APELLIDO 
FROM EMPLE
WHERE upper(APELLIDO) LIKE 'J%';

--3
/*Obtener aquellos empleados cuyo apellido tengan una 
‘R’ en la segunda posición*/

SELECT APELLIDO
FROM EMPLE
WHERE upper(APELLIDO) LIKE '_R%';

--4
/*Obtener aquellos empleados cuyo 
apellido empiece por ‘A’ y tengan una ‘O’ en su interior.*/

SELECT APELLIDO
FROM EMPLE
WHERE upper(APELLIDO) LIKE 'A%O%';

--5
/*A partir de la tabla EMPLE, obtener el apellido y el salario
de los empleados cuyo salario esté comprendido entre 150000 y 200000.*/

SELECT APELLIDO, SALARIO
FROM EMPLE
WHERE SALARIO BETWEEN 150000 AND 200000;

--6
/*A partir de la tabla EMPLE, obtener el apellido y el salario de los 
empleados cuyo salario NO esté comprendido entre 150000 y 200000.*/

SELECT APELLIDO, SALARIO
FROM EMPLE
WHERE SALARIO NOT BETWEEN 150000 AND 200000;

--7
/*Consultar los apellidos de la tabla EMPLE cuyo oficio sea ‘VENDEDOR’,
‘ANALISTA’ o ’EMPLEADO’.*/

SELECT APELLIDO
FROM EMPLE
WHERE upper(OFICIO) IN ('VENDEDOR','ANALISTA','EMPLEADO');

--8
/*Consultar los apellidos de la tabla EMPLE cuyo oficio no sea ni ‘VENDEDOR’,
ni ‘ANALISTA’ ni ’EMPLEADO’.*/

SELECT APELLIDO
FROM EMPLE
WHERE upper(OFICIO) NOT IN ('VENDEDOR','ANALISTA','EMPLEADO');

--9
/*A partir de la tabla EMPLE, obtener el apellido de los empleados cuyo 
departamento sea 10 o 30.*/

SELECT APELLIDO
FROM EMPLE
WHERE DEPT_NO IN (10,30);

--10
/*Consultar los empleados cuyo departamento no sea ni 10 ni 30.*/

SELECT EMP_NO
FROM EMPLE
WHERE DEPT_NO NOT IN (10,30);

--11
/*Consultar los apellidos de los empleados cuya comisión es nula.*/

SELECT APELLIDO,COMISION_PCT
FROM EMPLE
WHERE COMISION_PCT IS NULL;

--12
/*Consultar los apellidos de los empleados cuya comisión no es nula.*/

SELECT APELLIDO, COMISION_PCT
FROM EMPLE
WHERE COMISION_PCT IS NOT NULL;

--13
/*Mostrar el apellido y el oficio de los empleados que no tienen director.*/

SELECT APELLIDO, OFICIO
FROM EMPLE
WHERE ID_JEFE IS NULL;

/*

/*Consultar los oficios de la empresa pero sin que aparezcan repeticiones.*/

SELECT DISTINCT OFICIO --lo que hace distinct no elimina filas, lo que hace es eliminar valores repetidos
FROM EMPLE;

/*Seleccionar de la tabla EMPLE a todos los empleados del departamento 20.
Además, la consulta debe aparecer ordenada por APELLIDO. En el caso de que
dos empleados tengan el mismo apellido, ordenarlos de mayor a menor salario.
Los campos que hay que consultar son: número de empleado,apellido, oficio y número de departamento. */

SELECT EMP_NO, APELLIDO, OFICIO, DEPT_NO
FROM EMPLE
WHERE DEPT_NO=20
ORDER BY APELLIDO,SALARIO;


/*Consulta de los empleados cuyo oficio sea ‘ANALISTA’ ordenado por número de empleado. */

SELECT APELLIDO, OFICIO
FROM EMPLE
WHERE upper(OFICIO)='ANALISTA'
ORDER BY EMPLE_NO;