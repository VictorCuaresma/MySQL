/* Crear base de datos dbGamarraMarket */
DROP DATABASE IF EXISTS dbGamarraMarket;
CREATE DATABASE dbGamarraMarket
DEFAULT CHARACTER SET utf8;

/* Poner en uso la base de datos dbGamarraMarket */
USE dbGamarraMarket;

/* Crear la tabla CLIENTE */
CREATE TABLE CLIENTE
(
    id int auto_increment,
    tipo_documento char(3),
    numero_documento char(9),
    nombres varchar(60),
    apellidos varchar(90),
    email varchar(80),
    celular char(9),
    fecha_nacimiento date,
    activo bool default '1',
    CONSTRAINT cliente_pk PRIMARY KEY (id)
);

/* Crear la tabla VENDEDOR */
CREATE TABLE VENDEDOR
(
    id int auto_increment,
    tipo_documento char(3),
    numero_documento char(9),
    nombres varchar(60),
    apellidos varchar(90),
    salario decimal(8,2),
    celular char(9),
    email varchar(80),
    activo bool default '1',
    CONSTRAINT vendedor_pk PRIMARY KEY (id)
);

/* Crear la tabla PRENDA */
CREATE TABLE PRENDA
(
	id int auto_increment,
    descripcion varchar(90),
    marca varchar(50),
    cantidad int,
    talla varchar(10),
    precio decimal(8,2),
    activo bool default '1',
    CONSTRAINT prenda_pk PRIMARY KEY (id)
);

/* Crear la tabla VENTA */
CREATE TABLE VENTA
(
	id int auto_increment,
    fecha_hora timestamp default current_timestamp,
    cliente_id int,
    vendedor_id int,
    activo bool default '1',
    CONSTRAINT venta_pk PRIMARY KEY (id)
);

/* Crear la tabla VENTA_DETALLE */
CREATE TABLE VENTA_DETALLE
(
	id int auto_increment,
    venta_id int,
    prenda_id int,
    cantidad int,
    CONSTRAINT venta_detalle_pk PRIMARY KEY (id)
);

/* Relacionar tabla VENTA con CLIENTE */
ALTER TABLE venta
	ADD CONSTRAINT VENTA_CLIENTE FOREIGN KEY (cliente_id)
    REFERENCES cliente (id)
    ON UPDATE CASCADE
    ON DELETE CASCADE
;

/* Relacionar tabla VENTA con VENDEDOR */
ALTER TABLE venta
	ADD CONSTRAINT VENTA_VENDEDOR FOREIGN KEY (vendedor_id)
    REFERENCES vendedor (id)
    ON UPDATE CASCADE
    ON DELETE CASCADE
;

/* Relacionar tabla VENTA_DETALLE con VENTA */
ALTER TABLE venta_detalle
	ADD CONSTRAINT VENTA_DETALLE_VENTA FOREIGN KEY (venta_id)
    REFERENCES venta (id)
    ON UPDATE CASCADE
    ON DELETE CASCADE
;

/* Relacionar tabla VENTA_DETALLE con PRENDA */
ALTER TABLE venta_detalle
	ADD CONSTRAINT VENTA_DETALLE_PRENDA FOREIGN KEY (prenda_id)
    REFERENCES prenda (id)
    ON UPDATE CASCADE
    ON DELETE CASCADE
;

/* Ver base de datos activa */
SELECT database();

/* Listar tablas de la base de datos */
SHOW TABLES;

/* Listar relaciones de tablas de la base de datos activa */
SELECT 
    i.constraint_name, k.table_name, k.column_name, 
    k.referenced_table_name, k.referenced_column_name
FROM 
    information_schema.TABLE_CONSTRAINTS i 
LEFT JOIN information_schema.KEY_COLUMN_USAGE k 
ON i.CONSTRAINT_NAME = k.CONSTRAINT_NAME 
WHERE i.CONSTRAINT_TYPE = 'FOREIGN KEY' 
AND i.TABLE_SCHEMA = DATABASE();

INSERT INTO cliente
(tipo_documento,
numero_documento,
nombres,
apellidos,
email,
celular,
fecha_nacimiento)
VALUES
('DNI', '77889955', 'Alberto', 'Solano Pariona',
'alberto.pariona@empresa.com', '998456103', STR_TO_DATE('10/02/1970', '%d/%m/%Y'));

SELECT * FROM cliente;

INSERT INTO cliente
(tipo_documento,
numero_documento,
nombres,
apellidos,
email,
celular,
fecha_nacimiento)
VALUES
('DNI', '45781233', 'Alicia', 'Garcia Campos',
'', '', STR_TO_DATE('20/03/1980', '%d/%m/%Y'));

INSERT INTO cliente
(tipo_documento,
numero_documento,
nombres,
apellidos,
email,
celular,
fecha_nacimiento)
VALUES
('CNE', '315487922', 'Juana', 'Avila Chumpitaz',
'juana.avila@gmail.com', '923568741', STR_TO_DATE('06/06/1986', '%d/%m/%Y'));

SELECT * FROM cliente;

INSERT INTO cliente
(tipo_documento,
numero_documento,
nombres,
apellidos,
email,
celular,
fecha_nacimiento)
VALUES
('CNE', '122116633', 'Ana', 'Enriquez Flores',
'ana.enriquez@empresa.com', '', STR_TO_DATE('10/02/1970', '%d/%m/%Y'));

INSERT INTO cliente
(tipo_documento,
numero_documento,
nombres,
apellidos,
email,
celular,
fecha_nacimiento)
VALUES
('CNE', '088741589', 'Claudia', 'Perales Ortiz',
'claudia.perales@yahoo.com', '997845263', STR_TO_DATE('25/07/1981', '%d/%m/%Y'));

SELECT * FROM cliente;

INSERT INTO cliente
(tipo_documento,
numero_documento,
nombres,
apellidos,
email,
celular,
fecha_nacimiento)
VALUES
('DNI', '45122587', 'Mario', 'Barrios Martinez',
'mario.barrios@outlook.com', '986525871', STR_TO_DATE('10/10/1987', '%d/%m/%Y'));

INSERT INTO cliente
(tipo_documento,
numero_documento,
nombres,
apellidos,
email,
celular,
fecha_nacimiento)
VALUES
('CNE', '175258564', 'Brunela', 'Tarazona Guerra',
'brunela.tarazona@gmail.com', '995236741', STR_TO_DATE('06/06/1990', '%d/%m/%Y'));

INSERT INTO cliente
(tipo_documento,
numero_documento,
nombres,
apellidos,
email,
celular,
fecha_nacimiento)
VALUES
('DNI', '47142536', 'Alejandro', 'Jimenez Huapaya',
'', '941525365', STR_TO_DATE('01/06/1989', '%d/%m/%Y'));

INSERT INTO cliente
(tipo_documento,
numero_documento,
nombres,
apellidos,
email,
celular,
fecha_nacimiento)
VALUES
('DNI', '15352585', 'Claudia', 'Marquez Litano',
'claudia.marquez@gmail.com', '985814723', STR_TO_DATE('01/10/1991', '%d/%m/%Y'));

INSERT INTO cliente
(tipo_documento,
numero_documento,
nombres,
apellidos,
email,
celular,
fecha_nacimiento)
VALUES
('CNE', '465772587', 'Mario', 'Rodriguez Mayo',
'mario.rodriguez@outlook.com', '912662587', STR_TO_DATE('10/11/1987', '%d/%m/%Y'));

INSERT INTO cliente
(tipo_documento,
numero_documento,
nombres,
apellidos,
email,
celular,
fecha_nacimiento)
VALUES
('CNE', '837952514', 'Luisa', 'Guerra Ibarra',
'luisa.guerra@yahoo.com', '974422136', STR_TO_DATE('21/12/1988', '%d/%m/%Y'));

INSERT INTO cliente
(tipo_documento,
numero_documento,
nombres,
apellidos,
email,
celular,
fecha_nacimiento)
VALUES
('DNI', '74142585', 'Pedro Al...', 'Candela Valenzuela',
'pedro.candela@gmail.com', '94148525', STR_TO_DATE('30/06/1995', '%d/%m/%Y'));

INSERT INTO cliente
(tipo_documento,
numero_documento,
nombres,
apellidos,
email,
celular,
fecha_nacimiento)
VALUES
('DNI', '53298147', 'Angel M...', 'Rojas Avila',
'angel.rojas@outlook.com', '', STR_TO_DATE('02/03/1975', '%d/%m/%Y'));

INSERT INTO cliente
(tipo_documento,
numero_documento,
nombres,
apellidos,
email,
celular,
fecha_nacimiento)
VALUES
('DNI', '11453265', 'Hilario F...', 'Avila Huapaya',
'', '985514326', STR_TO_DATE('02/05/2000', '%d/%m/%Y'));

INSERT INTO cliente
(tipo_documento,
numero_documento,
nombres,
apellidos,
email,
celular,
fecha_nacimiento)
VALUES
('CNE', '757472186', 'Octavio ...', 'Marquez Osorio',
'octavio.marquez@yahoo.es', '966223141', STR_TO_DATE('22/09/2000', '%d/%m/%Y'));

INSERT INTO cliente
(tipo_documento,
numero_documento,
nombres,
apellidos,
email,
celular,
fecha_nacimiento)
VALUES
('CNE', '558693219', 'Manolo E...', 'Vasquez Saravia',
'manolo.vasquez@outlook.es', '966223141', STR_TO_DATE('22/09/2000', '%d/%m/%Y'));

INSERT INTO cliente
(tipo_documento,
numero_documento,
nombres,
apellidos,
email,
celular,
fecha_nacimiento)
VALUES
('DNI', '41552567', 'Genovev...', 'Ortiz Quispe',
'genoveva.ortiz@outlook.es', '92564137', STR_TO_DATE('12/04/2003', '%d/%m/%Y'));

INSERT INTO cliente
(tipo_documento,
numero_documento,
nombres,
apellidos,
email,
celular,
fecha_nacimiento)
VALUES
('DNI', '49985471', 'Oscar C...', 'Quiroz Zavala',
'', '988223145', STR_TO_DATE('12/10/2004', '%d/%m/%Y'));

INSERT INTO cliente
(tipo_documento,
numero_documento,
nombres,
apellidos,
email,
celular,
fecha_nacimiento)
VALUES
('DNI', '44992217', 'Veronica', 'Romero Vargas',
'veronica.romero@yahoo.com', '', STR_TO_DATE('25/08/2002', '%d/%m/%Y'));

INSERT INTO cliente
(tipo_documento,
numero_documento,
nombres,
apellidos,
email,
celular,
fecha_nacimiento)
VALUES
('DNI', '00253641', 'Eliseo', 'Prada Ortiz',
'eliseo.prada@yahoo.com', '', STR_TO_DATE('15/09/2004', '%d/%m/%Y'));

SELECT * FROM cliente;

INSERT INTO VENDEDOR 
(tipo_documento,
numero_documento,
nombres, 
apellidos,
salario,  
celular,
email) 
VALUES 
('DNI', '85471236', 'Enrique', 'Perez Manco', '1500.00', '96521873', 'enrique.perez@outlook.com');

SELECT * FROM vendedor;

INSERT INTO VENDEDOR 
(tipo_documento,
numero_documento,
nombres, 
apellidos,
salario,  
celular,
email) 
VALUES 
('DNI', '47259136', 'Sofia', 'Avila Solis', '1350.00', '', '');

SELECT * FROM vendedor;

INSERT INTO VENDEDOR 
(tipo_documento,
numero_documento,
nombres, 
apellidos,
salario,  
celular,
email) 
VALUES 
('DNI', '61542280', 'Marcela', 'Napaico Cama', '1600.00', '965874357', 'marcela.napaico@gmail.com');

INSERT INTO VENDEDOR 
(tipo_documento,
numero_documento,
nombres, 
apellidos,
salario,  
celular,
email) 
VALUES 
('CNE', '742536140', 'Carmelo', 'Rodriguez Chauca', '1550.00', '', 'carmelo.rodriguez@yahoo.com');

