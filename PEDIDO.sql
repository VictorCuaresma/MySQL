create database dbRestaurante;
 use dbRestaurante;
 
 create table 	Pedido
 (IDPED INT auto_increment,
 USERPED varchar(80),
 EMAUSPED varchar(80),
 CELUSPED char(9),
 FOODPED varchar(80),
 MSGPED varchar(250),
 PRIMARY KEY (IDPED)
 );
 
 insert into PEDIDO
 (USERPED,EMAUSPED,CELUSPED,FOODPED,MSGPED)
 values
 ('Jose ramirez', 'jose.ramirez@gmail.com', '980439371', 'arroz con pollo','enviar aladireccion av marical'),
 ( 'ana gerrero', 'ana.guerrero@gmail.com', '980439371', 'sopa seca de gallina','nesecito 4 platos');
 
 select*from Pedido;
