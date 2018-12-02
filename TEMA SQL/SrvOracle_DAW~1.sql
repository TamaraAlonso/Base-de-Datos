Error que empieza en la línea: 3 del comando :
drop table employees cascade constraints
Informe de error -
Error SQL: ORA-00942: la tabla o vista no existe
00942. 00000 -  "table or view does not exist"
*Cause:    
*Action:

Table DEPARTMENTS borrado.

Table ARTICULOS borrado.


Table FABRICANTES borrado.


Table TIENDAS borrado.

Error que empieza en la línea: 8 del comando :
drop table pedidos cascade constraints
Informe de error -
Error SQL: ORA-00942: la tabla o vista no existe
00942. 00000 -  "table or view does not exist"
*Cause:    
*Action:

Error que empieza en la línea: 9 del comando :
drop table ventas cascade constraints
Informe de error -
Error SQL: ORA-00942: la tabla o vista no existe
00942. 00000 -  "table or view does not exist"
*Cause:    
*Action:

Error que empieza en la línea: 13 del comando :
CREATE TABLE ventas(
nif VARCHAR2(10) NOT NULL,
articulo VARCHAR2(20) NOT NULL,
cod_fabricante VARCHAR2(3) NOT NULL,
peso NUMBER(3) NOT NULL,
categoria VARCHAR2(10) NOT NULL,
fecha_venta DATE DEFAULT SYSDATE,
unidades_vendidas NUMBER(4), 
CONSTRAINT ven_pk PRIMARY KEY(nif, articulo, cod_fabricante, peso, categoria, fecha_venta),
CONSTRAINT ven_fab_fk FOREIGN KEY(cod_fabricante) REFERENCES fabricantes(codigo),
CHECK (unidades_vendidas>0),
CHECK (categoria IN('primero','segundo','tercero')),
CONSTRAINT ven_art_fk FOREIGN KEY(articulo, cod_fabricante, peso, categoria) REFERENCES
articulos(articulo, cod_fabricante, peso, categoria),
CONSTRAINT ven_tie_fk FOREIGN KEY(nif) REFERENCES tiendas(nif)
)


Informe de error -
Error SQL: ORA-00942: la tabla o vista no existe
00942. 00000 -  "table or view does not exist"
*Cause:    
*Action:
Table DEPARTMENTS creado.


Error que empieza en la línea: 39 del comando :
create table employees(
   employee_id NUMBER(6),
   first_name VARCHAR2(25) NOT NULL ,
   last_name VARCHAR2(25),
   email VARCHAR2(25)
      		CONSTRAINT emp_email_uk UNIQUE,
   phone_number NUMBER(12),
   hire_date DEFAULT SYSDATE ,
   job_id VARCHAR2(10),
   salary NUMBER(8,2),
   comission_pct NUMBER(5,2),
   manager_id NUMBER(3),
   department_id NUMBER(2),
      		CONSTRAINT emp_id_pk PRIMARY KEY(employee_id),
     		CONSTRAINT emp_dept_fk FOREIGN KEY(department_id)               
      		      REFERENCES departments(departments_id)
  )
Informe de error -
Error SQL: ORA-02263: debe especificar el tipo de dato para esta columna
02263. 00000 -  "need to specify the datatype for this column"
*Cause:    The required datatype for the column is missing.
*Action:   Specify the required datatype.

Table FABRICANTES creado.

Table ARTICULOS creado.


Error que empieza en la línea: 85 del comando :
CREATE TABLE pedidos (
nif VARCHAR2 (10) NOT NULL,
articulo VARCHAR2 (20) NOT NULL,
cod_fabricante VARCHAR2 (3) NOT NULL,
peso NUMBER(3) NOT NULL,
categoria VARCHAR2(10) NOT NULL,
fecha_pedido SYSDATE NOT NULL,
unidades_pedidas NUMBER(4),
CONSTRAINT ped_pk PRIMARY KEY(nif,articulo,cod_fabricante,peso,categoria,fecha_pedido),
CONSTRAINT ped_fk FOREIGN KEY (cod_fabricante) REFERENCES fabricantes(cod_fabricante),
CONSTRAINT ped_unidades_ck CHECK (unidades_pedidas>0),
CONSTRAINT CHECK (categoria  IN(primero,segundo,tercero)),
CONSTRAINT art_fk FOREIGN KEY (articulo,cod_fabricante,peso,categoria) REFERENCES articulos(articulo,peso,categoria),
CONSTRAINT tie_fk FOREIGN KEY (nif) REFERENCES tiendas(nif)
)
Informe de error -
Error SQL: ORA-00902: tipo de dato no válido
00902. 00000 -  "invalid datatype"
*Cause:    
*Action:

Table TIENDAS creado.