SELECT * FROM vendedor;

INSERT INTO prenda
(descripcion,
marca,
cantidad, 
talla,
precio) 
VALUES 
('pantalon jeans', 'Levis', '60', '28', '65.80');

INSERT INTO prenda
(descripcion,
marca,
cantidad, 
talla,
precio) 
VALUES 
('camisa manga corta', 'Adams', '75', '16', '55.00');

INSERT INTO prenda
(descripcion,
marca,
cantidad, 
talla,
precio) 
VALUES 
('polo sport', 'Australia', '100', '16', '40.00');

INSERT INTO prenda
(descripcion,
marca,
cantidad, 
talla,
precio) 
VALUES 
('camisa manga larga', 'Newport', '150', '16', '42.50');

INSERT INTO prenda
(descripcion,
marca,
cantidad, 
talla,
precio) 
VALUES 
('pijama para caballeros', 'Adams', '180', '28', '79.50');

INSERT INTO prenda
(descripcion,
marca,
cantidad, 
talla,
precio) 
VALUES 
('corbata', 'Maxwell', '85', '16', '14.50');

INSERT INTO prenda
(descripcion,
marca,
cantidad, 
talla,
precio) 
VALUES 
('pijama para dama', 'Adams', '170', '24', '55.50');

INSERT INTO prenda
(descripcion,
marca,
cantidad, 
talla,
precio) 
VALUES 
('pantalon jeans', 'Australia', '200', '28', '68.50');

INSERT INTO prenda
(descripcion,
marca,
cantidad, 
talla,
precio) 
VALUES 
('camisa sport', 'John Holden', '85', '16', '88.50');

INSERT INTO prenda
(descripcion,
marca,
cantidad, 
talla,
precio) 
VALUES 
('shorts jeans', 'Pepe Jeans', '185', '28', '77.20');

SELECT * FROM prenda;

INSERT INTO venta
(fecha_hora,
cliente_id,
vendedor_id) 
VALUES 
('2023-05-01 19:04:08', '4', '1');

INSERT INTO venta
(fecha_hora,
cliente_id,
vendedor_id) 
VALUES 
('2023-05-01 19:04:08', '6', '3');

INSERT INTO venta
(fecha_hora,
cliente_id,
vendedor_id) 
VALUES 
('2023-05-01 19:04:08', '10', '1');

INSERT INTO venta
(fecha_hora,
cliente_id,
vendedor_id) 
VALUES 
('2023-05-01 19:04:08', '18', '4');

SELECT * FROM venta;

INSERT INTO venta_detalle
(venta_id,
prenda_id,
cantidad) 
VALUES 
('1', '6', '3');

INSERT INTO venta_detalle
(venta_id,
prenda_id,
cantidad) 
VALUES 
('1', '3', '5');

INSERT INTO venta_detalle
(venta_id,
prenda_id,
cantidad) 
VALUES 
('1', '2', '7');

INSERT INTO venta_detalle
(venta_id,
prenda_id,
cantidad) 
VALUES 
('2', '2', '3');

INSERT INTO venta_detalle
(venta_id,
prenda_id,
cantidad) 
VALUES 
('3', '7', '4');

INSERT INTO venta_detalle
(venta_id,
prenda_id,
cantidad) 
VALUES 
('3', '10', '6');

INSERT INTO venta_detalle
(venta_id,
prenda_id,
cantidad) 
VALUES 
('3', '2', '6');

INSERT INTO venta_detalle
(venta_id,
prenda_id,
cantidad) 
VALUES 
('3', '5', '7');

INSERT INTO venta_detalle
(venta_id,
prenda_id,
cantidad) 
VALUES 
('4', '2', '4');

INSERT INTO venta_detalle
(venta_id,
prenda_id,
cantidad) 
VALUES 
('4', '5', '3');

SELECT * FROM venta_detalle;

/* Actualizar Numero de Celular de Mario Mayo */
UPDATE cliente
    SET celular = '922881101'
    WHERE nombres = 'Mario' AND apellidos = 'Rodriguez Mayo';
    
SELECT * FROM cliente;

/* Actualizar de angel manuel su numero de celular*/
UPDATE cliente
    SET celular = '977226604'
    WHERE nombres = 'Angel M...' AND apellidos = 'Rojas Avila';

SELECT * FROM cliente;

/*Eliminar lógicamente los clientes cuyo DNI son: 11453265, 74142585 y 49985471.*/
UPDATE cliente
    SET activo = 0
    WHERE numero_documento = '11453265';
       

UPDATE cliente
    SET activo = 0
    WHERE numero_documento = '74142585';
    
UPDATE cliente
    SET activo = 0
    WHERE numero_documento = '49985471';
    
SELECT * FROM cliente; 

/*Los clientes cuyos DNI son: 15352585,53298147,41552567 han perdido su celular por tanto debe estar en blanco.*/
UPDATE cliente
    SET celular = ''
    WHERE numero_documento = '15352585';
SELECT * FROM cliente; 

UPDATE cliente
    SET celular = ''
    WHERE numero_documento = '53298147';
SELECT * FROM cliente; 

UPDATE cliente
    SET celular = ''
    WHERE numero_documento = '41552567';
SELECT * FROM cliente; 

/* El cliente Oscar César Quiroz Zavala será reactivado y debemos actualizar su nuevo correo: oscar.quiroz@yahoo.es.*/
UPDATE cliente
    SET email = 'oscar.quiroz@yahoo.es'
    WHERE numero_documento = '49985471';
SELECT * FROM cliente; 

/* Agregar los datos de los siguientes clientes y vendedor.*/
INSERT INTO cliente
(tipo_documento,
numero_documento,
nombres,
apellidos,
email,
celular,
fecha_nacimiento)
VALUES
('DNI', '88225463', 'Gustavo Tadeo', 'Quispe Solorzano',
'gustavo.quispe@gmail.com', '', STR_TO_DATE('13/10/2001', '%d/%m/%Y'));

INSERT INTO cliente
(tipo_documento,
numero_documento,
nombres,
apellidos,
email,
celular,
fecha_nacimiento)
VALUES
('DNI', '15753595', 'Daniela', 'Solis Vargas',
'dianela.solis@outlook.com', '', STR_TO_DATE('09/11/1993', '%d/%m/%Y'));

INSERT INTO cliente
(tipo_documento,
numero_documento,
nombres,
apellidos,
email,
celular,
fecha_nacimiento)
VALUES
('DNI', '76314895', 'Milton Gregorio', 'Vasquez Iturrizaga',
'milton.gregorio@yahoo.es', '974815233', STR_TO_DATE('22/06/2004', '%d/%m/%Y'));

INSERT INTO cliente
(tipo_documento,
numero_documento,
nombres,
apellidos,
email,
celular,
fecha_nacimiento)
VALUES
('DNI', '84725001', 'Veronica', 'Ancajima Araujo',
'veronica.ancajima@yahoo.com', '', STR_TO_DATE('07/11/1980', '%d/%m/%Y'));

INSERT INTO cliente
(tipo_documento,
numero_documento,
nombres,
apellidos,
email,
celular,
fecha_nacimiento)
VALUES
('DNI', '11228514', 'Felicita', 'Marroquin Candela',
'felicita.marroquin@outllok.com', '966001472', STR_TO_DATE('06/06/2006', '%d/%m/%Y'));

INSERT INTO cliente
(tipo_documento,
numero_documento,
nombres,
apellidos,
email,
celular,
fecha_nacimiento)
VALUES
('DNI', '15436952', 'Luhana', 'Ortiz Rodriguez',
'luhana.ortiz@outlook.com', '960405017', STR_TO_DATE('25/11/1980', '%d/%m/%Y'));

SELECT * FROM cliente; 

INSERT INTO VENDEDOR 
(tipo_documento,
numero_documento,
nombres, 
apellidos,
salario,  
celular,
email) 
VALUES 
('DNI', '742536140', 'Gustavo Tadeo', 'Quispe Solorzano', '', '', 'gustavo.quispe@gmail.com');

