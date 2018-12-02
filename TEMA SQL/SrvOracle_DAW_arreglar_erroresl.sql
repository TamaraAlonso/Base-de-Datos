Error que empieza en la l�nea: 3 del comando :
drop table employees cascade constraint
Informe de error -
Error SQL: ORA-00942: la tabla o vista no existe
00942. 00000 -  "table or view does not exist"
*Cause:    
*Action:

Error que empieza en la l�nea: 4 del comando :
drop table departments cascade constraint
Informe de error -
Error SQL: ORA-00942: la tabla o vista no existe
00942. 00000 -  "table or view does not exist"
*Cause:    
*Action:

Error que empieza en la l�nea: 5 del comando :
drop table articulos cascade constraint
Informe de error -
Error SQL: ORA-00942: la tabla o vista no existe
00942. 00000 -  "table or view does not exist"
*Cause:    
*Action:
Error que empieza en la l�nea: 6 del comando :
drop table fabricantes cascade constraint
Informe de error -
Error SQL: ORA-00942: la tabla o vista no existe
00942. 00000 -  "table or view does not exist"
*Cause:    
*Action:

Error que empieza en la l�nea: 7 del comando :
drop table tiendas cascade constraint
Informe de error -
Error SQL: ORA-00942: la tabla o vista no existe
00942. 00000 -  "table or view does not exist"
*Cause:    
*Action:

Error que empieza en la l�nea: 8 del comando :
drop table pedidos cascade constraint
Informe de error -
Error SQL: ORA-00942: la tabla o vista no existe
00942. 00000 -  "table or view does not exist"
*Cause:    
*Action:

Error que empieza en la l�nea: 9 del comando :
drop table ventas cascade constraint
Informe de error -
Error SQL: ORA-00942: la tabla o vista no existe
00942. 00000 -  "table or view does not exist"
*Cause:    
*Action:
Error que empieza en la l�nea: 13 del comando :
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

Error que empieza en la l�nea: 30 del comando :
create table departments(
   department_id NUMBER(2),
   department_name VARCHAR2(30) CONSTRAINTS dept_name_nn NOT NULL, 
   manager_id NUMBER(3),
   location_id NUMBER(4),
CONSTRAINTS dept_id_pk PRIMARY KEY(deparment_id)
)
Informe de error -
Error SQL: ORA-00904: "DEPARMENT_ID": identificador no v�lido
00904. 00000 -  "%s: invalid identifier"
*Cause:    
*Action:

Error que empieza en la l�nea: 39 del comando :
create table employees
   employee_id NUMBER(6),
   first_name VARCHAR2(25) NOT NULL ,
   last_name VARCHAR2(25),
   email VARCHAR2(25)
      		CONSTRAINT emp_email_uk UNIQUE,
   phone_number NUMBER(12),
   hire_date DATE  DEFAULT SYSDATE ,
   job_id VARCHAR2(10),
   salary NUMBER(8,2),
   comission_pct NUMBER(5,2),
   manager_id NUMBER(3),
   department_id NUMBER(2),
      		CONSTRAINT emp_id_pk PRIMARY KEY(employee_id),
     		CONSTRAINT emp_dept_fk FOREING KEY(department_id)               
      		      REFERENCES departments(departmentes_id)


CREATE TABLE fabricantes (
cod_fabricante VARCHAR2(3) NOT NULL,
nombre  VARCHAR2(15),
pais VARCHAR2(15), 
CONSTRAINT fab_cod_fab_pk PRIMARY KEY(cod_fabricante),
CONSTRAINT tie_upper(nombre = upper(nombre)),
CONTRAINT tie_upper (pais= upper(pais))
)
Informe de error -
Error SQL: ORA-00922: falta la opci�n o no es v�lida
00922. 00000 -  "missing or invalid option"
*Cause:    
*Action:
Error que empieza en la l�nea: 67 del comando :
CREATE TABLE articulos (
articulo VARCHAR2(20) NOT NULL,
cod_fabricante VARCHAR2(3) NOT NULL,
peso NUMBER(3) NOT NULL,
categoria VARCHAR2(10,5) NOT NULL,
precio_venta NUMBER(4),
precio_costo NUMBER(4),
existencias NUMBER(5),
CONSTRAINT art_pk PRIMARY KEY(articulo, cod_fabricante, peso, categoria),
CONSTRAINT art_fab_fk FOREIGN KEY(cod_fabricante) REFERENCES fabricantes(cod_fabricante),
CHECK (precio_venta>0 || precio_costo>0 || peso >0),
CHECK categoria  IN('primero','segundo','tercero')
))
Informe de error -
Error SQL: ORA-00907: falta el par�ntesis derecho
00907. 00000 -  "missing right parenthesis"
*Cause:    
*Action:

Error que empieza en la l�nea: 82 del comando :
CREATE TABLE pedidos (
nif VARCHAR2 (10) NOT NULL,
articulo VARCHAR2 (20) NOT NULL,
cod_fabricante VARCHAR2 (3) NOT NULL,
peso NUMBER(3) NOT NULL,
categoria VARCHAR2(10) NOT NULL,
fecha_pedido DATE SYSDATE NOT NULL,
unidades_pedidas NUMBER(4),
CONSTRAINT ped_pk PRIMARY KEY(nif,articulo,cod_fabricante,peso,categoria,fecha_pedido),
CONSTRAINT ped_fk FOREIGN KEY (cod_fabricante) REFERENCE fabricantes(cod_fabricante),
CONSTRAINT ped_unidades_ck CHECK (unidades_pedidas>0),
CONSTRAINT CHECK (categoria  IN(primero,segundo,tercero)),
CONSTRAINT art_fk FOREIGN KEY (articulo,cod_fabricante,peso,categoria) REFERENCES articulos(articulo,peso,categoria),
CONSTRAINT tie_fk FOREIGN KEY (nif) REFERENCES tiendas(nif)
)
Informe de error -
Error SQL: ORA-00907: falta el par�ntesis derecho
00907. 00000 -  "missing right parenthesis"
*Cause:    
*Action:

Error que empieza en la l�nea: 100 del comando :
CREATE TABLE tiendas (
nif VARCHAR2(10) NOT NULL,
nombre VARCHAR2(20),
direccion  VARCHAR2(20),
poblacion  VARCHAR2(20),
provincia  VARCHAR2(20),
codpostal  VARCHAR2(5),
CONSTRAINT tie_upper (provincia = uppercase(provincia))
CONSTRAINT nif_pk PRIMARY KEY (nif)
)
Informe de error -
Error SQL: ORA-00904: : identificador no v�lido
00904. 00000 -  "%s: invalid identifier"
*Cause:    
*Action:
