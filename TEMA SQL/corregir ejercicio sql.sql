REM **** Borrado de las tablas

drop table employees cascade constraints;
drop table departments cascade constraints;
drop table articulos cascade constraints;
drop table fabricantes cascade constraints;
drop table tiendas cascade constraints;
drop table pedidos cascade constraints;
drop table ventas cascade constraints;

--las FK nos dicen el orden que tenemos que seguir de la misma manera que nos ha pasado con VENTAS


REM **** Creación de las tablas

create table departments(
   department_id NUMBER(2),
   department_name VARCHAR2(30) CONSTRAINT dept_name_nn NOT NULL, --quito la S final a CONSTRAINT aunque no da error
   manager_id NUMBER(3),
   location_id NUMBER(4),
CONSTRAINT dept_id_pk PRIMARY KEY(department_id) --Nombre colummna corregido (habia que poner una t)
);


create table employees( --También faltaba este ( del principio
   employee_id NUMBER(6),
   first_name VARCHAR2(25) NOT NULL ,
   last_name VARCHAR2(25),
   email VARCHAR2(25)
      		CONSTRAINT emp_email_uk UNIQUE,
   phone_number NUMBER(12),
   hire_date DATE DEFAULT SYSDATE ,
   job_id VARCHAR2(10),
   salary NUMBER(8,2),
   comission_pct NUMBER(5,2),
   manager_id NUMBER(3),
   department_id NUMBER(2),
   CONSTRAINT emp_id_pk PRIMARY KEY(employee_id),
   CONSTRAINT emp_dept_fk FOREIGN KEY(department_id) --FOREIGN mal escrito           
   REFERENCES departments(departments_id) --Esta columna departmentes_id no existe
    )---Faltaba
    ;--Faltaba.En los scripts tambien puede aparecer una / en vez del ;


CREATE TABLE fabricantes (
cod_fabricante VARCHAR2(3) NOT NULL,
nombre VARCHAR2(15),
pais VARCHAR2(15), 
CONSTRAINT fab_cod_fab_pk PRIMARY KEY(cod_fabricante),
CONSTRAINT fab_nombre_ CHECK (nombre = upper (nombre)),
--CHEK fab_nombre_mayusculas (nombre=upper(nombre)),
-- la solucion sería:
-- CONSTRAINT fab_nombre_mayusculas_ck CHECK (nombre=upper(nombre)),
CONSTRAINT fab_pais_ CHECK (nombre = upper (pais))
--CHEK fab_pais_mayusculas (pais=upper(pais)),

);


CREATE TABLE articulos (
articulo VARCHAR2(20)  NOT NULL, --si aun siendo NOT NULL le queremos poner nosotros un nombre lo pondriamos: articulo VARCHAR2(20) contraint art_artic_NN NOT NULL,
cod_fabricante VARCHAR2(3), --quitar el NOT NULL va implicito en la restriccion PRIMARY
peso NUMBER(3) NOT NULL,
categoria NUMBER(10,5) NOT NULL,
precio_venta NUMBER(4),
precio_costo NUMBER(4),
existencias NUMBER(5),
CONSTRAINT art_pk PRIMARY KEY(articulo, cod_fabricante, peso, categoria), --tendriamos que quitar el NOT NULL de la tabla porque ponerlo en este constraint entre () significa lo mismo
CONSTRAINT art_fab_fk FOREIGN KEY(cod_fabricante) REFERENCES fabricantes(cod_fabricante),
--Hay tres restricciones en una. Hay que separarlas
CHECK (precio_venta>0), 
--CONSTRAINT art_precioventa_ck CHECK (precio_venta>0), -- faltaba la palabra reservada CONSTRAINT, el nombre de la constraint
CHECK (precio_costo>0), 
--CONSTRAINT art_precioventa_ck CHECK (precio_costo>0),
CHECK (peso >0), 
--CONSTRAINT art_precioventa_ck CHECK (peso>0),
CHECK (categoria IN('primero','segundo','tercero')
--el operador IN compara categoria con todos (primero,segundo y tercero) se utiliza ese. Si fuera solo uno sería un =. Como parecen alfanuméricos por eso va con ''.
-- la solucion para la última:
-- CONTRAINT art_categoria_ck CHECK (categoria IN ('primero','segundo','tercero')) -- faltaba 
));

CREATE TABLE tiendas ( 
nif VARCHAR2(10) CONSTRAINT tie_nif_pk PRIMARY KEY,--mal escrito  y le ponemos nosotros nuestro nombre
nombre VARCHAR2(20),
direccion  VARCHAR2(20),
poblacion  VARCHAR2(20),
provincia  VARCHAR2(20),
codpostal  VARCHAR2(5),
CONSTRAINT tie_upper CHECK (provincia = upper(provincia))
-- falta la palabra CHECK. Ademas la funcion no es UPPERCASE
);

CREATE TABLE pedidos (
nif VARCHAR2 (10), --quitamos los NOT NULL que habia porque viene en el PRIMARY KEY (como en el de arriba)
articulo VARCHAR2 (20),
cod_fabricante VARCHAR2 (3),
peso NUMBER(3),
categoria VARCHAR2(10),
fecha_pedido DATE DEFAULT SYSDATE, --esto significa que despues del DEFAULT le pones la fecha del dia de hoy.
unidades_pedidas NUMBER(4),
CONSTRAINT ped_pk PRIMARY KEY(nif,articulo,cod_fabricante,peso,categoria,fecha_pedido),
CONSTRAINT ped_fk FOREIGN KEY (cod_fabricante) REFERENCES fabricantes(cod_fabricante),-- la palabra REFERENCES mal escrita porque le faltaba la S
CONSTRAINT ped_unidades_ck CHECK (unidades_pedidas>0),
CONSTRAINT CHECK (categoria  IN('primero','segundo','tercero')),-- falta el nombre de la constraint y las comillas en las cadenas
CONSTRAINT art_fk FOREIGN KEY (articulo,cod_fabricante,peso,categoria) REFERENCES articulos(articulo,cod_fabricante,peso,categoria), --hay que poner todos los atributos que estan dentro de la PK de la que haces referencia. Es decir, que tienes que poner dentro lo que tiene el () de la PK, en este caso, de ARTICULOS
--corregir columnas que forman la PRIMARY de ARTICULOS
-- ademas NO da error sintactico, pero ponemos bien el nombre de la constraint la nomenclatura
CONSTRAINT tie_fk FOREIGN KEY (nif) REFERENCES tiendas(nif) -- no da error sintactico,
);
-- si escribimos algo [] es que es opcional
-- la restriccion a nivel de columna seria | escribiendola en ella
-- | PRIMARY KEY ...
-- esta última es para hacer restriccion a nivel de columna

CREATE TABLE ventas(
nif VARCHAR2(10), --quitamos el NOT NULL
articulo VARCHAR2(20),
cod_fabricante VARCHAR2(3),
peso NUMBER(3),
categoria VARCHAR2(10),
fecha_venta DATE DEFAULT SYSDATE,
unidades_vendidas NUMBER(4), 
CONSTRAINT ven_pk PRIMARY KEY(nif, articulo, cod_fabricante, peso, categoria, fecha_venta),
CONSTRAINT ven_fab_fk FOREIGN KEY(cod_fabricante) REFERENCES cod_fabricantes(codigo),
CHECK (unidades_vendidas>0),
--CONSTRAINT ven_unidades_ck CHECK (unidades_vendidas>0) -- ponemos nosotros nuestro nuevo nombre a la excepcion
CHECK (categoria IN('primero','segundo','tercero')),
CONSTRAINT ven_art_fk FOREIGN KEY(articulo, cod_fabricante, peso, categoria) REFERENCES
articulos(articulo, cod_fabricante, peso, categoria),
CONSTRAINT ven_tie_fk FOREIGN KEY(nif) REFERENCES tiendas(nif)
);

/* LA TABLA A LA QUE SE REFIERE NO ES VENTAS SINO A LAS TABLAS FABRICANTES,ARITCULOS Y TIENDAS
A LAS QUE HACE REFERENCIA EN LAS CONSTRAINT DE TIPO FK.
LA SOLUCION SERIA QUE ESTA TABLA DEBERIA IR DESPUES DE LAS DE FABRICANTES,ARITUCLOS Y TIENDAS*/