INSERT INTO VENDEDOR 
(tipo_documento,
numero_documento,
nombres, 
apellidos,
salario,  
celular,
email) 
VALUES 
('DNI', '742536140', 'Gustavo Tadeo', 'Quispe Solorzano', '', '', 'gustavo.quispe@gmail.com');

INSERT INTO VENDEDOR 
(tipo_documento,
numero_documento,
nombres, 
apellidos,
salario,  
celular,
email) 
VALUES 
('DNI', '15753595', 'Daniela', 'Solis Vargas', '', '', 'daniela.solis@outlook.com');

INSERT INTO VENDEDOR 
(tipo_documento,
numero_documento,
nombres, 
apellidos,
salario,  
celular,
email) 
VALUES 
('DNI', '76314895', 'Milton Gregorio', 'Vasquez Iturrizaga', '', '974815233', 'milton.gregorio@yahoo.es');

INSERT INTO VENDEDOR 
(tipo_documento,
numero_documento,
nombres, 
apellidos,
salario,  
celular,
email) 
VALUES 
('DNI', '84725001', 'Veronica', 'Ancajima Araujo', '', '', 'veronica.ancajima@yahoo.com');

INSERT INTO VENDEDOR 
(tipo_documento,
numero_documento,
nombres, 
apellidos,
salario,  
celular,
email) 
VALUES 
('DNI', '11228514', 'Felicita', 'Marroquin Candela', '', '966001472', 'felicita.marroquin@outlook.com');

INSERT INTO VENDEDOR 
(tipo_documento,
numero_documento,
nombres, 
apellidos,
salario,  
celular,
email) 
VALUES 
('DNI', '15436952', 'Luhana', 'Ortiz Rodriguez', '', '960405017', 'luhana.ortiz@outlook.com');

SELECT * FROM vendedor;

/*Actualizar el precio del polo sport de marca Australia a 45.00*/
UPDATE prenda
    SET precio = '45.00'
    WHERE descripcion = 'polo sport';
    
SELECT * FROM prenda;

/*Cambiar el nombre de la prenda Corbata por Corbata Michi elegante*/
UPDATE prenda
    SET descripcion = 'Corbata Michi Elegante'
    WHERE descripcion = 'corbata';
    
SELECT * FROM prenda;

/*Eliminar físicamente las prendas: Camisa manga corta y Camisa Sport.*/
UPDATE prenda
    SET activo = 0
    WHERE descripcion = 'camisa manga corta';
    
UPDATE prenda
    SET activo = 0
    WHERE descripcion = 'camisa sport';
    
SELECT * FROM prenda;

/*Eliminar físicamente a la vendedora Marcela Napaico Cama*/
UPDATE vendedor
    SET activo = 0
    WHERE numero_documento = '61542280';
    
SELECT * FROM vendedor;

/*Eliminar físicamente los clientes cuyos números de documentos son: 47142536 y  77889955*/
UPDATE cliente
    SET activo = 0
    WHERE numero_documento = '47142536';
    
UPDATE cliente
    SET activo = 0
    WHERE numero_documento = '77889955';

SELECT * FROM cliente;

/*Eliminar todos los clientes nacidos en el año 1980*/
DELETE FROM cliente
WHERE YEAR (fecha_nacimiento) = 1980;

SELECT * FROM cliente;

/*Listar las columnas con los nombre, apellidos, celular*/
select nombres , apellidos, celular  from cliente;

select 
nombres AS "NOMBRE",
apellidos AS "APELLIDOS",
celular AS "MOVIL"
from cliente;

select 
nombres AS "NOMBRE",
apellidos AS "APELLIDOS",
celular AS "MOVIL",
email AS "CORREO ELECTRONICO"
from cliente;

select * from prenda;

/* Lista la descripcion , marca y Precio Unitario en la tabla prenda*/
select descripcion , marca, precio  from prenda;
select 
descripcion AS "DESCRIPCION",
marca AS "MARCA",
precio AS "PRECIO UNITARIO"
from prenda;

select * from cliente;
select 
nombres AS "NOMBRE",
apellidos AS "APELLIDOS",
celular AS "MOVIL",
email AS "CORREO ELECTRONICO",
tipo_documento AS "DOCUMENTO"
from cliente
where tipo_documento = "DNI";

/*Muestra todos los clientes cuyo ID sea mayor o igual que 5*/
select 
nombres AS "NOMBRE",
apellidos AS "APELLIDOS",
celular AS "MOVIL",
email AS "CORREO ELECTRONICO",
id AS "ID"
from cliente
where id >= "5";

/* Prendas: Listar todas aquellas prendas cuya cantidad de stop se igual mayor que 50*/ 
select 
descripcion AS "DESCRIPCION",
marca AS "MARCA",
precio AS "PRECIO UNITARIO",
cantidad AS "CANTIDAD"
from prenda
where cantidad >= "50";

/* Prendas: Listar todas aquellas prendas cuya cantidad de stop se igual mayor que 50 y en precio mayo que 50*/ 
select 
descripcion AS "DESCRIPCION",
marca AS "MARCA",
cantidad AS "CANTIDAD",
precio AS "PRECIO UNITARIO"
from prenda
where cantidad >= "50"*precio <= "50";

select 
"apellidos" + "nombres" 
from cliente;

SELECT 
    concat(apellidos, ', ', nombres) as'NOMBRES',
    celular as'CELULAR', 
    email as 'CORREO ELECTRONICO',
    tipo_documento as 'DOCUMENTO',
    id as 'ID'
FROM cliente
where
    id >= 5;

SELECT 
    concat(apellidos, ', ', nombres) as'NOMBRES',
    concat(tipo_documento, ' / ', numero_documento) as'DOCUMENTO',
    concat('ID: ', id) as'ID',
    celular as'CELULAR', 
    email as 'CORREO ELECTRONICO'
FROM cliente
where
    id >= 5;

/*Cantidad y precio unitario tener el monto total*/
select 
descripcion,
cantidad,
precio,
round(cantidad*precio) AS "TOTAL"
from prenda;

SELECT 
descripcion AS 'DESCRIPCION', 
marca AS 'MARCA', 
precio AS 'PRECIO UNITARIO', 
cantidad AS 'STOCK', 
round(precio * cantidad, 2) AS 'TOTAL', 
round(cantidad * precio * (0.03), 2) AS 'DESCUENTO' 
FROM prenda;

/* Obtener el total a pagar con el descuento*/
SELECT 
        cantidad  ,
        descripcion ,
        precio ,
        round(cantidad*precio) AS 'TOTAL',
        (cantidad*precio)*(0.03) as 'DESCUENTO',
        (cantidad*precio - (cantidad*precio)*(0.03))  AS 'TOTAL APAGAR'
        FROM
        prenda;

/*Nacimiento y edad*/
SELECT 
    concat(apellidos, ', ', nombres) as'NOMBRES',
    concat(tipo_documento, ' / ', numero_documento) as'DOCUMENTO',
    concat('ID: ', id) as 'ID',
    TIMESTAMPDIFF(YEAR, fecha_nacimiento, CURDATE()) AS edad,
    DATE_FORMAT(fecha_nacimiento, '%Y-%m-%d') AS fecha_nacimiento_calc,
    celular as'CELULAR', 
    email as 'CORREO ELECTRONICO'
FROM cliente;
    
select * from vendedor;

/*En vendedor NOMBRES , APELLIDOS , SALARIO , EMAIL Y CELULAR*/
SELECT 
    CONCAT(UPPER(apellidos), ', ',nombres) AS 'nombre',
    salario as 'SALARIO',
    email as 'CORREO ELECTRONICO',
    celular as'CELULAR'
FROM vendedor;

select * from cliente;

/*SI EL ACTIVO ESTA EN CERO ES QUE NO ESTA ACTIVO ESTA DE BAJA Y UNO ES QUE ESTA ACTIVO */
select
apellidos,
case
when activo = 1 then "activo"
else 'inactivo' 
end as estado
from cliente; 
